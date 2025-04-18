unit volumenes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fgl, CastleVectors, CastleScene, CastleTransform;

type

  { Tbox }

  Tbox = class(TCastleBox)
  private
    FName: string;
    FP1: TVector3;
    FP2: TVector3;
    procedure SetVolumenName(AValue: string);
    procedure SetP1(AValue: TVector3);
    procedure SetP2(AValue: TVector3);
  public
    property P1: TVector3 read FP1 write SetP1;
    property P2: TVector3 read FP2 write SetP2;
    property Name: string read FName write SetVolumenName;
  public
    constructor Create(AOwner: TComponent; aName: string; Point1: TVector3;
      Point2: TVector3); overload;
  end;

type

  { TBoxBehavior }

  TBoxBehavior = class(TCastleBehavior)
  private
    FBoxName: string;
    procedure SetBoxName(AValue: string);
  public
    property BoxName: string read FBoxName write SetBoxName;
  end;

   Type TEsphere = Class

   end;

type
  TBoxList = specialize TFPGObjectList<Tbox>;



implementation


{ Tbox }

procedure Tbox.SetP1(AValue: TVector3);
begin
  FP1 := AValue;
end;

procedure Tbox.SetVolumenName(AValue: string);
begin
  if FName = AValue then Exit;
  FName := AValue;
end;

procedure Tbox.SetP2(AValue: TVector3);
begin
  FP2 := AValue;
end;

constructor Tbox.Create(AOwner: TComponent; aName: string; Point1: TVector3;
  Point2: TVector3);
begin
  inherited Create(AOwner);
  P1 := Point1 / 1000;
  P2 := Point2 / 1000;
  Self.Translation := (FP2 - FP1);
  Self.Size := (FP2 - FP1) / 2;
  FName := aName;
end;

{ TBoxBehavior }

procedure TBoxBehavior.SetBoxName(AValue: string);
begin
  if FBoxName = AValue then Exit;
  FBoxName := AValue;
end;

end.
