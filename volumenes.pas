unit volumenes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fgl, CastleVectors, CastleScene, CastleTransform;

  //type

  //  { Tbox }

  //  Tbox = class(TCastleBox)
  //  private
  //    FName: string;
  //    FP1: TVector3;
  //    FP2: TVector3;
  //    procedure SetVolumenName(AValue: string);
  //    procedure SetP1(AValue: TVector3);
  //    procedure SetP2(AValue: TVector3);
  //  public
  //    property P1: TVector3 read FP1 write SetP1;
  //    property P2: TVector3 read FP2 write SetP2;
  //    property Name: string read FName write SetVolumenName;
  //  public
  //    constructor Create(AOwner: TComponent; aName: string; Point1: TVector3;
  //      Point2: TVector3); overload;
  //  end;



type

  { TBoxBehavior }

  TBoxBehavior = class(TCastleBehavior)
  private
    FBoxName: string;
    FP1: TVector3;
    FP2: TVector3;
    procedure SetBoxName(AValue: string);
    procedure SetP1(AValue: TVector3);
    procedure SetP2(AValue: TVector3);
  public
    property BoxName: string read FBoxName write SetBoxName;
    property P1: TVector3 read FP1 write SetP1;
    property P2: TVector3 read FP2 write SetP2;
  end;



  //type

  //  { TSphere }

  //  TSphere = class(TCastleSphere)
  //  private
  //    FName: string;
  //    FRadius: single;
  //    FCenter: TVector3;
  //    procedure SetCenter(AValue: TVector3);
  //    procedure SetRadius(AValue: single);
  //    function GetRadius: single;
  //  public
  //    property Name: string read FName write Fname;
  //    property Radius: single read GetRadius write SetRadius;
  //    property Center: TVector3 read FCenter write SetCenter;
  //  public
  //    constructor Create(AOwner: TComponent; aName: string; aCenter: TVector3;
  //      aRadius: single); overload;
  //  end;

type

  { TSphereBehavior }

  TSphereBehavior = class(TCastleBehavior)
  private
    FCenter: TVector3;
    FSphereName: string;
    FRadius: single;
    procedure SetBoxName(AValue: string);
    procedure SetCenter(AValue: TVector3);
    procedure SetRadius(AValue: single);
    function GetRadius: single;
  public
    property Radius: single read GetRadius write SetRadius;
    property Center: TVector3 read FCenter write SetCenter;
    property SphereName: string read FSphereName write FSphereName;
  end;

  //type

  { TCylinder }

  //TCylinder = class(TCastleCylinder)
  //private
  //  FCylinderCenter: TVector3;
  //  FHeight: single;
  //  FName: string;
  //  FRadius: single;
  //  procedure SetRadius(AValue: single);
  //public
  //  property Name: string read FName write FName;
  //  property Radius: single read FRadius write SetRadius;
  //  property Height: single read FHeight;
  //  property Center: TVector3 read FCylinderCenter write FCylinderCenter;
  //public
  //  constructor Create(AOwner: TComponent; aName: string; aCenter: TVector3;
  //    aRadius: single; aHeight: single); overload;
  //end;

type

  { TCylinderBehaivor }

  TCylinderBehaivor = class(TCastleBehavior)
  private
    FCylinderCenter: TVector3;
    FHeight: single;
    FRadius: single;
    FWorldZoneName: string;
    procedure SetRadius(AValue: single);
  public
    property Radius: single read FRadius write SetRadius;
    property Height: single read FHeight;
    property Center: TVector3 read FCylinderCenter write FCylinderCenter;
    property WorldZoneName: string read FWorldZoneName write FWorldZoneName;
  end;




implementation




{ TSphereBehavior }

procedure TSphereBehavior.SetBoxName(AValue: string);
begin
  if FSphereName = AValue then exit;
  FSphereName := AValue;
end;

procedure TSphereBehavior.SetCenter(AValue: TVector3);
begin
  FCenter := AValue;
end;

procedure TSphereBehavior.SetRadius(AValue: single);
begin
  if AValue = FRadius then exit;
  FRadius := AValue;
end;

function TSphereBehavior.GetRadius: single;
begin
  Result := FRadius;
end;

{ TCylinderBehaivor }

procedure TCylinderBehaivor.SetRadius(AValue: single);
begin
  if AValue = FRadius then Exit;
  FRadius := AValue;
end;

{ TBoxBehavior }

procedure TBoxBehavior.SetBoxName(AValue: string);
begin
  if FBoxName = AValue then Exit;
  FBoxName := AValue;
end;

procedure TBoxBehavior.SetP1(AValue: TVector3);
begin
  FP1 := AValue;
end;

procedure TBoxBehavior.SetP2(AValue: TVector3);
begin
  FP2 := AValue;
end;

end.
