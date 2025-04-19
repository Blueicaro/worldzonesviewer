unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  volumenes, CastleControl, CastleViewport, CastleScene, CastleUIControls,
  CastleVectors, CastleTransform;

type

  { TmainForm }

  TmainForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CastleControl1: TCastleControl;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    View: TCastleView;
    ViewPort: TCastleViewport;
    BoxList: TBoxList;
    World: TCastleTransform; //Origen
    procedure AddBoxToScene(aBox: Tbox);
  public

  end;

var
  mainForm: TmainForm;


implementation

uses ProjectsTree, BoxPointsUnit, espherapoints;

var
  TreeFrame1: TProjectsTreeFrame;
  {$R *.lfm}

  { TmainForm }

procedure TmainForm.FormCreate(Sender: TObject);
begin
  TreeFrame1 := TProjectsTreeFrame.Create(Self);
  TreeFrame1.Parent := Self;
  TreeFrame1.Align := alLeft;

  View := TCastleView.Create(Self);
  View.DesignUrl := 'castle-data:/gameviewmain.castle-user-interface';
  CastleControl1.Container.View := View;
  ViewPort := View.DesignedComponent('ViewPort1') as TCastleViewport;


  World := View.DesignedComponent('world') as TCastleTransform;
  //Crear listas
  BoxList := TBoxList.Create();
end;

procedure TmainForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(BoxList);
end;

procedure TmainForm.AddBoxToScene(aBox: Tbox);
var
  Trans, Size: TVector3;
  CastleBox: TCastleBox;
  Behavior: TBoxBehavior;
begin
  Trans := aBox.P2 - aBox.P1;
  Size := Vector3(Trans.X / 2, Trans.Y / 2, Trans.Z / 2);

  CastleBox := TCastleBox.Create(Self);
  CastleBox.Size := Size;
  CastleBox.Color:=Vector4(0.4,0.5,1,0.18);
  Behavior := TBoxBehavior.Create(CastleBox);
  Behavior.BoxName := aBox.Name;
  CastleBox.AddBehavior(Behavior);
  World.Add(CastleBox);
  CastleBox.Translation := Trans;
end;

procedure TmainForm.Button1Click(Sender: TObject);
var
  F: TBoxPointsForm;
  Box: Tbox;
begin
  F := TBoxPointsForm.Create(Self);
  try
    F.EditMode := True;
    if F.ShowModal = mrOk then
    begin
      Box := Tbox.Create(Self, F.NameOfVolumen, F.Point1, F.Point2);
      if Assigned(TreeFrame1) then
      begin
        TreeFrame1.AddBoxZone(Box);
      end;
      AddBoxToScene(Box);
      BoxList.Add(Box);

    end;
  finally
    FreeAndNil(F);
  end;

end;

procedure TmainForm.Button2Click(Sender: TObject);
var
  F: TEspheraForm;
begin
  F := TEspheraForm.Create(Self);
  try
    F.EsphereName := 'Mi Esfera';
    F.ShowModal;
  finally
    FreeAndNil(F);
  end;
end;

end.
