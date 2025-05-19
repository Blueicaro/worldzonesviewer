unit downloadabb;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, fphttpclient, opensslsockets;

type

  { TDownLoadAbbFrm }

  TDownLoadAbbFrm = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  DownLoadAbbFrm: TDownLoadAbbFrm;

implementation

uses comun;
  {$R *.lfm}

  { TDownLoadAbbFrm }

procedure TDownLoadAbbFrm.Button1Click(Sender: TObject);
var
  Server: TFPHTTPClient;
  Respuesta: TStringList;
  R1: String;
begin
  Server := TFPHTTPClient.Create(Self);
  Respuesta := TStringList.Create;
  try
    Server.AllowRedirect := True;
    //Server.on
   // Server.Get(AbbRepository,Respuesta);
    //Server.HTTPMethod(Get,);


    //Respuesta.Clear;
    //Server.Get(
    //  'https://prod-app-library-abblibrary-gkgsddcpbhhwhmhf.a01.azurefd.net/dc/282-efa2716003ff404247af.js',
    //  Respuesta);
    Memo1.Lines.Add(Respuesta.Text)
  finally
    FreeAndNil(Respuesta);
    FreeAndNil(Server);
  end;
end;

{ TDownLoadAbbFrm }

end.
