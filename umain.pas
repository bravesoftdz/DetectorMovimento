unit umain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    pnlWebCam: TPanel;
    btnConectar: TButton;
    btnDesconectar: TButton;
    btnCopiar: TButton;
    imgAtual: TImage;
    imgAnterior: TImage;
    Timer1: TTimer;
    Button1: TButton;
    procedure btnConectarClick(Sender: TObject);
    procedure btnDesconectarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    HWndCaptura: HWnd;
  public
    { Public declarations }
  end;

function capCreateCaptureWindowA(lpszWindowName: PCHAR; dwStyle: longint;
  x: integer; y: integer; nWidth: integer; nHeight: integer; ParentWin: HWnd;
  nId: integer): HWnd;
stdcall external 'AVICAP32.DLL';

{ Mensagem base }
const
  WM_CAP_START = WM_USER;

  { Conectar a WebCam }
const
  WM_CAP_DRIVER_CONNECT = WM_CAP_START + 10;

  { Desconectar a WebCam }
const
  WM_CAP_DRIVER_DISCONNECT = WM_CAP_START + 11;

  { Preview }
const
  WM_CAP_SET_PREVIEW = WM_CAP_START + 50;

  { Configurar frames por segundo }
const
  WM_CAP_SET_PREVIEWRATE = WM_CAP_START + 52;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnConectarClick(Sender: TObject);
begin
  HWndCaptura := capCreateCaptureWindowA('Detecção de Movimento no Delphi',
    WS_CHILD or WS_VISIBLE, pnlWebCam.Left, pnlWebCam.Top, pnlWebCam.Width,
    pnlWebCam.Height, pnlWebCam.Handle, 0);
  if HWndCaptura <> 0 then
  begin
    try
      SendMessage(HWndCaptura, WM_CAP_DRIVER_CONNECT, 0, 0);
      SendMessage(HWndCaptura, WM_CAP_SET_PREVIEWRATE, 1, 0);
      SendMessage(HWndCaptura, WM_CAP_SET_PREVIEW, 1, 0);
      btnDesconectar.Enabled := True;
      btnConectar.Enabled := False;
      Timer1.Enabled := True;
    Except
      // Insira um manipulador se desejar
      raise;
    end;
  end
  else
  begin
    MessageDlg('Erro ao conectar ao driver da câmera!', mtError, [mbok], 0);
    btnDesconectar.Enabled := False;
    btnConectar.Enabled := True;
    Timer1.Enabled := False;
  end;
end;

procedure TForm1.btnDesconectarClick(Sender: TObject);
begin
  if HWndCaptura <> 0 then
  begin
    SendMessage(HWndCaptura, WM_CAP_DRIVER_DISCONNECT, 0, 0);
    btnDesconectar.Enabled := False;
    btnConectar.Enabled := True;
  end;
  Timer1.Enabled := False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if HWndCaptura <> 0 then
  SendMessage(HWndCaptura,WM_CAP_START +41, 0, 0);
end;

end.
