unit FrameTree;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls;

type

  { TTreeFrame }

  TTreeFrame = class(TFrame)
    TreeProjects: TTreeView;
  private

  public
    constructor Create(TheOwner: TComponent); override;
  end;

implementation
uses comun;
{$R *.lfm}

{ TTreeFrame }

constructor TTreeFrame.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  TreeProjects.Items.Add(nil,NewProjectName);
end;

end.

