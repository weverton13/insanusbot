unit Healing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Spin;

type
  THealingForm = class(TForm)
    uiHealthListView: TListView;
    uiRuleLabel: TLabel;
    uiGroupHealth: TGroupBox;
    uiGroupHealthDoNothing: TRadioButton;
    uiGroupHealthLabel: TLabel;
    uiGroupHealthScroll: TScrollBar;
    uiGroupHealthUseItem: TRadioButton;
    uiGroupHealthItemID: TSpinEdit;
    uiGroupHealthCastSpell: TRadioButton;
    uiGroupHealthSpell: TEdit;
    uiGroupMana: TGroupBox;
    uiGroupManaLabel: TLabel;
    uiGroupManaDoNothing: TRadioButton;
    uiGroupManaScroll: TScrollBar;
    uiGroupManaUseItem: TRadioButton;
    uiGroupManaItemID: TSpinEdit;
    uiGroupManaCastSpell: TRadioButton;
    uiGroupManaSpell: TEdit;
    uiAdd: TButton;
    uiRemove: TButton;
    uiClear: TButton;
    procedure uiGroupHealthScrollChange(Sender: TObject);
    procedure uiGroupManaScrollChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HealingForm: THealingForm;

implementation

{$R *.dfm}

procedure THealingForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  Hide;
end;

procedure THealingForm.uiGroupHealthScrollChange(Sender: TObject);
begin
  uiGroupHealthLabel.Caption := 'When HP% is below: ' + inttostr(uiGroupHealthScroll.Position) + '%';
end;

procedure THealingForm.uiGroupManaScrollChange(Sender: TObject);
begin
  uiGroupManaLabel.Caption := 'When MP% is below: ' + inttostr(uiGroupManaScroll.Position) + '%';
end;

end.
