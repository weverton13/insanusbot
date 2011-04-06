unit TrayThread;

interface

uses
  Windows, Classes, SysUtils;

type
  TTrayThread = class(TThread)
  private
    _Interval: Integer;
    function GetInterval: Integer;
    procedure SetInterval(Value: Integer);
  protected
    procedure Execute; override;
  published
    property Interval: Integer read GetInterval write SetInterval default 1000;
  end;

implementation

uses Main, Addresses;

function TTrayThread.GetInterval: Integer;
begin
  Result := _Interval;
end;

procedure TTrayThread.SetInterval(Value: Integer);
begin
  _Interval := Value;
end;

procedure TTrayThread.Execute;
var
  Cap: Integer;
begin
  while True do
  begin
    if Main.TibiaPID <>0  then
    begin
      case Main.Memory.ReadInteger(Addresses.c_Status) of
        8:
        begin
          Cap := Main.Player.Capacity div 100;
          Main.MainForm.TrayIcon.Hint := Main.Player.Name + #13 + 'HP: ' + inttostr(Main.Player.Health) + ' MP: ' + inttostr(Main.Player.Mana) + ' Cap: ' + inttostr(Cap);
        end;
        else
        begin
          Main.MainForm.TrayIcon.Hint := 'Offline';
        end;
      end;
    end
    else
    begin
      Main.MainForm.TrayIcon.Hint := 'No client';
    end;
    sleep(_Interval);
  end;
end;

end.
