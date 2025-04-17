unit boxtwopointsunit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, twopoints;

type

  { TBoxPointTwoFrm }

  TBoxPointTwoFrm = class(TForm)
    ButtonPanel1: TButtonPanel;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  BoxPointTwoFrm: TBoxPointTwoFrm;
  PoinstFrame: TTwoPointsframe;

implementation

{$R *.lfm}

{ TBoxPointTwoFrm }

procedure TBoxPointTwoFrm.FormCreate(Sender: TObject);
begin
   PoinstFrame := TTwoPointsframe.Create(Self);
   PoinstFrame.Parent:=Self;
   PoinstFrame.Align:=alClient;
   Self.ClientHeight:=PoinstFrame.Height;
   Self.ClientWidth:=PoinstFrame.Width;
end;

end.
