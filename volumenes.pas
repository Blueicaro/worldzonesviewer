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



type

  { TSphere }

  TSphere = class(TCastleSphere)
  private
    FName: string;
    FRadius: single;
    FCenter: TVector3;
    procedure SetCenter(AValue: TVector3);
    procedure SetRadius(AValue: single);
    function GetRadius: single;
  public
    property Name: string read FName write Fname;
    property Radius: single read GetRadius write SetRadius;
    property Center: TVector3 read FCenter write SetCenter;
  public
    constructor Create(AOwner: TComponent; aName: string; aCenter: TVector3;
      aRadius: single); overload;
  end;

type

  { TSphereBehavior }

  TSphereBehavior = class(TCastleBehavior)
  private
    FSphereName: string;
    procedure SetBoxName(AValue: string);
  public
    property SphereName: string read FSphereName write FSphereName;
  end;

type

  { TCylinder }

  TCylinder = class(TCastleCylinder)
  private
    FCylinderCenter: TVector3;
    FHeight: single;
    FName: string;
    FRadius: single;
    procedure SetRadius(AValue: single);
  public
    property Name: string read FName write FName;
    property Radius: single read FRadius write SetRadius;
    property Height: single read FHeight;
    property Center: TVector3 read FCylinderCenter write FCylinderCenter;
  public
    constructor Create(AOwner: TComponent; aName: string; aCenter: TVector3;
      aRadius: single; aHeight: single); overload;
  end;

type

  { TCylinderBehaivor }

  TCylinderBehaivor = class(TCastleBehavior)
  private
    FWorldZoneName: string;
  public
    property WorldZoneName: string read FWorldZoneName write FWorldZoneName;
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

{ TSphere }


procedure TSphere.SetCenter(AValue: TVector3);
begin
  FCenter := AValue;
end;

procedure TSphere.SetRadius(AValue: single);
begin
  if FRadius = AValue then Exit;
  FRadius := AValue;
end;

function TSphere.GetRadius: single;
begin
  Result := Fradius;
end;

constructor TSphere.Create(AOwner: TComponent; aName: string;
  aCenter: TVector3; aRadius: single);
begin
  inherited Create(AOwner);
  FCenter := aCenter / 1000;
  SetRadius(aRadius / 1000);
  FName := aName;
end;

{ TSphereBehavior }

procedure TSphereBehavior.SetBoxName(AValue: string);
begin
  if FSphereName = AValue then exit;
  FSphereName := AValue;
end;

{ TCylinder }



procedure TCylinder.SetRadius(AValue: single);
begin
  if FRadius = AValue then Exit;
  FRadius := AValue;
end;

constructor TCylinder.Create(AOwner: TComponent; aName: string;
  aCenter: TVector3; aRadius: single; aHeight: single);
begin
  inherited Create(AOwner);
  // FCenter:=;
end;


{ TBoxBehavior }

procedure TBoxBehavior.SetBoxName(AValue: string);
begin
  if FBoxName = AValue then Exit;
  FBoxName := AValue;
end;

end.
