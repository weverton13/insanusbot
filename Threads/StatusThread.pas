unit StatusThread;

interface

uses
  Windows, Classes;

type
  TStatusThread = class(TThread)
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

function TStatusThread.GetInterval: Integer;
begin
  Result := _Interval;
end;

procedure TStatusThread.SetInterval(Value: Integer);
begin
  _Interval := Value;
end;

procedure TStatusThread.Execute;
var
  LastStatus: Integer;
  NewStatus: Integer;
begin
  LastStatus := 0;
  NewStatus := 0;
  while True do
  begin
    if Main.TibiaPID <>0  then
    begin
      NewStatus := Main.Memory.ReadInteger(Addresses.c_Status);
      case NewStatus of
        0:
        begin
          if LastStatus > 0 then
          begin
            Main.MainForm.onStatusChange;
          end;
        end;
        8:
        begin
          if LastStatus < 8 then
          begin
            Main.MainForm.onStatusChange;
          end;
        end;
        else
        begin

        end;
    end;
      LastStatus := NewStatus;
    end;
    sleep(_Interval);
  end;
end;

end.
