unit ExitThread;

interface

uses
  Windows, Classes, ProcessInfo, Forms, TlHelp32, Messages;

type
  TExitThread = class(TThread)
  private
    ProcInfo: TProcessInfo;
    _Interval: Integer;
    function GetInterval: Integer;
    procedure SetInterval(Value: Integer);
  protected
    procedure Execute; override;
  published
    procedure KillProcess(hWindowHandle: HWND);
    property Interval: Integer read GetInterval write SetInterval default 1000;
  end;

implementation

uses Main;

function TExitThread.GetInterval: Integer;
begin
  Result := _Interval;
end;

procedure TExitThread.SetInterval(Value: Integer);
begin
  _Interval := Value;
end;

procedure TExitThread.KillProcess(hWindowHandle: HWND);
var
  hprocessID: INTEGER;
  processHandle: THandle;
  DWResult: DWORD;
begin
  SendMessageTimeout(hWindowHandle, WM_CLOSE, 0, 0,
    SMTO_ABORTIFHUNG or SMTO_NORMAL, 5000, DWResult);
  if isWindow(hWindowHandle) then
  begin
    { Get the process identifier for the window}
    GetWindowThreadProcessID(hWindowHandle, @hprocessID);
    if hprocessID <> 0 then
    begin
      { Get the process handle }
      processHandle := OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,
        False, hprocessID);
      if processHandle <> 0 then
      begin
        { Terminate the process }
        TerminateProcess(processHandle, 0);
        CloseHandle(ProcessHandle);
      end;
    end;
  end;
end;

procedure TExitThread.Execute;
var
  SetPidToZero: Boolean;
  I: Integer;
begin
  ProcInfo := TProcessInfo.Create(Main.MainForm);
  while True do
  begin
    SetPidToZero := True;
    if Main.TibiaPID <> 0 then
    begin
      ProcInfo.UpdateList;
      for I := 0 to ProcInfo.RunningProcesses.Count - 1 do
      begin
        if ProcInfo.RunningProcesses[I].ProcessID = Main.TibiaPID then
        begin
           SetPidToZero := False;
        end;
      end;
    end;
    if SetPidToZero then
    begin
      Main.TibiaPID := 0;
      Main.TibiaHandle := 0;
      Main.MainForm.RefreshClientList;
      if Main.MainForm.menuSettingsCloseOnExit.Checked and HadClient then
      begin
        Main.MainForm.TrayIcon.Visible := False;
        Main.HealingModule.Terminate;
        Main.ADThread.Terminate;
        Main.StatusThr.Terminate;
        Main.TrayThr.Terminate;
        KillProcess(Main.MainForm.Handle);
      end;
    end;
    sleep(_Interval);
  end;
end;

end.
