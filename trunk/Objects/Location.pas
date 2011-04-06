unit Location;

interface

uses Dialogs, SysUtils;

type
  TLocation = class
    private
      function GetDistFromPlr: Integer;
    public
      X: Integer;
      Y: Integer;
      Z: Integer;
      function OffsetFromPlayer: TLocation;
      function Offset(OffX, OffY, OffZ: Integer): TLocation;
    published
      property DistanceFromPlayer: Integer read GetDistFromPlr;
      constructor Create(LocX, LocY, LocZ: Integer);
  end;

implementation

uses Main, Math;

function TLocation.GetDistFromPlr;
var
  BaseX, BaseY: Integer;
begin
  BaseX := Main.Player.X;
  BaseY := Main.Player.Y;
  showmessage(inttostr(BaseX) + '-' + inttostr(X) + '=' + inttostr(BaseX- X) + #13
  + inttostr(BaseY) + '-' + inttostr(y) + '=' + inttostr(Basey- y));
  BaseX := BaseX - X;
  BaseY := BaseY - Y;
  BaseX := ABS(BaseX);
  BaseY := ABS(BaseY);
  if BaseX > BaseY then
  begin
    Result := BaseX;
  end
  else
  begin
    Result := BaseY;
  end;
end;

function TLocation.OffsetFromPlayer: TLocation;
var
  Loc: TLocation;
begin
  Loc := TLocation.Create(X - Main.Player.X, Y - Main.Player.Y, Z - Main.Player.Z);
  Result := Loc;
end;

function TLocation.Offset(OffX, OffY, OffZ: Integer): TLocation;
var
  Loc: TLocation;
begin
  Loc := TLocation.Create(X + OffX, Y + OffY, Z + OffZ);
  Result := Loc;
end;

constructor TLocation.Create(LocX, LocY, LocZ: Integer);
begin
  X := LocX;
  Y := LocY;
  Z := LocZ;
end;

end.
