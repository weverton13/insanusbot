unit Hotkey;

interface

type
  TTibiaHotkey = class
    private
      _ID: Integer;
      function GetSendAuto: Boolean;
      procedure SetSendAuto(Value: Boolean);
      function GetText: String;
      procedure SetText(Value: String);
      function GetObjectId: Integer;
      procedure SetObjectId(Value: Integer);
      function GetType: Integer;
      procedure SetType(Value: Integer);
      function GetId: Integer;
      procedure SetId(Value: Integer);
    public
      property ID: Integer read GetId write SetId default 1;
      property SendAutomatically: Boolean read GetSendAuto write SetSendAuto;
      property Text: String read GetText write SetText;
      property ObjectID: Integer read GetObjectId write SetObjectId;
      property ObjectType: Integer read GetType write SetType;
      procedure ExecuteHotkey;
  end;

implementation

uses Main, Addresses, Dialogs, Windows, SysUtils, Input;

procedure TTibiaHotkey.ExecuteHotkey;
var
  ModifierValue: Integer;
begin
  ModifierValue := ID div 12;
  case ModifierValue of
  1:
  begin
    Input.SendKeyDown(VK_SHIFT);
    sleep(50);
    Input.SendKeyDown(111 + ID - 12);
    sleep(50);
    Input.SendKeyUp(111 + ID - 12);
    sleep(50);
    Input.SendKeyUp(VK_SHIFT);
  end;
  2:
  begin
    Input.SendKeyDown(VK_CONTROL);
    sleep(50);
    Input.SendKeyDown(111 + ID - 24);
    sleep(50);
    Input.SendKeyUp(111 + ID - 24);
    sleep(50);
    Input.SendKeyUp(VK_CONTROL);
  end;
  else
  begin
    Input.SendKeyDown(111 + ID);
    sleep(50);
    Input.SendKeyUp(111 + ID);
    sleep(50);
  end;
  end;
end;

function TTibiaHotkey.GetSendAuto: Boolean;
begin
  Result := Boolean(Main.Memory.ReadInteger(Addresses.htk_SendAutomaticallyStart +
                    ID * Addresses.htk_SendAutomaticallyStep));
end;

procedure TTibiaHotkey.SetSendAuto(Value: Boolean);
begin
  Main.Memory.WriteInteger(Addresses.htk_SendAutomaticallyStart +
                    ID * Addresses.htk_SendAutomaticallyStep, Integer(Value));
end;

function TTibiaHotkey.GetText: String;
begin
  Result := Main.Memory.ReadString(Addresses.htk_TextStart +
                    ID * Addresses.htk_TextStep);
end;

procedure TTibiaHotkey.SetText(Value: String);
begin
  Main.Memory.WriteString(Addresses.htk_TextStart +
                    ID * Addresses.htk_TextStep, Value);
end;

function TTibiaHotkey.GetObjectId: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.htk_ObjectStart +
                    ID * Addresses.htk_ObjectStep);
end;

procedure TTibiaHotkey.SetObjectId(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.htk_ObjectStart +
                    ID * Addresses.htk_ObjectStep, Value);
end;

function TTibiaHotkey.GetType: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.htk_ObjectUseTypeStart +
                    ID * Addresses.htk_ObjectUseTypeStep);
end;

procedure TTibiaHotkey.SetType(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.htk_ObjectUseTypeStart +
                    ID * Addresses.htk_ObjectUseTypeStep, Value);
end;

function TTibiaHotkey.GetId: Integer;
begin
  Result := _ID;
end;

procedure TTibiaHotkey.SetId(Value: Integer);
begin
  if (Value < 1) or (Value > 36) then
  begin
    MessageBox(0, 'Value has to be bigger than between 1 and 36', 'Information', mb_Ok or mb_iconinformation);
  end
  else
  begin
    _ID := Value;
  end;
end;

end.
