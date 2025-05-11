unit cylinderpoints;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, ExtCtrls,
  CastleVectors;

type

  { TCylinderPointsFrm }

  TCylinderPointsFrm = class(TForm)
    ButtonPanel1: TButtonPanel;
    PanelRadius: TPanel;
    PanelHeight: TPanel;
    PanelCenter: TPanel;
    PanelName: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    FCenter: TVector3;
    FHeight: Single;
    FRadius: Single;
    FWorldZoneName: string;

  public
     property WorldZoneName:string read FWorldZoneName;
     property Center:TVector3 read FCenter;
     property Height : Single read FHeight;
     property Radius: Single read FRadius;
  end;

var
  CylinderPointsFrm: TCylinderPointsFrm;


implementation

{$R *.lfm}

uses worldzonename, inputvector, singlevalue;

var
  WorldZonesFrame: Tworldzonenameframe;
  InputVectorFrame: Tinputvectorframe;
  HeightFrame: Tsinglevalueframe;
  RadiusFrame: Tsinglevalueframe;

  { TCylinderPointsFrm }

procedure TCylinderPointsFrm.FormCreate(Sender: TObject);
begin
  WorldZonesFrame := Tworldzonenameframe.Create(PanelName);
  WorldZonesFrame.Parent := PanelName;
  WorldZonesFrame.Align := alClient;

  InputVectorFrame := Tinputvectorframe.Create(PanelCenter);
  InputVectorFrame.Parent := PanelCenter;
  InputVectorFrame.Align := alClient;

  HeightFrame := Tsinglevalueframe.Create(PanelHeight);
  HeightFrame.Parent := PanelHeight;
  HeightFrame.Align := alClient;
  HeightFrame.NameValue:='Height';

  RadiusFrame := Tsinglevalueframe.Create(PanelRadius);
  RadiusFrame.Parent:=PanelRadius;
  RadiusFrame.Align:=alClient;
  RadiusFrame.NameValue:='Radius';


end;

procedure TCylinderPointsFrm.FormDestroy(Sender: TObject);
begin

end;

procedure TCylinderPointsFrm.OKButtonClick(Sender: TObject);
begin
    FWorldZoneName:=WorldZonesFrame.ZoneName;
    FCenter:=InputVectorFrame.GetValues;
    FHeight:=HeightFrame.Value;
    FRadius:=RadiusFrame.Value;
end;

end.
