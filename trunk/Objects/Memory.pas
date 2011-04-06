unit Memory;

interface

uses Addresses, Classes, SysUtils, Windows, Messages, Variants, Dialogs, MemoryDeclaration;

type
TMemory = class
  published
    function ReadInteger(Address: Cardinal): Cardinal;
    function ReadString(Address: Cardinal): String;
    function ReadByte(Address: Cardinal): Byte;
    function BLPosition: Integer;
    procedure WriteInteger(Address: Cardinal; Value: Integer);
    procedure WriteString(Address: Cardinal; Value: String);
    procedure WriteByte(Address: Cardinal; Value: Byte);
end;

implementation

uses Main;

function TMemory.ReadInteger(Address: Cardinal): Cardinal;
var
  ProcessID: Integer;
begin
  ProcessID := Main.TibiaPID;
  result := MemoryDeclaration.ReadInteger(ProcessID, Address);
end;

function TMemory.ReadByte(Address: Cardinal): Byte;
var
  ProcessID: Integer;
begin
  ProcessID := Main.TibiaPID;
  result := MemoryDeclaration.ReadByte(ProcessID, Address);
end;

function TMemory.ReadString(Address: Cardinal): String;
var
  ProcessID: Integer;
begin
  ProcessID := Main.TibiaPID;
  result := MemoryDeclaration.ReadString(ProcessID, Address);
end;

function TMemory.BLPosition: Integer;
var
  ProcessID: Integer;
begin
  ProcessID := Main.TibiaPID;
  result := MemoryDeclaration.BLPosition(ProcessID);
end;

procedure TMemory.WriteInteger(Address: Cardinal; Value: Integer);
var
  ProcessID: Integer;
begin
  ProcessID := Main.TibiaPID;
  MemoryDeclaration.WriteInteger(ProcessID, Address, Value);
end;

procedure TMemory.WriteByte(Address: Cardinal; Value: Byte);
var
  ProcessID: Integer;
begin
  ProcessID := Main.TibiaPID;
  MemoryDeclaration.WriteByte(ProcessID, Address, Value);
end;

procedure TMemory.WriteString(Address: Cardinal; Value: String);
var
  ProcessID: Integer;
begin
  ProcessID := Main.TibiaPID;
  MemoryDeclaration.WriteString(ProcessID, Address, Value);
end;

end.

