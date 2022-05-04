unit MainU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

type
  TForm9 = class(TForm)
    imgurl1: TImage;
    BtnLoadImage: TButton;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    procedure Load_Image();
    procedure BtnLoadImageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}
uses JPEG;

procedure TForm9.BtnLoadImageClick(Sender: TObject);
begin
  Load_Image;
end;

procedure TForm9.Load_Image;
 var
    JPG: TJPEGImage;
    MS : TMemoryStream;
    URL : String;
begin
 screen.Cursor := crHourglass;
 URL := 'https://espadatechnology.com/images/20180217_090110.jpg' ;
         begin
                  MS := TMemoryStream.Create;
                  JPG := TJpegImage.Create;

                  try
                   IdHTTP1.Get(URL,MS);
                   Ms.Seek(0,soFromBeginning);
                   JPG.LoadFromStream(MS);
                   imgurl1.Picture.Assign(JPG);
                  finally
                    FreeAndNil(JPG);
                    FreeAndNil(MS);
                  end;

         end;
          screen.Cursor := crDefault;
end;

end.
