unit ProjectsTree;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls;

type

  { TProjectsTreeFrame }

  TProjectsTreeFrame = class(TFrame)
    Tree: TTreeView;
  private

  public
    constructor Create(TheOwner: TComponent); override;
  end;

implementation

uses comun;
  {$R *.lfm}

  { TProjectsTreeFrame }

constructor TProjectsTreeFrame.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  Tree.Items.Add(nil,NewProjectName);
end;

end.
