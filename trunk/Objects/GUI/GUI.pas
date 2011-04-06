unit GUI;

interface

uses GUIContainer, GUIEquipment, GUIMap, GUIMisc, GUIScreen, GUIWindow;

type
  TTibiaGUI = class
  public
    Container: TGUIContainer;
    Equipment: TGUIEquipment;
    Map: TGUIMap;
    Misc: TGUIMisc;
    Screen: TGUIScreen;
    Window: TGUIWindow;
  published
    function GetFirstAddress: Integer;
    constructor Create;
  end;

implementation

uses Main, Addresses, Dialogs, SysUtils;

function TTibiaGUI.GetFirstAddress: Integer;
begin
  Result := Memory.ReadInteger(Addresses.Gui_Pointer);
  Result := Memory.ReadInteger(Result + $24);
end;

constructor TTibiaGUI.Create;
begin
  Container := TGUIContainer.Create;
  Equipment := TGUIEquipment.Create;
  Map := TGUIMap.Create;
  Misc := TGUIMisc.Create;
  Screen := TGUIScreen.Create;
  Window := TGUIWindow.Create;
end;
end.
