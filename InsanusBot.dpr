program InsanusBot;

uses
  Forms,
  Main in 'Forms\Main.pas' {MainForm},
  Addresses in 'Utils\Addresses.pas',
  MemoryDeclaration in 'Utils\MemoryDeclaration.pas',
  TextUtils in 'Utils\TextUtils.pas',
  ExitThread in 'Threads\ExitThread.pas',
  Player in 'Objects\Player.pas',
  Memory in 'Objects\Memory.pas',
  Location in 'Objects\Location.pas',
  StatusThread in 'Threads\StatusThread.pas',
  TrayThread in 'Threads\TrayThread.pas',
  Healing in 'Forms\Healing.pas' {HealingForm},
  HealingThread in 'Threads\HealingThread.pas',
  Hotkey in 'Objects\Hotkey.pas',
  Input in 'Utils\Input.pas',
  GUI in 'Objects\GUI\GUI.pas',
  AntiDebugThread in 'Threads\AntiDebugThread.pas',
  Encryption in 'Utils\Encryption.pas',
  GUIScreen in 'Objects\GUI\GUIScreen.pas',
  GUIMisc in 'Objects\GUI\GUIMisc.pas',
  GUIEquipment in 'Objects\GUI\GUIEquipment.pas',
  GUIWindow in 'Objects\GUI\GUIWindow.pas',
  Enums in 'Utils\Enums.pas',
  TrueClasses in 'Utils\TrueClasses.pas',
  TrueCaptions in 'Utils\TrueCaptions.pas',
  GUIContainer in 'Objects\GUI\GUIContainer.pas',
  GUIMap in 'Objects\GUI\GUIMap.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Insanus Bot';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(THealingForm, HealingForm);
  Application.Run;
end.
