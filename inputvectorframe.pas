unit inputvectorframe;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Spin, StdCtrls, CastleVectors;

type

  { TFrame1 }

  TFrame1 = class(TFrame)
    Label1: TLabel;
    spEditX: TSpinEdit;
    spEditY: TSpinEdit;
    spEditZ: TSpinEdit;
  private
  public
    procedure IniciarValores;
    procedure SetValues(aValues: TVector3);
    function GetValues: TVector3;

  end;

implementation

{$R *.lfm}

{ TFrame1 }

procedure TFrame1.IniciarValores;
begin
  spEditX.Value := 0;
  spEditY.Value := 0;
  spEditZ.Value := 0;
end;

procedure TFrame1.SetValues(aValues: TVector3);
begin
  spEditX.Value := aValues.X;
  spEdity.Value := aValues.y;
  spEditz.Value := aValues.z;
end;

function TFrame1.GetValues: TVector3;
begin
  Result := Vector3(spEditX.Value, spEditY.Value, spEditZ.Value);
end;

end.
