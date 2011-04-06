unit GUIMap;

interface

uses Dialogs, Location;

type
  TGUIMap = class
  private
    function GetMapY: Integer;
    function GetMapZoom: Integer;
  public
    function MapZoomIn: Boolean;
    function MapZoomOut: Boolean;
    procedure SetAtTwo;
    function Walk(Location: TLocation): Boolean; overload;
    function Walk(X, Y, Z: Integer): Boolean; overload;
  published
    property MapY: Integer read GetMapY;
    property MapZoom: Integer read GetMapZoom;
  end;

implementation

uses Main, Addresses, SysUtils, Input, GUI;

function TGUIMap.GetMapZoom: Integer;
begin
  Result := Memory.ReadInteger(Addresses.Gui_Map_ZoomPointer);
  Result := Memory.ReadInteger(Result + Addresses.Gui_Map_ZoomOff1);
  Result := Memory.ReadInteger(Result + Addresses.Gui_Map_ZoomOff2);
end;

function TGUIMap.GetMapY: Integer;
begin
  Result := Memory.ReadInteger(Addresses.Gui_Map_Y);
end;

function TGUIMap.MapZoomIn: Boolean;
var
  base: Integer;
begin
  base := MapZoom;
  Input.SendClick(Main.GUI.Window.Width - 46, MapY + 81);
  if base < MapZoom then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

function TGUIMap.MapZoomOut: Boolean;
var
  base: Integer;
begin
  base := MapZoom;
  Input.SendClick(Main.GUI.Window.Width - 46, MapY + 58);
  if base < MapZoom then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

procedure TGUIMap.SetAtTwo;
begin
  if MapZoom = 1 then
  begin
    MapZoomIn;
  end
  else if MapZoom <> 2 then
  begin
    while MapZoom <> 2 do
    begin
      MapZoomOut;
      sleep(100);
    end;
  end;
end;

function TGUIMap.Walk(Location: TLocation): Boolean;
var
  base, base2: Integer;
begin
  base := Main.GUI.Window.Width - 169;
  base2 := Main.GUI.Map.MapY + 3;
  base := base + 45;
  base2 := base2 + 50;
  if (ABS(Location.OffsetFromPlayer.X) <= 7) and (ABS(Location.OffsetFromPlayer.Y) <= 5) then
  begin
    Input.SendClick(Main.GUI.Screen.GetTileOffsetX(Location.OffsetFromPlayer.X, True), Main.GUI.Screen.GetTileOffsetY(Location.OffsetFromPlayer.Y, True));
    Result := True;
  end
  else if (Location.DistanceFromPlayer < 52) then
  begin
    SetAtTwo;
    Location := Location.OffsetFromPlayer;
    base := base + Location.X;
    base2 := base2 + Location.Y;
    Input.SendClick(base, base2);
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

function TGUIMap.Walk(X, Y, Z: Integer): Boolean;
var
  Loc: TLocation;
begin
  Loc := TLocation.Create(X, Y, Z);
  Result := Walk(Loc);
  Loc.Free;
end;

end.
