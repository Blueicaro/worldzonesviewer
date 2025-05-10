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

  public
    destructor Destroy; override;
  end;

implementation

{$R *.lfm}

{ Tworldzonenameframe }

destructor Tworldzonenameframe.Destroy;
begin
  inherited Destroy;
end;

end.

