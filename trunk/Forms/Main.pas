unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, TlHelp32, PsApi, ProcessInfo, AppInfo, Addresses,
  MemoryDeclaration, TextUtils, ExitThread, Memory, Player, StatusThread,
  ExtCtrls, TrayThread, Healing, HealingThread, Hotkey, Input, GUI, AntiDebugThread,
  StrUtils, Location, LbCipher, LbClass;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    menuModules: TMenuItem;
    clientList: TListBox;
    menuModulesCavebot: TMenuItem;
    menuModulesHealing: TMenuItem;
    menuModulesHotkeys: TMenuItem;
    menuModulesTargeting: TMenuItem;
    menuModulesOthers: TMenuItem;
    menuViews: TMenuItem;
    menuViewsEngStates: TMenuItem;
    menuViewsWptAdd: TMenuItem;
    menuSettings: TMenuItem;
    TrayIcon: TTrayIcon;
    TrayIconMenu: TPopupMenu;
    trayShow: TMenuItem;
    trayExit: TMenuItem;
    menuSettingsCloseOnExit: TMenuItem;
    menuSettingsPauseBot: TMenuItem;
    menuSettingsPauseBotExceptHealing: TMenuItem;
    menuSettingsLockCL: TMenuItem;
    RijndaelEncryption: TLbRijndael;
    Alerts1: TMenuItem;
    Spy1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure RefreshClientList;
    procedure clientListClick(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure trayShowClick(Sender: TObject);
    procedure trayExitClick(Sender: TObject);
    procedure menuSettingsCloseOnExitClick(Sender: TObject);
    procedure menuModulesHealingClick(Sender: TObject);
    procedure menuViewsEngStatesClick(Sender: TObject);
    procedure menuSettingsLockCLClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure onStatusChange;
  end;

var
  MainForm: TMainForm;
  ProcInfo: TProcessInfo;
  AppsInfo: TAppInfo;
  TibiaPID, SelfPID: Integer;
  TibiaHandle: Cardinal;
  Memory: TMemory;
  Player: TPlayer;
  HadClient: Boolean;
  HealingForm: THealingForm;
  HealingModule: THealingThread;
  ADThread: TAntiDebug;
  GUI: TTibiaGUI;
  ExitThr: TExitThread;
  StatusThr: TStatusThread;
  TrayThr: TTrayThread;

implementation

{$R *.dfm}

function GetVersion(sFileName:string): string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(sFileName), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(sFileName), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

procedure TMainForm.RefreshClientList;
var
  WindowInfo: TWindowItem;
  I: integer;
  A: TStringList;
begin
  A := TStringList.Create;
  clientList.Clear;
  AppsInfo.UpdateList;
  for I := 0 to AppsInfo.RunningApps.Count - 1 do
  begin
    WindowInfo := AppsInfo.RunningApps[i];
    if (WindowInfo.WindowClass = 'TibiaClient') and (GetVersion(WindowInfo.AppPath) = '8.7.1.0') then
    begin
      if MemoryDeclaration.BLPosition(WindowInfo.ProcessID) = -1 then
      begin
        clientList.Items.Add('[' + inttostr(WindowInfo.ProcessID) + '] Offline');
      end
      else
      begin
        clientList.Items.Add('[' + inttostr(WindowInfo.ProcessID) + '] ' + ReadString(WindowInfo.ProcessID, Addresses.bl_Start + 4 + Addresses.bl_StepCreatures * BLPosition(WindowInfo.ProcessID)));
      end;
    end;
  end;
  if TibiaPID <> 0 then
  begin
    for I := 0 to clientList.Items.Count - 1 do
    begin
      Split('[', clientList.Items[i], A);
      Split(']', A[1], A);
      if TibiaPID = strtoint(A[0]) then
      begin
        clientList.ItemIndex := I;
        Break;
      end;
    end;
  end;
  A.Free;
  clientList.Items.Add('<click to refresh>');
end;

procedure TMainForm.trayExitClick(Sender: TObject);
begin
  TrayIcon.Visible := False;
  Application.Terminate;
end;

procedure TMainForm.TrayIconDblClick(Sender: TObject);
begin
  Show;
  FormStyle := TFormStyle.fsStayOnTop;
  FormStyle := TFormStyle.fsNormal;
end;

procedure TMainForm.trayShowClick(Sender: TObject);
begin
  Show;
  FormStyle := TFormStyle.fsStayOnTop;
  FormStyle := TFormStyle.fsNormal;
end;

procedure TMainForm.clientListClick(Sender: TObject);
var
  A: TStringList;
  I: Integer;
begin
  A := TStringList.Create;
  if clientList.ItemIndex = clientList.Items.Count - 1 then
  begin
    RefreshClientList;
  end
  else if clientList.ItemIndex <> -1 then
  begin
    Split('[', clientList.Items[clientList.ItemIndex], A);
    Split(']', A[1], A);
    TibiaPID := strtoint(A[0]);
    for I := 0 to AppsInfo.RunningApps.Count - 1 do
    begin
      if AppsInfo.RunningApps[I].ProcessID = TibiaPID then
      begin
        TibiaHandle := AppsInfo.RunningApps[I].Handle;
      end;
    end;
    HadClient := True;
  end;
  A.Free;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  Hide;
  if TibiaPID = 0 then
  begin
    TrayIcon.Visible := False;
    Application.Terminate;
  end;
end;

function GetAppVersion:string;
var
  Size, Size2: DWord;
  Pt, Pt2: Pointer;
begin
  Size := GetFileVersionInfoSize(PChar (ParamStr (0)), Size2);
  if Size > 0 then
  begin
    GetMem (Pt, Size);
    try
      GetFileVersionInfo (PChar (ParamStr (0)), 0, Size, Pt);
      VerQueryValue (Pt, '\', Pt2, Size2);
      with TVSFixedFileInfo (Pt2^) do
      begin
        Result:= IntToStr (HiWord (dwFileVersionMS)) + '.' +
          IntToStr (LoWord (dwFileVersionMS)) + '.' +
          IntToStr (HiWord (dwFileVersionLS)) + '.' +
          IntToStr (LoWord (dwFileVersionLS));
      end;
    finally
      FreeMem (Pt);
    end;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  self.Caption := 'Insanus Bot ' + GetAppVersion + ' for 8.71';
  GetWindowThreadProcessId(self.Handle, @SelfPID);
  HadClient := False;
  Memory := TMemory.Create;
  Player := TPlayer.Create;
  AppsInfo := TAppInfo.Create(self);
  ProcInfo := TProcessInfo.Create(self);
  ADThread := TAntiDebug.Create(true);
  //ADThread.Start;
  RefreshClientList;
  TibiaPID := 0;
  ExitThr := TExitThread.Create(true);
  ExitThr.Priority := TThreadPriority.tpNormal;
  ExitThr.Interval := 500;
  ExitThr.Start;
  StatusThr := TStatusThread.Create(true);
  StatusThr.Priority := TThreadPriority.tpNormal;
  StatusThr.Interval := 500;
  StatusThr.Start;
  TrayThr := TTrayThread.Create(true);
  TrayThr.Priority := TThreadPriority.tpNormal;
  TrayThr.Interval := 2500;
  TrayThr.Start;
  HealingModule := THealingThread.Create(true);
  HealingModule.Priority := TThreadPriority.tpNormal;
  HealingModule.Interval := 800;
  HealingModule.Start;
  HealingForm := THealingForm.Create(nil);
  HealingForm.Show;
  HealingForm.Hide;
  GUI := TTibiaGUI.Create;
end;

procedure TMainForm.menuModulesHealingClick(Sender: TObject);
begin
  HealingForm.Show;
  HealingForm.FormStyle := fsStayOnTop;
  HealingForm.FormStyle := fsNormal;
end;

procedure TMainForm.menuSettingsCloseOnExitClick(Sender: TObject);
begin
  if menuSettingsCloseOnExit.Checked = False then
  begin
    HadClient := False;
  end;
end;

procedure TMainForm.menuSettingsLockCLClick(Sender: TObject);
begin
  if clientList.Enabled then
  begin
    clientList.Enabled := False;
  end
  else
  begin
    clientList.Enabled := True;
  end;
end;

procedure TMainForm.menuViewsEngStatesClick(Sender: TObject);
var
  one,two,three,four,five: Integer;
  output: string;
begin
  {if GUI.Equipment.EquipmentMinimized then
  begin
    showmessage('minimized');
  end
  else
  begin
    showmessage('maximized');
  end;
  Input.SendClickPoint(GUI.Equipment.EquipmentPosition);
  {for one := 0 to 3 do
  begin
    output := output + inttohex(GUI.Container.GetContainerAddress(one), 8) + 'Y: ' + inttostr(GUI.Container.GetContainerY(one)) + ' Height: ' + inttostr(GUI.Container.GetContainerHeight(one)) + ' Scroll: ' + inttostr(GUI.Container.GetContainerScrollPoint(one)) + ' Name: ' + GUI.Container.GetContainerName(one) + #13;
  end;
  showmessage(output);}
  Input.SendClickPoint(GUI.Equipment.EquipmentPosition);
  //Input.SendDragPoint(GUI.Equipment.EqLHandPosition, GUI.Equipment.EqArrowPosition);
end;

procedure TMainForm.onStatusChange;
begin
  RefreshClientList;
end;

end.
