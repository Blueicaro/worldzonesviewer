unit espherapoints;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ButtonPanel, StdCtrls, CastleVectors;

type

  { TEspheraForm }

  { TSphereForm }

  TSphereForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    PanelCenterPoints: TPanel;
    PanelRadiusValue: TPanel;
    PanelName: TPanel;
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FCenterSphere: TVector3;
    FEsphereName: string;
    FRadius: single;
    procedure SetEsphereName(AValue: string);
  public
    property EsphereName: string read FEsphereName write SetEsphereName;
    property CenterSphere: TVector3 read FCenterSphere;
    property Radius: single read FRadius;

  end;

var
  SphereForm: TSphereForm;

implementation


{$R *.lfm}

uses worldzonename, inputvector, singlevalue;
  { TEspheraForm }
var
  WorldZoneNameFrame: Tworldzonenameframe;
  InputVectorFrame: Tinputvectorframe;
  SingleValueFrame: Tsinglevalueframe;

  { TSphereForm }

procedure TSphereForm.OKButtonClick(Sender: TObject);
begin
  EsphereName := WorldZoneNameFrame.EditName.Text;
  FCenterSphere := InputVectorFrame.GetValues;
  FRadius := SingleValueFrame.Value;
end;

procedure TSphereForm.FormCreate(Sender: TObject);
begin
  WorldZoneNameFrame := Tworldzonenameframe.Create(nil);
  WorldZoneNameFrame.Parent := PanelName;

  InputVectorFrame := Tinputvectorframe.Create(nil);
  PanelCenterPoints.Width := InputVectorFrame.Width;
  InputVectorFrame.Parent := PanelCenterPoints;

  SingleValueFrame := Tsinglevalueframe.Create(nil);
  SingleValueFrame.Parent := PanelRadiusValue;
  SingleValueFrame.NameValue := 'Radius';
end;

procedure TSphereForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(InputVectorFrame);
  FreeAndNil(SingleValueFrame);
  FreeAndNil(WorldZoneNameFrame);
end;

procedure TSphereForm.SetEsphereName(AValue: string);
begin
  if FEsphereName = AValue then Exit;
  FEsphereName := AValue;
  WorldZoneNameFrame.EditName.Text := AValue;
end;


end.
