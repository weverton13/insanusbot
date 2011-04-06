unit AntiDebugThread;

interface

uses
  Classes, ProcessInfo, AppInfo, Math, SysUtils, Dialogs;

type
  TAntiDebug = class(TThread)
  protected
    procedure Execute; override;
  end;

const
  PWD = 'T70kPplUwiStNuH4';

implementation

uses Main, MemoryDeclaration, StrUtils, Encryption, TrueClasses, TrueCaptions;

procedure Shut;
begin
  Main.MainForm.TrayIcon.Visible := False;
  Main.ExitThr.KillProcess(Main.MainForm.Handle);
end;

function IsForbiddenClass(Name: String): Boolean;
var
  ForbiddenClasses: TStringList;
  I: Integer;
begin
  ForbiddenClasses := TStringList.Create;
  ForbiddenClasses.Add('Happy debugging motherfuckers');
  ForbiddenClasses.Add('OLLYDBG');
  ForbiddenClasses.Add('RAMODBG');
  ForbiddenClasses.Add('sx/5pngkiwFoQI40kPI+GoPVe6QdQlYMOXhr9MtwPGBON0S3EfT');
  ForbiddenClasses.Add('jNRx7dH6MF02BiW/KBJR46eYlCAtqDdX1PycKLGP9d5L');
  Result := False;
  if Encryption.DecodePWDEx(TrueClasses.four, PWD) = name then
  begin
    Result := True;
  end;
  if Encryption.DecodePWDEx(TrueClasses.five, PWD) = name then
  begin
    Result := True;
  end;
  for I := 0 to ForbiddenClasses.Count - 1 do
  begin
    if Encryption.DecodePWDEx(ForbiddenClasses[I], PWD) = Name then
    begin
      Result := True;
    end;
  end;
end;

function IsForbiddenCaption(Name: String): Boolean;
var
  ForbiddenCaptions: TStringList;
  I: Integer;
begin
  ForbiddenCaptions := TStringList.Create;
  ForbiddenCaptions.Add('Happy debugging motherfuckers');
  ForbiddenCaptions.Add('Cheat Engine');
  ForbiddenCaptions.Add('TSearch');
  ForbiddenCaptions.Add('Art*Mo*ney');
  ForbiddenCaptions.Add('zE12t6Irfu64/UVs6vUSiN0iw0hLPREqQYsxj5wG05eworg55Qxhpkjhc56hElzFX2pUi3MgwRrRm4'); //Cheat Engine
  ForbiddenCaptions.Add('14nLTm+VvTicyOCQiilvPacRFYlvgGM/3PxEqHhGr1'); //TSearch
  ForbiddenCaptions.Add('vOJYxg2eHJ8nF8ewFHsWIqlMaj43MLpqb4XqApK4jVaeJtjZyPJr4yMKL4gERWZPEvBFO'); //Art*Mo*ney
  Result := False;
  if AnsiStartsStr(Encryption.DecodePWDEx(TrueCaptions.one, PWD), Name) then
  begin
    Result := true;
  end;
  if AnsiStartsStr(Encryption.DecodePWDEx(TrueCaptions.two, PWD), Name) then
  begin
    Result := true;
  end;
  if AnsiStartsStr(Encryption.DecodePWDEx(TrueCaptions.three, PWD), Name) then
  begin
    Result := true;
  end;
  for I := 0 to ForbiddenCaptions.Count - 1 do
  begin
    if AnsiStartsStr(Encryption.DecodePWDEx(ForbiddenCaptions[I], PWD), Name) then
    begin
      Result := True;
    end;
  end;
end;

procedure TAntiDebug.Execute;
var
  I: Integer;
  AInfo: TWindowItem;
begin
  while True do
  begin
    Main.AppsInfo.UpdateList;
    for I := 0 to Main.AppsInfo.RunningApps.Count - 1 do
    begin
      AInfo := Main.AppsInfo.RunningApps[I];
{      if MemoryDeclaration.ReadInteger(AInfo.ProcessID, MemoryDeclaration.ReadInteger(AInfo.ProcessID, $7DB0F0)) = Main.SelfPID then
      begin
        Shut;
      end;}
      if IsForbiddenClass(AInfo.WindowClass) then
      begin
        Shut;
      end;
      if IsForbiddenCaption(AInfo.Caption) then
      begin
        Shut;
      end;
    end;
    sleep(RandomRange(800, 1200));
  end;
end;

end.
