unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ActnList, volumenes, CastleControl, CastleViewport, CastleScene,
  CastleUIControls, CastleVectors, CastleTransform;

type

  { TmainForm }

  TmainForm = class(TForm)
    acCreateCylinder: TAction;
    ActionList1: TActionList;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CastleControl1: TCastleControl;
    Panel1: TPanel;
    procedure acCreateCylinderExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    View: TCastleView;
    ViewPort: TCastleViewport;
    World: TCastleTransform; //Origen
    procedure AddBoxToScene(aBox: Tbox);
    procedure AddSphereToScene(aSphere: TSphere);
  public

  end;

var
  mainForm: TmainForm;


implementation

uses ProjectsTree, BoxPointsUnit, espherapoints,cylinderpoints;

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
end;

procedure TmainForm.FormDestroy(Sender: TObject);
begin

end;

procedure TmainForm.AddBoxToScene(aBox: Tbox);
var
  Size, Diagonal: TVector3;
  CastleBox: TCastleBox;
  Behavior: TBoxBehavior;
begin
  Diagonal := aBox.P2 - aBox.P1;
  Diagonal := Diagonal / 2;
  Size := aBox.P2 - aBox.P1;

  CastleBox := TCastleBox.Create(Self);
  CastleBox.Size := Size;
  CastleBox.Color := Vector4(0.4, 0.5, 1, 0.18);

  Behavior := TBoxBehavior.Create(CastleBox);
  Behavior.BoxName := aBox.Name;

  CastleBox.AddBehavior(Behavior);
  World.Add(CastleBox);
  CastleBox.Translation := CastleBox.Translation + Diagonal;
end;

procedure TmainForm.AddSphereToScene(aSphere: TSphere);
var
  CastleSphere: TCastleSphere;
  Behaivor: TSphereBehavior;
begin
  CastleSphere := TCastleSphere.Create(Self);
  CastleSphere.Color := Vector4(0.4, 0.5, 1, 0.18);
  CastleSphere.Radius := aSphere.Radius;;

  Behaivor := TSphereBehavior.Create(CastleSphere);
  Behaivor.SphereName := aSphere.Name;
  CastleSphere.AddBehavior(Behaivor);

  World.Add(CastleSphere);
  CastleSphere.Translation := aSphere.Center;
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
      FreeAndNil(Box);
    end;
  finally
    FreeAndNil(F);
  end;

end;

procedure TmainForm.acCreateCylinderExecute(Sender: TObject);
var
  F: TCylinderPointsFrm;
begin
  F := TCylinderPointsFrm.Create(Self);
  try
    F.ShowModal;
  finally
    FreeAndNil(F);
  end;
end;

procedure TmainForm.Button2Click(Sender: TObject);
var
  F: TSphereForm;
  Sphere: TSphere;
begin
  F := TSphereForm.Create(Self);
  try
   // F.EsphereName := 'Mi Esfera';
    if F.ShowModal = mrOk then
    begin
      Sphere := TSphere.Create(Self, F.EsphereName, F.CenterSphere, F.Radius);
      if Assigned(TreeFrame1) then
      begin
         TreeFrame1.AddSphereZone(Sphere);
      end;
      AddSphereToScene(Sphere);
      FreeAndNil(Sphere);
    end;
  finally
    FreeAndNil(F);
  end;
end;

procedure TmainForm.Button3Click(Sender: TObject);
begin

end;

end.
