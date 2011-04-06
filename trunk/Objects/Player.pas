unit Player;

interface

uses Addresses, Memory, Dialogs, Location;

type
TPlayer = class
  private
    function GetAddress: Integer;
    function GetId: Integer;
    function GetName: String;
    function GetExperience: Integer;
    function GetFlags: Integer;
    function GetLevel: Integer;
    function GetLevelPc: Integer;
    function GetMLevel: Integer;
    function GetMLevelPc: Integer;
    function GetMana: Integer;
    function GetManaMax: Integer;
    function GetHealth: Integer;
    function GetHealthMax: Integer;
    function GetSoul: Integer;
    function GetCapacity: Integer;
    function GetStamina: Integer;
    function GetFist: Integer;
    function GetFistPc: Integer;
    function GetClub: Integer;
    function GetClubPc: Integer;
    function GetSword: Integer;
    function GetSwordPc: Integer;
    function GetAxe: Integer;
    function GetAxePc: Integer;
    function GetDistance: Integer;
    function GetDistancePc: Integer;
    function GetShielding: Integer;
    function GetShieldingPc: Integer;
    function GetFishing: Integer;
    function GetFishingPc: Integer;
    function GetRedSquare: Integer;
    function GetGreenSquare: Integer;
    function GetWhiteSquare: Integer;
    function GetX: Integer;
    function GetY: Integer;
    function GetZ: Integer;
    function GetLocation: TLocation;
    function GetAttackCount: Integer;
    function GetFollowCount: Integer;
    function GetStatus: Integer;
    function GetTargetType: Integer;
    function GetTargetBlId: Integer;
    function GetTargetBlType: Integer;
    procedure SetName(Value: String);
    procedure SetExperience(Value: Integer);
    procedure SetFlags(Value: Integer);
    procedure SetLevel(Value: Integer);
    procedure SetLevelPc(Value: Integer);
    procedure SetMLevel(Value: Integer);
    procedure SetMLevelPc(Value: Integer);
    procedure SetMana(Value: Integer);
    procedure SetManaMax(Value: Integer);
    procedure SetHealth(Value: Integer);
    procedure SetHealthMax(Value: Integer);
    procedure SetSoul(Value: Integer);
    procedure SetCapacity(Value: Integer);
    procedure SetStamina(Value: Integer);
    procedure SetFist(Value: Integer);
    procedure SetFistPc(Value: Integer);
    procedure SetClub(Value: Integer);
    procedure SetClubPc(Value: Integer);
    procedure SetSword(Value: Integer);
    procedure SetSwordPc(Value: Integer);
    procedure SetAxe(Value: Integer);
    procedure SetAxePc(Value: Integer);
    procedure SetDistance(Value: Integer);
    procedure SetDistancePc(Value: Integer);
    procedure SetShielding(Value: Integer);
    procedure SetShieldingPc(Value: Integer);
    procedure SetFishing(Value: Integer);
    procedure SetFishingPc(Value: Integer);
    procedure SetRedSquare(Value: Integer);
    procedure SetGreenSquare(Value: Integer);
    procedure SetWhiteSquare(Value: Integer);
    procedure SetAttackCount(Value: Integer);
    procedure SetFollowCount(Value: Integer);
    procedure SetGoToLoc(Value: TLocation);
  public
    property Id : Integer read GetId;
    property Address : Integer read GetAddress;
    property Name : String read GetName write SetName;
    property Experience : Integer read GetExperience write SetExperience;
    property Flags : Integer read GetFlags write SetFlags;
    property Level : Integer read GetLevel write SetLevel;
    property LevelPercent : Integer read GetLevelPc write SetLevelPc;
    property MagicLevel : Integer read GetMLevel write SetMLevel;
    property MagicLevelPercent : Integer read GetMLevelPc write SetMLevelPc;
    property Mana : Integer read GetMana write SetMana;
    property ManaMax : Integer read GetManaMAx write SetManaMax;
    property Health : Integer read GetHealth write SetHealth;
    property HealthMax : Integer read GetHealthMax write SetHealthMax;
    property Soul : Integer read GetSoul write SetSoul;
    property Capacity : Integer read GetCapacity write SetCapacity;
    property Stamina : Integer read GetStamina write SetStamina;
    property Fist : Integer read GetFist write SetFist;
    property FistPercent : Integer read GetFistPc write SetFistPc;
    property Club : Integer read GetClub write SetClub;
    property ClubPercent : Integer read GetClubPc write SetClubPc;
    property Sword : Integer read GetSword write SetSword;
    property SwordPercent : Integer read GetSwordPc write SetSwordPc;
    property Axe : Integer read GetAxe write SetAxe;
    property AxePercent : Integer read GetAxePc write SetAxePc;
    property Distance : Integer read GetDistance write SetDistance;
    property DistancePercent : Integer read GetDistancePc write SetDistancePc;
    property Shielding : Integer read GetShielding write SetShielding;
    property ShieldingPercent : Integer read GetShieldingPc write SetShieldingPc;
    property Fishing : Integer read GetFishing write SetFishing;
    property FishingPercent : Integer read GetFishingPc write SetFishingPc;
    property RedSquare : Integer read GetRedSquare write SetRedSquare;
    property GreenSquare : Integer read GetGreenSquare write SetGreenSquare;
    property WhiteSquare : Integer read GetWhiteSquare write SetWhiteSquare;
    property TargetId : Integer read GetRedSquare write SetRedSquare;
    property TargetType : Integer read GetTargetType;
    property TargetBattlelistId : Integer read GetTargetBlId;
    property TargetBattlelistType : Integer read GetTargetBlType;
    property Z : Integer read GetZ;
    property Y : Integer read GetY;
    property X : Integer read GetX;
    property Location : TLocation read GetLocation;
    property GoToLoc : TLocation write SetGoToLoc;
    property AttackCount : Integer read GetAttackCount write SetAttackCount;
    property FollowCount : Integer read GetFollowCount write SetFollowCount;
    property Status : Integer read GetStatus;
