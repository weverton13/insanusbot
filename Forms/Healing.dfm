object HealingForm: THealingForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Healing'
  ClientHeight = 367
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object uiRuleLabel: TLabel
    Left = 30
    Top = 156
    Width = 263
    Height = 13
    Alignment = taCenter
    Caption = 'When setting multiple rules set smaller % first'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object uiHealthListView: TListView
    Left = 0
    Top = 0
    Width = 325
    Height = 150
    Columns = <
      item
        Caption = 'HP%'
        Width = 40
      end
      item
        Caption = 'Action'
        Width = 120
      end
      item
        Caption = 'MP%'
        Width = 40
      end
      item
        Caption = 'Action'
        Width = 120
      end>
    TabOrder = 0
    ViewStyle = vsReport
  end
  object uiGroupHealth: TGroupBox
    Left = 8
    Top = 175
    Width = 153
    Height = 154
    Caption = 'HP Settings'
    TabOrder = 1
    object uiGroupHealthLabel: TLabel
      Left = 3
      Top = 16
      Width = 126
      Height = 13
      Caption = 'When HP% is below: 60%'
    end
    object uiGroupHealthDoNothing: TRadioButton
      Left = 3
      Top = 55
      Width = 70
      Height = 17
      Caption = 'Do Nothing'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object uiGroupHealthScroll: TScrollBar
      Left = 3
      Top = 35
      Width = 147
      Height = 14
      PageSize = 0
      Position = 60
      TabOrder = 1
      OnChange = uiGroupHealthScrollChange
    end
    object uiGroupHealthUseItem: TRadioButton
      Left = 3
      Top = 78
      Width = 102
      Height = 17
      Caption = 'Use item with ID:'
      TabOrder = 2
    end
    object uiGroupHealthItemID: TSpinEdit
      Left = 16
      Top = 96
      Width = 81
      Height = 22
      MaxValue = 20000
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
    object uiGroupHealthCastSpell: TRadioButton
      Left = 3
      Top = 124
      Width = 70
      Height = 17
      Caption = 'Cast Spell:'
      TabOrder = 4
    end
    object uiGroupHealthSpell: TEdit
      Left = 79
      Top = 122
      Width = 57
      Height = 21
      TabOrder = 5
      Text = 'exura'
    end
  end
  object uiGroupMana: TGroupBox
    Left = 167
    Top = 175
    Width = 153
    Height = 154
    Caption = 'MP Settings'
    TabOrder = 2
    object uiGroupManaLabel: TLabel
      Left = 3
      Top = 16
      Width = 127
      Height = 13
      Caption = 'When MP% is below: 60%'
    end
    object uiGroupManaDoNothing: TRadioButton
      Left = 3
      Top = 55
      Width = 70
      Height = 17
      Caption = 'Do Nothing'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object uiGroupManaScroll: TScrollBar
      Left = 3
      Top = 35
      Width = 147
      Height = 14
      PageSize = 0
      Position = 60
      TabOrder = 1
      OnChange = uiGroupManaScrollChange
    end
    object uiGroupManaUseItem: TRadioButton
      Left = 3
      Top = 78
      Width = 102
      Height = 17
      Caption = 'Use item with ID:'
      TabOrder = 2
    end
    object uiGroupManaItemID: TSpinEdit
      Left = 16
      Top = 96
      Width = 81
      Height = 22
      MaxValue = 20000
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
    object uiGroupManaCastSpell: TRadioButton
      Left = 3
      Top = 124
      Width = 70
      Height = 17
      Caption = 'Cast Spell:'
      TabOrder = 4
    end
    object uiGroupManaSpell: TEdit
      Left = 79
      Top = 122
      Width = 57
      Height = 21
      TabOrder = 5
      Text = 'exura'
    end
  end
  object uiAdd: TButton
    Left = 8
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 3
  end
  object uiRemove: TButton
    Left = 128
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 4
  end
  object uiClear: TButton
    Left = 242
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 5
  end
end
