unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  volumenes, CastleControl, CastleViewport, CastleScene, CastleUIControls,
  CastleVectors;

type

  { TmainForm }

  TmainForm = class(TForm)
    Button1: TButton;
    CastleControl1: TCastleControl;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    View: TCastleView;
    ViewPort: TCastleViewport;
    BoxList: TBoxList;
    procedure AddBoxToScene(aBox:Tbox);
  public

  end;

var
  mainForm: TmainForm;


implementation

uses ProjectsTree, BoxPointsUnit;

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
 Trans := aBox.P2-aBox.P1;
 Size := Vector3(Trans.X/2,Trans.Y/2,Trans.Z/2);

 CastleBox :=TCastleBox.Create(Self);

 CastleBox.Size := Size;
 Behavior := TBoxBehavior.Create(CastleBox);
 Behavior.BoxName:= aBox.Name;
 CastleBox.AddBehavior(Behavior);
 ViewPort.Items.Add(CastleBox);
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
      AddBoxToScene (Box);
      BoxList.Add(Box);

    end;
  finally
    FreeAndNil(F);
  end;

end;

end.
