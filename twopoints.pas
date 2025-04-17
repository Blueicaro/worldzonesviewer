unit twopoints;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, inputvector;

type

  { TTwoPointsframe }

  TTwoPointsframe = class(TFrame)
  private

  public
    constructor Create(TheOwner: TComponent); override;
  end;

implementation

{$R *.lfm}

{ TTwoPointsframe }
var
  P1Frame: Tinputvectorframe;
  P2Frame: Tinputvectorframe;

constructor TTwoPointsframe.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  P1Frame:=Tinputvectorframe.Create(Self);
  P1Frame.Parent := self;
  P1Frame.Align:=alTop;

  P2Frame:=Tinputvectorframe.Create(Self);
  P2Frame.Parent:=Self;
  P2Frame.Align:=alClient;

  Self.ClientWidth:=P1Frame.Width+P2Frame.Width ;
  Self.ClientHeight:=P1Frame.Height+P2Frame.Height;
end;




end.
