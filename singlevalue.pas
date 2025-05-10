unit singlevalue;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, Spin, SpinEx;

type

  { Tsinglevalueframe }

  Tsinglevalueframe = class(TFrame)
    LabelName: TLabel;
    SpinEdit1: TSpinEdit;
  private
    FNameValue: string;
    procedure SetNameValue(AValue: string);
    function GetValue:Single;
  public
    property NameValue:string read FNameValue write SetNameValue;
    property Value:single read GetValue;
    constructor Create(TheOwner: TComponent); override;
  end;

implementation

{$R *.lfm}

{ Tsinglevalueframe }

procedure Tsinglevalueframe.SetNameValue(AValue: string);
begin
  if FNameValue=AValue then Exit;
  FNameValue:=AValue;
  LabelName.Caption:=FNameValue;
end;

function Tsinglevalueframe.GetValue: Single;
begin
  Result := SpinEdit1.Value;
end;

constructor Tsinglevalueframe.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  LabelName.Caption:='';
end;

end.

