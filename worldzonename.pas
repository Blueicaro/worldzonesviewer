unit worldzonename;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls;

type

  { Tworldzonenameframe }

  Tworldzonenameframe = class(TFrame)
    EditName: TEdit;
    LabelName: TLabel;
  private
     function GetZoneName:string;
  public
    property ZoneName:String read GetZoneName;
    destructor Destroy; override;
  end;

implementation

{$R *.lfm}

{ Tworldzonenameframe }

function Tworldzonenameframe.GetZoneName: string;
begin
  result := EditName.Text;
end;

destructor Tworldzonenameframe.Destroy;
begin
  inherited Destroy;
end;

end.