end;

implementation

uses Main;

function TPlayer.GetAddress : Integer;
var
  i,id_battle,id, address:integer;
begin
  address := bl_start;
  id:=Main.Memory.ReadInteger(p_id);
  for i:=0 to 1299 do
  Begin
    id_battle:=Main.Memory.ReadInteger(address);
    if id_battle=ID then
    Begin
      Result := address;
      exit;
    end
    else
    begin
      address := address + bl_stepcreatures;
    end;
  end;
end;

function TPlayer.GetName: String;
var
  Name: String;
begin
  Name := Main.Memory.ReadString(Address + Addresses.m_DistanceName);
  Result := Name;
end;

procedure TPlayer.SetName(Value: String);
begin
  Main.Memory.WriteString(Address + Addresses.m_DistanceName, Value);
end;

function TPlayer.GetId: Integer;
begin
  Result := Main.Memory.ReadInteger(Address + Addresses.m_DistanceId);
end;

function TPlayer.GetExperience: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Experience);
end;

function TPlayer.GetFlags: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Flags);
end;

function TPlayer.GetLevel: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Level);
end;

function TPlayer.GetLevelPc: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_LevelPercent);
end;

function TPlayer.GetMLevel: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_MagicLevel);
end;

function TPlayer.GetMLevelPc: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_MagicLevelPercent);
end;

function TPlayer.GetMana: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Mana);
end;

function TPlayer.GetManaMax: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_ManaMax);
end;

function TPlayer.GetHealth: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Health);
end;

function TPlayer.GetHealthMax: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_HealthMax);
end;

function TPlayer.GetSoul: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Soul);
end;

function TPlayer.GetCapacity: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Capacity);
end;

function TPlayer.GetStamina: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Stamina);
end;

function TPlayer.GetFist: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Fist);
end;

function TPlayer.GetFistPc: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_FistPercent);
end;

function TPlayer.GetClub: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Club);
end;

function TPlayer.GetClubPc: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_ClubPercent);
end;

function TPlayer.GetSword: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Sword);
end;

function TPlayer.GetSwordPc: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_SwordPercent);
end;

function TPlayer.GetAxe: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Axe);
end;

function TPlayer.GetAxePc: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_AxePercent);
end;

function TPlayer.GetDistance: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Distance);
end;

function TPlayer.GetDistancePc: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_DistancePercent);
end;

function TPlayer.GetShielding: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Shielding);
end;

function TPlayer.GetShieldingPc: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_ShieldingPercent);
end;

