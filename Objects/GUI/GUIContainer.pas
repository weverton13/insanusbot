unit GUIContainer;

interface

uses Dialogs, SysUtils, Types;

type
  TGUIContainer = class
  private
  published
    //function GetContainerX(ID: integer): Integer;
    function GetContainerAddress(ID: integer): Integer;
    function GetContainerName(ID: integer): String;
    function GetContainerY(ID: integer): Integer;
    function GetContainerHeight(ID: integer): Integer;
    function GetContainerScrollPoint(ID: Integer): Integer;
  end;

implementation

uses Main, Addresses;

function TGUIContainer.GetContainerAddress(ID: integer): Integer;
var
  one: Integer;
  I: Integer;
begin
  one := Memory.ReadInteger(Addresses.Gui_Pointer);
  one := Memory.ReadInteger(one + $24);
  one := Memory.ReadInteger(one + $24);
  if ID <> 0 then
  begin
    for I := 0 to ID - 1 do
    begin
      one := Memory.ReadInteger(one + $10);
    end;
  end;
  Result := one;
end;

function TGUIContainer.GetContainerName(ID: integer): String;
var
  one: Integer;
  I: Integer;
begin
  one := Memory.ReadInteger(Addresses.Gui_Pointer);
  one := Memory.ReadInteger(one + $24);
  one := Memory.ReadInteger(one + $24);
  if ID <> 0 then
  begin
    for I := 0 to ID - 1 do
    begin
      one := Memory.ReadInteger(one + $10);
    end;
  end;
  one := Memory.ReadInteger(one + $60);
  one := Memory.ReadInteger(one + $24);
  Result := Memory.ReadString(one);
end;

function TGUIContainer.GetContainerY(ID: integer): Integer;
var
  one: Integer;
  I: Integer;
begin
  one := Memory.ReadInteger(Addresses.Gui_Pointer);
  one := Memory.ReadInteger(one + $24);
  one := Memory.ReadInteger(one + $24);
  if ID <> 0 then
  begin
    for I := 0 to ID - 1 do
    begin
      one := Memory.ReadInteger(one + $10);
    end;
  end;
  one := Memory.ReadInteger(one + $18);
  Result := one;
end;

function TGUIContainer.GetContainerHeight(ID: integer): Integer;
var
  one: Integer;
  I: Integer;
begin
  one := Memory.ReadInteger(Addresses.Gui_Pointer);
  one := Memory.ReadInteger(one + $24);
  {one := Memory.ReadInteger(GUI.GetFirstAddress + $24);}
  one := Memory.ReadInteger(one + $24);
  if ID <> 0 then
  begin
    for I := 0 to ID - 1 do
    begin
      one := Memory.ReadInteger(one + $10);
    end;
  end;
  one := Memory.ReadInteger(one + $20);
  Result := one;
end;

function TGUIContainer.GetContainerScrollPoint(ID: Integer): Integer; //THIS FUNCTION IS GAY :/
var                                                                   //DOESNT WORK
  one, I: Integer;
begin
  one := Memory.ReadInteger(Addresses.Gui_Pointer);
  one := Memory.ReadInteger(one + $24);
  one := Memory.ReadInteger(one + $24);
  if ID <> 0 then
  begin
    for I := 0 to ID - 1 do
    begin
      one := Memory.ReadInteger(one + $10);
    end;
  end;
  one := Memory.ReadInteger(one + $48);
  one := Memory.ReadInteger(one + $64);
  one := Memory.ReadInteger(one + $30);
  Result := one;
end;

end.
