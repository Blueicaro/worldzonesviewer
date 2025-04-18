unit espherapoints;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ButtonPanel;

type

  { TEspheraForm }

  TEspheraForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    PanelCenterPoints: TPanel;
    PanelRadiusValue: TPanel;
    PanelName: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FEsphereName: string;
    procedure SetEsphereName(AValue: string);
  public
    property EsphereName: string read FEsphereName write SetEsphereName;
  end;

var
  EspheraForm: TEspheraForm;

implementation


{$R *.lfm}

uses worldzonename, inputvector, singlevalue;
  { TEspheraForm }
var
  WorldZoneNameFrame: Tworldzonenameframe;
  InputVectorFrame: Tinputvectorframe;
  SingleValueFrame: Tsinglevalueframe;

procedure TEspheraForm.FormCreate(Sender: TObject);
begin
  WorldZoneNameFrame := Tworldzonenameframe.Create(nil);
  WorldZoneNameFrame.Parent := PanelName;

  InputVectorFrame := Tinputvectorframe.Create(nil);
  PanelCenterPoints.Width := InputVectorFrame.Width;
  InputVectorFrame.Parent := PanelCenterPoints;

  SingleValueFrame := Tsinglevalueframe.Create(nil);
  SingleValueFrame.Parent := PanelRadiusValue;
 // SingleValueFrame.Align:=alClient;
  SingleValueFrame.NameValue:= 'Radius';

end;

procedure TEspheraForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(WorldZoneNameFrame);
  FreeAndNil(InputVectorFrame);
end;

procedure TEspheraForm.SetEsphereName(AValue: string);
begin
  if FEsphereName = AValue then Exit;
  FEsphereName := AValue;
  WorldZoneNameFrame.EditName.Text := AValue;
end;

end.
