unit HealingThread;

interface

uses
  Windows, Classes;

type
  THealingThread = class(TThread)
  private
    _Interval: Integer;
    WithCrosshairs: Integer;
    UseOnTarget: Integer;
    UseOnSelf: Integer;
    function GetInterval: Integer;
    procedure SetInterval(Value: Integer);
  protected
    procedure Execute; override;
  public
    SpellExhaustion, PotionExhaustion: Integer;
    Enabled: Boolean;
  published
    HealRules: TStringList;
    property Interval: Integer read GetInterval write SetInterval default 1000;
  end;

implementation

uses Main, Addresses, Math, TextUtils, SysUtils, Hotkey, Input, ClipBrd, Dialogs;

function THealingThread.GetInterval: Integer;
begin
  Result := _Interval;
end;

procedure THealingThread.SetInterval(Value: Integer);
begin
  _Interval := Value;
end;

{
0 - do nothing
1 - use item
2 - cast spell
}

{HP Type ID/Spell MP Type ID/Spell
 85 1    266      70 1    263
}

procedure THealingThread.Execute;
var
  CurrentRule: String;
  CurrentCommand, I, O: Integer;
  A: TStringList;
  Hotkey: TTibiaHotkey;
  IsInHtkList: Boolean;
begin
  Enabled := True;
  {$IFDEF undef}{$REGION 'Initialization'}{$ENDIF}
  WithCrosshairs := 0;
  UseOnTarget := 1;
  UseOnSelf := 2;
  SpellExhaustion := 1080;
  PotionExhaustion := 700;
  HealRules := TStringList.Create;
  A := TStringList.Create;
  IsInHtkList := False;
  {$IFDEF undef}{$ENDREGION}{$ENDIF}
  while True do
  begin
    if Enabled then
    begin
      if (Main.TibiaPID <> 0) and (HealRules.Count > 0) then
      begin
        if Main.Memory.ReadInteger(Addresses.c_Status) = 8 then
        begin
          {$IFDEF undef}{$REGION 'HealRules'}{$ENDIF}
          for I := 0 to HealRules.Count - 1 do
          begin
            CurrentRule := HealRules[I];
            Split(' ', CurrentRule, A);
            if (Main.Player.Health <= strtoint(A[0])) and (A[1] <> '0') then
            begin
              CurrentCommand := strtoint(A[1]);
              {$IFDEF undef}{$REGION 'Command Block'}{$ENDIF}
              case CurrentCommand of
                {$IFDEF undef}{$REGION 'Use Item'}{$ENDIF}
                1:
                begin
                  Hotkey := TTibiaHotkey.Create;
                  for O := 1 to 36 do
                  begin
                    Hotkey.ID := O;
                    if (Hotkey.ObjectID = strtoint(A[2])) and (Hotkey.ObjectType <> UseOnTarget) then
                    begin
                      IsInHtkList := True;
                      Break;
                    end;
                  end;
                  if IsInHtkList then
                  begin
                    Hotkey.ExecuteHotkey;
                    if Hotkey.ObjectType = WithCrosshairs then
                    begin
                      Input.SendClick(Gui.Screen.GetTileOffsetX(0, True), Gui.Screen.GetTileOffsetY(0, True));
                    end;
                    sleep(RandomRange(550, 800));
                  end;
                end;
                {$IFDEF undef}{$ENDREGION}{$ENDIF}
                {$IFDEF undef}{$REGION 'Spell'}{$ENDIF}
                2:
                begin
                  Hotkey := TTibiaHotkey.Create;
                  for O := 1 to 36 do
                  begin
                    Hotkey.ID := O;
                    if (Hotkey.Text = A[2]) then
                    begin
                      IsInHtkList := True;
                      Break;
                    end;
                  end;
                  if IsInHtkList then
                  begin
                    Hotkey.ExecuteHotkey;
                    if Hotkey.SendAutomatically = False then
                    begin
                      Input.SendKeyChar(VK_RETURN);
                      sleep(20);
                    end;
                    sleep(RandomRange(550, 800));
                  end
                  else
                  begin
                    while Main.GUI.Misc.TibiaText <> A[2] do
                    begin
                      while Main.GUI.Misc.TibiaText <> '' do
                      begin
                        Input.SendKeyDown(VK_DELETE);
                        sleep(10);
                        Input.SendKeyUp(VK_DELETE);
                        sleep(10);
                        Input.SendKeyDown(VK_BACK);
                        sleep(10);
                        Input.SendKeyUp(VK_BACK);
                        sleep(10);
                      end;
                      Input.SendString(A[2]);
                    end;
                    Input.SendKeyChar(VK_RETURN);
                    sleep(10);
                    sleep(RandomRange(550, 800));
                  end;
                  end;
                  {$IFDEF undef}{$ENDREGION}{$ENDIF}
              end;
              {$IFDEF undef}{$ENDREGION}{$ENDIF}
            end;
            if (Main.Player.Mana <= strtoint(A[3])) and (A[4] <> '0') then
            begin
              CurrentCommand := strtoint(A[4]);
              {$IFDEF undef}{$REGION 'Command Block'}{$ENDIF}
              case CurrentCommand of
                {$IFDEF undef}{$REGION 'Use Item'}{$ENDIF}
                1:
                begin
                  Hotkey := TTibiaHotkey.Create;
                  for O := 1 to 36 do
                  begin
                    Hotkey.ID := O;
                    if (Hotkey.ObjectID = strtoint(A[5])) and (Hotkey.ObjectType <> UseOnTarget) then
                    begin
                      IsInHtkList := True;
                      Break;
                    end;
                  end;
                  if IsInHtkList then
                  begin
                    Hotkey.ExecuteHotkey;
                    if Hotkey.ObjectType = WithCrosshairs then
                    begin
                      Input.SendClick(Gui.Screen.GetTileOffsetX(0, True), Gui.Screen.GetTileOffsetY(0, True));
                    end;
                    sleep(RandomRange(550, 800));
                  end;
                end;
                {$IFDEF undef}{$ENDREGION}{$ENDIF}
                {$IFDEF undef}{$REGION 'Spell'}{$ENDIF}
                2:
                begin
                  Hotkey := TTibiaHotkey.Create;
                  for O := 1 to 36 do
                  begin
                    Hotkey.ID := O;
                    if (Hotkey.Text = A[5]) then
                    begin
                      IsInHtkList := True;
                      Break;
                    end;
                  end;
                  if IsInHtkList then
                  begin
                    Hotkey.ExecuteHotkey;
                    if Hotkey.SendAutomatically = False then
                    begin
                      Input.SendKeyChar(VK_RETURN);
                      sleep(20);
                    end;
                    sleep(RandomRange(550, 800));
                  end
                  else
                  begin
                    while Main.GUI.Misc.TibiaText <> A[5] do
                    begin
                      while Main.GUI.Misc.TibiaText <> '' do
                      begin
                        Input.SendKeyDown(VK_DELETE);
                        sleep(10);
                        Input.SendKeyUp(VK_DELETE);
                        sleep(10);
                        Input.SendKeyDown(VK_BACK);
                        sleep(10);
                        Input.SendKeyUp(VK_BACK);
                        sleep(10);
                      end;
                      Input.SendString(A[5]);
                    end;
                    Input.SendKeyChar(VK_RETURN);
                    sleep(10);
                    sleep(RandomRange(550, 800));
                  end;
                  end;
                  {$IFDEF undef}{$ENDREGION}{$ENDIF}
              end;
              {$IFDEF undef}{$ENDREGION}{$ENDIF}
            end;
          end;
          Hotkey.Free;
          {$IFDEF undef}{$ENDREGION}{$ENDIF}
        end;
      end;
    end;
    sleep(RandomRange(_Interval - 300, _Interval + 300));
  end;
end;

end.
