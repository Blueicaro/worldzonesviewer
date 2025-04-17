unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  FrameTree, CastleControl, CastleViewport, CastleScene, CastleUIControls,
  CastleVectors;

type

  { TmainForm }

  TmainForm = class(TForm)
    Button1: TButton;
    CastleControl1: TCastleControl;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    View: TCastleView;
    ViewPort: TCastleViewport;
  public

  end;

var
  mainForm: TmainForm;


implementation

uses ProjectsTree, volumenes, BoxPointsUnit;

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
end;

procedure TmainForm.Button1Click(Sender: TObject);
var
  F: TBoxPointsForm;
begin
  F := TBoxPointsForm.Create(Self);
  F.EditMode := True;
  F.ShowModal;
  F.Free;

end;

end.
