unit ProjectsTree;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls, volumenes;

type

  { TProjectsTreeFrame }

  TProjectsTreeFrame = class(TFrame)
    Tree: TTreeView;
  private

  public
    constructor Create(TheOwner: TComponent); override;
    procedure AddBoxZone(aBoxZone: Tbox);
    procedure AddSphereZone(aSphereZone:TSphere);
  end;

implementation

uses comun;
  {$R *.lfm}

  { TProjectsTreeFrame }

constructor TProjectsTreeFrame.Create(TheOwner: TComponent);
var
  root, WorldZonesNode: TTreeNode;
begin
  inherited Create(TheOwner);
  root := Tree.Items.Add(nil, NewProjectNameText);

  Tree.Items.AddChild(root, RobotsNode);

  WorldZonesNode := Tree.Items.AddChild(root, WorldZonesNodeText);

  Tree.Items.AddChild(WorldZonesNode, CylinderZonesText);
  Tree.Items.AddChild(WorldZonesNode, EsphereZonesText);
  Tree.Items.AddChild(WorldZonesNode, BoxZonesText);

  Tree.FullExpand;

end;

procedure TProjectsTreeFrame.AddBoxZone(aBoxZone: Tbox);
var
  Node: TTreeNode;
begin
  Node := Tree.Items.FindNodeWithText(BoxZonesText);
  { #note : Poner un aviso? }
  if Node = nil then exit;
  Tree.Items.AddChild(node,aBoxZone.Name);
end;

procedure TProjectsTreeFrame.AddSphereZone(aSphereZone: TSphere);
var
  Node: TTreeNode;
begin
  Node := Tree.Items.FindNodeWithText(EsphereZonesText);
  if Node = nil then exit;
  Tree.Items.Add(Node,aSphereZone.Name);
end;

end.
