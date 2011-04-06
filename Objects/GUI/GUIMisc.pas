unit GUIMisc;

interface

uses Dialogs;

type
  TGUIMisc = class
  private
    function GetTibiaText: String;
    function GetClassicControl: Boolean;
    function GetActiveChannel: Integer;
    function GetMapZoom: Integer;
    function GetUpperPartHeight: Integer;
  published
    property TibiaText: String read GetTibiaText;
    property ClassicControl: Boolean read GetClassicControl;
    property ActiveChannel: Integer read GetActiveChannel;
    property MapZoom: Integer read GetMapZoom;
    property UpperPartHeight: Integer read GetUpperPartHeight;
  end;

implementation

uses Main, Addresses, SysUtils;

function TGUIMisc.GetTibiaText: String;
var
  one: Cardinal;
begin
  one := Memory.ReadInteger(GUI.GetFirstAddress + $24);
  Result := Memory.ReadString(Memory.ReadInteger(one + $F4));
end;

function TGUIMisc.GetClassicControl: Boolean;
begin
    Result := False;
end;

function TGUIMisc.GetActiveChannel: Integer;
var
  first, res, sel: Integer;
begin
  first := Memory.ReadInteger(Addresses.Gui_Pointer);
  res := Memory.ReadInteger(first + $040);
  res := Memory.ReadInteger(res + $34);
  res := Memory.ReadInteger(res + $2C);
  res := Memory.ReadInteger(res + $24);
  sel := Memory.ReadInteger(res + $2C);
  Result := sel;
end;

function TGUIMisc.GetMapZoom: Integer;
begin
  Result := Memory.ReadInteger(Addresses.Gui_Map_ZoomPointer);
  Result := Memory.ReadInteger(Result + Addresses.Gui_Map_ZoomOff1);
  Result := Memory.ReadInteger(Result + Addresses.Gui_Map_ZoomOff2);
end;

function TGUIMisc.GetUpperPartHeight: Integer;
begin
  Result := 349;
  if Main.GUI.Equipment.EquipmentMinimized then
  begin
    Result := 243;
  end;
end;

end.
