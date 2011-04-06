unit GUIWindow;

interface

uses Windows;

type
  TGUIWindow = class
  private
    WinInfo: TWindowInfo;
    function GetHeight: Integer;
    function GetWidth: Integer;
  published
    property Height: Integer read GetHeight;
    property Width: Integer read GetWidth;
  end;

implementation

uses Main, Addresses, Dialogs, SysUtils;

function TGUIWindow.GetHeight: Integer;
begin
  Result := Memory.ReadInteger(Addresses.Window_Height) + 38;
end;

function TGUIWindow.GetWidth: Integer;
begin
  Result := Memory.ReadInteger(Addresses.Window_Width) + 12;
end;

end.
