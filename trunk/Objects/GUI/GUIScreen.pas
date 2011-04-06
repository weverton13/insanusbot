unit GUIScreen;

interface

type
  TGUIScreen = class
  private
    function GetScreenX: Integer;
    function GetScreenY: Integer;
    function GetScreenWidth: Integer;
    function GetScreenHeight: Integer;
  public
    function GetTileScreenX(X: Integer; AbsoluteX: Boolean): Integer;
    function GetTileScreenY(Y: Integer; AbsoluteY: Boolean): Integer;
    function GetTileOffsetX(X: Integer; AbsoluteX: Boolean): Integer;
    function GetTileOffsetY(Y: Integer; AbsoluteY: Boolean): Integer;
  published
    property ScreenX: Integer read GetScreenX;
    property ScreenY: Integer read GetScreenY;
    property ScreenWidth: Integer read GetScreenWidth;
    property ScreenHeight: Integer read GetScreenHeight;
  end;

const
  TilesVert = 11;
  TilesHoriz = 15;
  PlayerX = 8;
  PlayerY = 6;

implementation

uses Main, Addresses, Dialogs, SysUtils;

function GetRealAddress: Integer;
var
  Offset1, RealAdr: Integer;
begin
  Offset1 := $18 + $04;
  RealAdr := Main.Memory.ReadInteger(Addresses.c_GameWindowRectPointer);
  RealAdr := Main.Memory.ReadInteger(RealAdr + Offset1) + $14;
  Result := RealAdr;
end;

function TGUIScreen.GetTileScreenX(X: Integer; AbsoluteX: Boolean): Integer;
var
  TileSize: Extended;
begin
  TileSize := ScreenWidth / TilesHoriz;
  Result := Round((TileSize * X)  - (TileSize / 2));
  if AbsoluteX then
  begin
    Result := Result + ScreenX;
  end;
end;

function TGUIScreen.GetTileScreenY(Y: Integer; AbsoluteY: Boolean): Integer;
var
  TileSize: Extended;
begin
  TileSize := ScreenHeight / TilesVert;
  Result := Round((TileSize * Y)  - (TileSize / 2));
  if AbsoluteY then
  begin
    Result := Result + ScreenY;
  end;
end;

function TGUIScreen.GetTileOffsetX(X: Integer; AbsoluteX: Boolean): Integer;
begin
  Result := GetTileScreenX(X + 8, AbsoluteX);
end;

function TGUIScreen.GetTileOffsetY(Y: Integer; AbsoluteY: Boolean): Integer;
begin
  Result := GetTileScreenY(Y + 6, AbsoluteY);
end;

function TGUIScreen.GetScreenX: Integer;
begin
  Result := Main.Memory.ReadInteger(GetRealAddress);
end;

function TGUIScreen.GetScreenY: Integer;
begin
  Result := Main.Memory.ReadInteger(GetRealAddress + 4);
end;

function TGUIScreen.GetScreenWidth: Integer;
begin
  Result := Main.Memory.ReadInteger(GetRealAddress + 8);
end;

function TGUIScreen.GetScreenHeight: Integer;
begin
  Result := Main.Memory.ReadInteger(GetRealAddress + 12);
end;

end.