function TPlayer.GetFishing: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Fishing);
end;

function TPlayer.GetFishingPc: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_FishingPercent);
end;

function TPlayer.GetRedSquare: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_RedSquare);
end;

function TPlayer.GetGreenSquare: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_GreenSquare);
end;

function TPlayer.GetWhiteSquare: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_WhiteSquare);
end;

function TPlayer.GetX: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_X);
end;
function TPlayer.GetY: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Y);
end;
function TPlayer.GetZ: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_Z);
end;

function TPlayer.GetLocation: TLocation;
begin
  Result := TLocation.Create(Main.Memory.ReadInteger(Addresses.p_X),
                            Main.Memory.ReadInteger(Addresses.p_Y),
                            Main.Memory.ReadInteger(Addresses.p_Z));
end;

function TPlayer.GetAttackCount: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_AttackCount);
end;
function TPlayer.GetFollowCount: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_FollowCount);
end;
function TPlayer.GetStatus: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.c_Status);
end;

procedure TPlayer.SetExperience(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Experience, Value);
end;

procedure TPlayer.SetLevel(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Level, Value);
end;

procedure TPlayer.SetLevelPc(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_LevelPercent, Value);
end;

procedure TPlayer.SetFlags(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Flags, Value);
end;

procedure TPlayer.SetMLevel(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_MagicLevel, Value);
end;

procedure TPlayer.SetMLevelPc(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_MagicLevelPercent, Value);
end;

procedure TPlayer.SetMana(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Mana, Value);
end;

procedure TPlayer.SetManaMax(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_ManaMax, Value);
end;

procedure TPlayer.SetHealth(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Health, Value);
end;

procedure TPlayer.SetHealthMax(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_HealthMax, Value);
end;

procedure TPlayer.SetSoul(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Soul, Value);
end;

procedure TPlayer.SetCapacity(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Capacity, Value);
end;

procedure TPlayer.SetStamina(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Stamina, Value);
end;

procedure TPlayer.SetFist(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Fist, Value);
end;

procedure TPlayer.SetFistPc(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_FistPercent, Value);
end;

procedure TPlayer.SetClub(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Club, Value);
end;

procedure TPlayer.SetClubPc(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_ClubPercent, Value);
end;

procedure TPlayer.SetSword(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Sword, Value);
end;

procedure TPlayer.SetSwordPc(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_SwordPercent, Value);
end;

procedure TPlayer.SetAxe(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Axe, Value);
end;

procedure TPlayer.SetAxePc(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_AxePercent, Value);
end;

procedure TPlayer.SetDistance(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Distance, Value);
end;

procedure TPlayer.SetDistancePc(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_DistancePercent, Value);
end;

procedure TPlayer.SetShielding(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Shielding, Value);
end;

procedure TPlayer.SetShieldingPc(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_ShieldingPercent, Value);
end;

procedure TPlayer.SetFishing(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_Fishing, Value);
end;

procedure TPlayer.SetFishingPc(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_FishingPercent, Value);
end;

procedure TPlayer.SetRedSquare(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_RedSquare, Value);
end;

procedure TPlayer.SetGreenSquare(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_GreenSquare, Value);
end;

procedure TPlayer.SetWhiteSquare(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_WhiteSquare, Value);
end;

procedure TPlayer.SetAttackCount(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_AttackCount, Value);
end;

procedure TPlayer.SetFollowCount(Value: Integer);
begin
  Main.Memory.WriteInteger(Addresses.p_FollowCount, Value);
end;

procedure TPlayer.SetGoToLoc(Value: TLocation);
begin
  Main.Memory.WriteInteger(Addresses.p_GoToX, Value.X);
  Main.Memory.WriteInteger(Addresses.p_GoToY, Value.Y);
  Main.Memory.WriteInteger(Addresses.p_GoToZ, Value.Z);
  Main.Memory.WriteInteger(Address + m_DistanceIsWalking, 1);
end;

function TPlayer.GetTargetType: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_TargetType);
end;

function TPlayer.GetTargetBlId: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_TargetBattlelistId);
end;

function TPlayer.GetTargetBlType: Integer;
begin
  Result := Main.Memory.ReadInteger(Addresses.p_TargetBattlelistType);
end;

end.
