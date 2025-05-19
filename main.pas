unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ActnList, Menus, volumenes, CastleControl, CastleViewport, CastleScene,
  CastleUIControls, CastleVectors, CastleTransform;

type

  { TmainForm }

  TmainForm = class(TForm)
    acCreateCylinder: TAction;
    acCrearCubo: TAction;
    acNew: TAction;
    acCreateSphere: TAction;
    ActionList1: TActionList;
    Button1: TButton;
    CastleControl1: TCastleControl;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    mnExit: TMenuItem;
    Panel1: TPanel;
    Separator1: TMenuItem;
    procedure acCrearCuboExecute(Sender: TObject);
    procedure acCreateCylinderExecute(Sender: TObject);
    procedure acCreateSphereExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnExitClick(Sender: TObject);
  private
    View: TCastleView;
    ViewPort: TCastleViewport;
    World: TCastleTransform; //Origen
    procedure AddBoxToScene(aWorldZoneName: string; aP1: TVector3; aP2: TVector3);
    procedure AddSphereToScene(aWorldZoneName: string; aCenter: TVector3;
      aRadius: single);
    procedure AddCylinderToScene(aName: string; aCenter: TVector3;
      aRadius: single; aHeight: single);
  public

  end;

var
  mainForm: TmainForm;


implementation

uses ProjectsTree, BoxPointsUnit, espherapoints, cylinderpoints,
  CastleUtils, downloadabb;

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

procedure TmainForm.mnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TmainForm.AddBoxToScene(aWorldZoneName: string; aP1: TVector3; aP2: TVector3);
var
  Size, Diagonal: TVector3;
  CastleBox: TCastleBox;
  Behavior: TBoxBehavior;
begin
  Diagonal := aP2 - aP1;
  Diagonal := Diagonal / 2;
  Size := aP2 - aP1;

  CastleBox := TCastleBox.Create(Self);
  CastleBox.Size := Size;
  CastleBox.Color := Vector4(0.4, 0.5, 1, 0.18);

  Behavior := TBoxBehavior.Create(CastleBox);
  Behavior.BoxName := aWorldZoneName;
  Behavior.P1 := aP1;
  Behavior.P2 := aP2;

  CastleBox.AddBehavior(Behavior);
  World.Add(CastleBox);
  CastleBox.Translation := CastleBox.Translation + Diagonal;

  if Assigned(TreeFrame1) then
  begin
    TreeFrame1.AddBoxZone(aWorldZoneName);
  end;
end;

procedure TmainForm.AddSphereToScene(aWorldZoneName: string;
  aCenter: TVector3; aRadius: single);
var
  CastleSphere: TCastleSphere;
  Behaivor: TSphereBehavior;
begin
  CastleSphere := TCastleSphere.Create(Self);
  CastleSphere.Color := Vector4(0.4, 0.5, 1, 0.18);
  CastleSphere.Radius := aRadius;
  ;

  Behaivor := TSphereBehavior.Create(CastleSphere);
  Behaivor.SphereName := aWorldZoneName;
  Behaivor.Radius := aRadius;
  CastleSphere.AddBehavior(Behaivor);

  World.Add(CastleSphere);
  CastleSphere.Translation := aCenter;
  TreeFrame1.AddSphereZone(aWorldZoneName);
end;

procedure TmainForm.AddCylinderToScene(aName: string; aCenter: TVector3;
  aRadius: single; aHeight: single);
var
  CastleCylinder: TCastleCylinder;
  Behaivor: TCylinderBehaivor;
begin
  CastleCylinder := TCastleCylinder.Create(Self);
  CastleCylinder.Color := Vector4(0.4, 0.5, 1, 0.18);
  CastleCylinder.Radius := aRadius / 1000;
  CastleCylinder.Height := aHeight / 1000;
  Behaivor := TCylinderBehaivor.Create(CastleCylinder);
  Behaivor.WorldZoneName := aName;
  World.Add(CastleCylinder);

  //Rotaion to put Z up
  CastleCylinder.Rotation := Vector4(1, 0, 0, Deg(90));
  CastleCylinder.Translation := (aCenter / 1000);

end;



procedure TmainForm.acCreateCylinderExecute(Sender: TObject);
var
  F: TCylinderPointsFrm;
begin
  F := TCylinderPointsFrm.Create(Self);
  try
    if F.ShowModal = mrOk then
    begin
      with F do
      begin
        AddCylinderToScene(WorldZoneName, Center, Radius, Height);
      end;
    end;
  finally
    FreeAndNil(F);
  end;
end;

procedure TmainForm.acCreateSphereExecute(Sender: TObject);
var
  F: TSphereForm;
begin
  F := TSphereForm.Create(Self);
  try
    if F.ShowModal = mrOk then
    begin
      AddSphereToScene(F.EsphereName, f.CenterSphere, f.Radius);
    end;
  finally
  end;
end;

procedure TmainForm.Button1Click(Sender: TObject);
var
  Robot: TCastleScene;
  s: string;
begin
  Robot := TCastleScene.Create(Self);

  s := GetCurrentDir;
  s := PathDelim + 'data' + PathDelim + 'IRB6700_300_270__04.glf';
  //s := UriToFilenameSafe(s);
  Robot.Load('castle-data:/IRB6700_300_270__04.glf');
  World.Add(Robot);
end;

procedure TmainForm.acCrearCuboExecute(Sender: TObject);
var
  F: TBoxPointsForm;
begin
  F := TBoxPointsForm.Create(Self);
  try
    F.EditMode := True;
    if F.ShowModal = mrOk then
    begin
      AddBoxToScene(F.NameOfVolumen, F.Point1, F.Point2);
    end;
  finally
    FreeAndNil(F);
  end;

end;

procedure TmainForm.Button2Click(Sender: TObject);
var
  f: TDownLoadAbbFrm;
begin

  f := TDownLoadAbbFrm.Create(nil);
  try
    f.ShowModal;
  finally
    FreeAndNil(f);
  end;

end;

procedure TmainForm.Button3Click(Sender: TObject);
begin

end;

end.
