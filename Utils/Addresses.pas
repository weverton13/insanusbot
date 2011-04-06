unit Addresses;

interface
    const
    //Player
    p_Experience = $63FD50;
    p_Flags = p_Experience - 112;
    p_Id = p_Experience + 16;
    p_Health = p_Experience + 8;
    p_HealthMax = p_Experience + 4;
    p_Level = p_Experience - 8;
    p_MagicLevel = p_Experience - 12;
    p_LevelPercent = p_Experience - 16;
    p_MagicLevelPercent = p_Experience - 20;
    p_Mana = p_Experience - 24;
    p_ManaMax = p_Experience - 28;
    p_Soul = p_Experience - 32;
    p_Stamina = p_Experience - 36;
    p_Capacity = p_Experience - 40;

    p_FistPercent = p_Flags + 4;
    p_ClubPercent = p_FistPercent + 4;
    p_SwordPercent = p_FistPercent + 8;
    p_AxePercent = p_FistPercent + 12;
    p_DistancePercent = p_FistPercent + 16;
    p_ShieldingPercent = p_FistPercent + 20;
    p_FishingPercent = p_FistPercent + 24;
    p_Fist = p_FistPercent + 28;
    p_Club = p_FistPercent + 32;
    p_Sword = p_FistPercent + 36;
    p_Axe = p_FistPercent + 40;
    p_Distance = p_FistPercent + 44;
    p_Shielding = p_FistPercent + 48;
    p_Fishing = p_FistPercent + 52;

    p_SlotHead = $6790C8;
    p_SlotNeck = p_SlotHead + 12;
    p_SlotBackpack = p_SlotHead + 24;
    p_SlotArmor = p_SlotHead + 36;
    p_SlotRight = p_SlotHead + 48;
    p_SlotLeft = p_SlotHead + 60;
    p_SlotLegs = p_SlotHead + 72;
    p_SlotFeet = p_SlotHead + 84;
    p_SlotRing = p_SlotHead + 96;
    p_SlotAmmo = p_SlotHead + 108;
    p_MaxSlots = 11;
    p_DistanceSlotCount = 4;

    p_CurrentTileToGo = p_Flags + 132;
    p_TilesToGo = p_CurrentTileToGo + 4;

    p_GoToX = p_Experience + 80;
    p_GoToY = p_GoToX - 4;
    p_GoToZ = p_GoToX - 8;

    p_RedSquare = p_Flags + 68;
    p_GreenSquare = p_Flags + 64;
    p_WhiteSquare = p_Flags + 60;

    p_AccessN = 0;
    p_AccessS = 0;

    p_TargetId = p_RedSquare;
    p_TargetBattlelistId = p_TargetId - 8;
    p_TargetBattlelistType = p_TargetId - 5;
    p_TargetType = p_TargetId + 3;

    p_Z = $67BA30;
    p_x =  p_Z+8;
    p_y =  p_Z+4;

    p_AttackCount = $63D900;
    p_FollowCount = p_AttackCount + $20;
    // Battle List
    bl_Start = $63FDE8;
    bl_StepCreatures = $AC;
    bl_MaxCreatures = 1300;
    bl_End = bl_Start + (bl_StepCreatures * bl_MaxCreatures);
    // Dat
    Dat_Pointer = $7C5D0C;
    Dat_StepItems = $4C;
    Dat_Width = 0;
    Dat_Height = 4;
    Dat_MaxSizeInPixels = 8;
    Dat_Layers = 12;
    Dat_PatternX = 16;
    Dat_PatternY = 20;
    Dat_PatternDepth = 24;
    Dat_Phase = 28;
    Dat_Sprite = 32;
    Dat_Flags = 36;
    Dat_CanLookAt = 0;
    Dat_WalkSpeed = 40;
    Dat_TextLimit = 44; // If it is readable/writable
    Dat_LightRadius = 48;
    Dat_LightColor = 52;
    Dat_ShiftX = 56;
    Dat_ShiftY = 60;
    Dat_WalkHeight = 64;
    Dat_Automap = 68; // Minimap color
    Dat_LensHelp = 72;
    // Client
    c_StartTime = $80CAF0;
    c_XTeaKey = $7C5CEC;
    c_SocketStruct = $7C5CC0;
    c_RecvPointer = $5B85E4;
    c_SendPointer = $5B8610;
    c_FrameRatePointer = $7C9DD4;
    c_FrameRateCurrentOffset = $60;
    c_FrameRateLimitOffset = $58;
    c_MultiClient = $50BFA4;
    c_Status = $7C928C;
    c_SafeMode = $7C6114;
    c_FollowMode = c_SafeMode + 4;
    c_AttackMode = c_FollowMode + 4;
    c_ActionState = $7C92EC;
    c_ActionStateFreezer = $51EAF0;
    c_LastMSGText = $80CD60;
    c_LastMSGAuthor = c_LastMSGText - $28;
    c_StatusbarText = c_StartTime + $20;
    c_StatusbarTime = c_StatusbarText - 4;
    c_ClickId = $7C9320;
    c_ClickCount = c_ClickId + 4;
    c_ClickZ = c_ClickId - $68;
    c_SeeId = c_ClickId + 12;
    c_SeeCount = c_SeeId + 4;
    c_SeeZ = c_SeeId - $68;
    c_ClickContextMenuItemId = c_SeeId;
    c_ClickContextMenuCreatureId = c_ClickContextMenuItemId + $0C;
    c_LoginServerStart = $7C0C28;
    c_StepLoginServer = 112;
    c_DistancePort = 100;
    c_MaxLoginServers = 10;
    c_RSA = $5B8980;
    c_LoginCharList = $7C9240;
    c_LoginCharListLength = c_LoginCharList + 4;
    c_LoginSelectedChar = c_LoginCharList - 4;
    c_GameWindowRectPointer = $67868C;
    c_GameWindowBar = $80CB00;
    c_DatPointer = $7C5D0C;
    c_EventTriggerPointer = $520600;
    c_DialogPointer = $67B9F4;
    c_DialogLeft = $14;
    c_DialogTop = $18;
    c_DialogWidth = $1C;
    c_DialogHeight = $20;
    c_DialogCaption = $50;
    c_LastRcvPacket = $7C14A0;
    c_DecryptCall = $45C6A5;
    c_LoginAccountNum = 0;
    c_LoginPassword = c_LoginCharList + 8;
    c_LoginAccount = c_LoginPassword + 32;
    c_ParserFunc = $45C670;
    c_GetNextPacketCall = $45C6A5;
    c_RecvStream = $7C5CDC;
    //container
    bp_Start = $679140;
    bp_StepContainer = 492;
    bp_StepSlot = 12;
    bp_MaxContainers = 16;
    bp_MaxStack = 100;
    bp_DistanceIsOpen = 0;
    bp_DistanceId = 4;
    bp_DistanceName = 16;
    bp_DistanceVolume = 48;
    bp_DistanceAmount = 56;
    bp_DistanceItemId = 60;
    bp_DistanceItemCount = 64;
    bp_End = bp_Start + (bp_MaxContainers * bp_StepContainer);
    // creature
    m_DistanceId = 0;
    m_DistanceType = 3;
    m_DistanceName = 4;

    m_DistanceX = 36;
    m_DistanceY = 40;
    m_DistanceZ = 44;
    m_DistanceScreenOffsetHoriz = 48;
    m_DistanceScreenOffsetVert = 52;

    m_DistanceIsWalking = 76;
    m_DistanceDirection = 80;

    m_DistanceOutfit = 96;
    m_DistanceColorHead = 100;
    m_DistanceColorBody = 104;
    m_DistanceColorLegs = 108;
    m_DistanceColorFeet = 112;
    m_DistanceAddon = 116;
    m_DistanceMountId = 120;

    m_DistanceLight = 124;
    m_DistanceLightColor = 128;
    m_DistanceLightPattern = 132;
    m_DistanceBlackSquare = 136;
    m_DistanceHPBar = 140;
    m_DistanceWalkSpeed = 144;
    m_DistanceIsVisible = 148;

    m_DistanceSkull = 152;
    m_DistanceParty = 156;
    m_DistanceWarIcon = 164;
    m_DistanceIsBlocking = 168;
    // map
    map_MapPointer = $680548;
    map_StepTile = 168;
    map_StepTileObject = 12;
    map_DistanceTileObjectCount = 0;
    map_DistanceTileObjects = 4;
    map_DistanceObjectId = 0;
    map_DistanceObjectData = 4;
    map_DistanceObjectDataEx = 8;
    map_MaxTileObjects = 10;
    map_MaxX = 18;
    map_MaxY = 14;
    map_MaxZ = 8;
    map_MaxTiles = 2016;
    map_ZAxisDefault = 7;
    map_NameSpy1 = $4F2769;
    map_NameSpy2 = $4F2773;
    map_NameSpy1Default = $4C75;
    map_NameSpy2Default = $4275;
    map_LevelSpy1 = $4F465A;
    map_LevelSpy2 = $4F475F;
    map_LevelSpy3 = $4F47E0;
    map_LevelSpyPtr = c_GameWindowRectPointer;
    map_LevelSpyAdd1 = 28;
    map_LevelSpyAdd2 = $5BC0;
    map_FullLightNop = $4EACD9;
    map_FullLightAdr = $4EACDC;
    map_FullLightNopDefault : Array[0..1] of byte = ($7E, $05);
	  map_FullLightNopEdited : Array[0..1] of byte = ($90, $90);
    map_FullLightAdrDefault = $80;
    map_FullLightAdrEdited = $FF;
    //Hotkey
    htk_SendAutomaticallyStart = $7C630F;
    htk_SendAutomaticallyStep = $01;
    htk_TextStart = $7C6238;
    htk_TextStep = $100;
    htk_ObjectStart = $7C627C;
    htk_ObjectStep = $04;
    htk_ObjectUseTypeStart = $7C615C;
    htk_ObjectUseTypeStep = $04;
    htk_MaxHotkeys = 36;

    txtDis_PrintName = $4F57C3;
    txtDis_PrintFPS = $45A6A8;
    txtDis_ShowFPS = $63D9FC;
    txtDis_PrintTextFunc = $4B4D50;
    txtDis_NopFPS = $45A5E4;

    vip_Start = $63DA78;
    vip_StepPlayers = $2C;
    vip_MaxPlayers = 200;
    vip_DistanceId = 0;
    vip_DistanceName = 4;
    vip_DistanceStatus = 34;
    vip_DistanceIcon = 40;
    vip_End = vip_Start + (vip_StepPlayers * vip_MaxPlayers);

    draw_DrawItemFunc = $4B5910;
    draw_DrawSkinFunc = $4B9620;

    Gui_Pointer = $67B9F8;
    Gui_EquipmentPointer = $676E24;      //BROKEN TOO
    Gui_ContainerScrollPointer = $7C6130;//TOO
    Gui_Map_Y = $1251EC;                 //AS UP
    //Gui_Map2 = $125228;
    Gui_Map_ZoomPointer = $67868C;   //THIS IS BROKEN PROBABLY
    Gui_Map_ZoomOff1 = $7C;
    Gui_Map_ZoomOff2 = $7C;
    //Gui_Map_Off3 = $34;
    //Gui_Map_Off4 = $13C;
    //Gui_Map_Off5 = $FC;

    Window_Width = $7C92E4;
    Window_Height = $7C92E0;

    Gui_UppperPart_Height = $18;
    Gui_EquipmentY_Mini = $12D364;    //AS UP
    Gui_EquipmentY_Maxi = $12D898;    //AS UP



implementation

end.

