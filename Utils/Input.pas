unit Input;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms, Dialogs;

procedure SendKeyDown(Key: Integer);
procedure SendKeyUp(Key: Integer);
procedure SendKeyChar(Key: Integer);
procedure SendClick(X, Y: Integer);
procedure SendClickPoint(Point: TPoint);
procedure SendRClick(X, Y: Integer);
procedure SendRClickPoint(Point: TPoint);
procedure SendDrag(BaseX, BaseY, TargetX, TargetY: Integer);
procedure SendDragPoint(BasePoint, TargetPoint: TPoint);
procedure SendString(Data: String);

implementation

uses
  Main;

procedure SendKeyDown(Key: Integer);
begin
  PostMessage(Main.TibiaHandle, WM_KEYDOWN, Key, 0);
end;

procedure SendKeyUp(Key: Integer);
begin
  PostMessage(Main.TibiaHandle, WM_KEYUP, Key, 0);
end;

procedure SendKeyChar(Key: Integer);
begin
  PostMessage(Main.TibiaHandle, WM_CHAR, Key, 0);
end;

procedure SendClick(X, Y: Integer);
begin
  PostMessage(Main.TibiaHandle, WM_LBUTTONDOWN, 0, MakeLParam(X, Y));
  sleep(50);
  PostMessage(Main.TibiaHandle, WM_LBUTTONUP, 0, MakeLParam(X, Y));
end;

procedure SendClickPoint(Point: TPoint);
begin
  PostMessage(Main.TibiaHandle, WM_LBUTTONDOWN, 0, MakeLParam(Point.X, Point.Y));
  sleep(50);
  PostMessage(Main.TibiaHandle, WM_LBUTTONUP, 0, MakeLParam(Point.X, Point.Y));
end;

procedure SendRClick(X, Y: Integer);
begin
  PostMessage(Main.TibiaHandle, WM_RBUTTONDOWN, 0, MakeLParam(X, Y));
  sleep(50);
  PostMessage(Main.TibiaHandle, WM_RBUTTONUP, 0, MakeLParam(X, Y));
end;

procedure SendRClickPoint(Point: TPoint);
begin
  PostMessage(Main.TibiaHandle, WM_RBUTTONDOWN, 0, MakeLParam(Point.X, Point.Y));
  sleep(50);
  PostMessage(Main.TibiaHandle, WM_RBUTTONUP, 0, MakeLParam(Point.X, Point.Y));
end;

procedure SendString(Data: String);
var
  I: Integer;
begin
  for I := 0 to Length(Data) do
  begin
    SendKeyChar(Integer(Data[I]));
    sleep(50);
  end;
end;

procedure SendDrag(BaseX, BaseY, TargetX, TargetY: Integer);
begin
  PostMessage(Main.TibiaHandle, WM_LBUTTONDOWN, 0, MakeLParam(BaseX, BaseY));
  sleep(200);
  PostMessage(Main.TibiaHandle, WM_MOUSEMOVE, 0, MakeLParam(BaseX, BaseY));
  sleep(200);
  PostMessage(Main.TibiaHandle, WM_MOUSEMOVE, 0, MakeLParam(TargetX, TargetY));
  sleep(200);
  PostMessage(Main.TibiaHandle, WM_LBUTTONUP, 0, MakeLParam(TargetX, TargetY));
  sleep(200);
end;

procedure SendDragPoint(BasePoint, TargetPoint: TPoint);
begin
  PostMessage(Main.TibiaHandle, WM_LBUTTONDOWN, 0, MakeLParam(BasePoint.X, BasePoint.Y));
  sleep(200);
  PostMessage(Main.TibiaHandle, WM_MOUSEMOVE, 0, MakeLParam(BasePoint.X, BasePoint.Y));
  sleep(200);
  PostMessage(Main.TibiaHandle, WM_MOUSEMOVE, 0, MakeLParam(TargetPoint.X, TargetPoint.Y));
  sleep(200);
  PostMessage(Main.TibiaHandle, WM_LBUTTONUP, 0, MakeLParam(TargetPoint.X, TargetPoint.Y));
  sleep(200);
end;

end.
