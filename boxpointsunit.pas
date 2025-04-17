unit BoxPointsUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, ExtCtrls,
  StdCtrls, inputvector, CastleVectors;

type

  { TBoxPointsForm }

  TBoxPointsForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    editName: TEdit;
    labelname: TLabel;
    PanelPuntos: TPanel;
    panelname: TPanel;
    procedure editNameChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    FPoint1: TVector3;
    FPoint2: TVector3;
    function GetEditMode: boolean;
    function GetNameOfVolumen: string;
    procedure SetEditMode(AValue: boolean);
    procedure SetNameOfVolumen(AValue: string);
    procedure SetPoint1(AValue: TVector3);
    procedure SetPoint12(AValue: TVector3);
  public
    property NameOfVolumen: string read GetNameOfVolumen write SetNameOfVolumen;
    property EditMode: boolean read GetEditMode write SetEditMode;
    property Point1: TVector3 read FPoint1 write SetPoint1;
    property Point2: TVector3 read FPoint2 write SetPoint12;

  end;

var
  BoxPointsForm: Tinputvectorframe;
  P1: Tinputvectorframe;
  P2: Tinputvectorframe;

implementation

{$R *.lfm}

{ TBoxPointsForm }

procedure TBoxPointsForm.FormCreate(Sender: TObject);
begin
  P1 := Tinputvectorframe.Create(nil);
  P1.Parent := PanelPuntos;
  P1.Align := alTop;

  P2 := Tinputvectorframe.Create(nil);
  P2.Parent := PanelPuntos;
  P2.Align := alClient;
  //P2.Top := P1.Height;
 // PanelPuntos.ClientHeight:=P1.Height+P2.Height+5;

  //Self.ClientWidth := P1.Width;
  //Self.ClientHeight := P2.Height * 2 + ButtonPanel1.Height+panelname.Height;
end;

procedure TBoxPointsForm.editNameChange(Sender: TObject);
begin
  ButtonPanel1.OKButton.Enabled:=editName.Text<>'';
end;

procedure TBoxPointsForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(P1);
  FreeAndNil(P2);
end;

procedure TBoxPointsForm.OKButtonClick(Sender: TObject);
begin
  Point1 := P1.GetValues;
  Point2 := P2.GetValues;
  NameOfVolumen:=editName.Text;
end;

function TBoxPointsForm.GetEditMode: boolean;
begin
  Result := editName.Enabled;
end;

function TBoxPointsForm.GetNameOfVolumen: string;
begin
  Result := editName.Text;
end;

procedure TBoxPointsForm.SetEditMode(AValue: boolean);
begin
  if editName.Enabled = AValue then Exit;
  editName.Enabled := Enabled;

end;

procedure TBoxPointsForm.SetNameOfVolumen(AValue: string);
begin
  if editName.Text = AValue then Exit;
  editName.Text := AValue;
end;

procedure TBoxPointsForm.SetPoint1(AValue: TVector3);
begin
  FPoint1 := AValue ;
end;

procedure TBoxPointsForm.SetPoint12(AValue: TVector3);
begin
  FPoint2 := AValue;
end;

end.
