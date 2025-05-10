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
  private

  public

  end;

var
  CylinderPointsFrm: TCylinderPointsFrm;


implementation

{$R *.lfm}

uses worldzonename, inputvector, singlevalue;

var
  WorldZonesFrame: Tworldzonenameframe;
  InputVectorFrame: Tinputvectorframe;
  HeighFrame: Tsinglevalueframe;
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

  HeighFrame := Tsinglevalueframe.Create(PanelHeight);
  HeighFrame.Parent := PanelHeight;
  HeighFrame.Align := alClient;

  RadiusFrame := Tsinglevalueframe.Create(PanelRadius);
  RadiusFrame.Parent:=PanelRadius;
  RadiusFrame.Align:=alClient;


end;

procedure TCylinderPointsFrm.FormDestroy(Sender: TObject);
begin
  //FreeAndNil(WorldZonesFrame);
end;

end.
