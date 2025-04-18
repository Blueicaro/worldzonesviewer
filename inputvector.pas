unit inputvector;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Spin, StdCtrls, CastleVectors;

type

  { Tinputvectorframe }

  Tinputvectorframe = class(TFrame)
    LabelPointName: TLabel;
    LabelInfo: TLabel;
    spEditX: TSpinEdit;
    spEditY: TSpinEdit;
    spEditZ: TSpinEdit;
    procedure LabelInfoClick(Sender: TObject);
  private
    FPointNumber: integer;
    procedure SetPointNumber(AValue: integer);
  public
    procedure HideInfo;
    procedure IniciarValores;
    procedure SetValues(aValues: TVector3);
    function GetValues: TVector3;

    constructor Create(TheOwner: TComponent); override;
    property PointNumber: integer read FPointNumber write SetPointNumber;
  end;

implementation

{$R *.lfm}

{ Tinputvectorframe }

procedure Tinputvectorframe.LabelInfoClick(Sender: TObject);
begin
  LabelInfo.Visible := False;
end;

procedure Tinputvectorframe.SetPointNumber(AValue: integer);
begin
  if FPointNumber = AValue then Exit;
  FPointNumber := AValue;
  LabelPointName.Caption := 'P'+IntToStr(FPointNumber);
end;

procedure Tinputvectorframe.HideInfo;
begin
  LabelInfo.Visible := False;
end;

procedure Tinputvectorframe.IniciarValores;
begin
  spEditX.Value := 0;
  spEditY.Value := 0;
  spEditZ.Value := 0;
end;

procedure Tinputvectorframe.SetValues(aValues: TVector3);
begin
  spEditX.Value := aValues.X;
  spEdity.Value := aValues.y;
  spEditz.Value := aValues.z;
end;

function Tinputvectorframe.GetValues: TVector3;
begin
  Result := Vector3(spEditX.Value, spEditY.Value, spEditZ.Value);
end;

constructor Tinputvectorframe.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
end;

end.
