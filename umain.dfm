object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 414
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object imgAtual: TImage
    Left = 422
    Top = 24
    Width = 105
    Height = 105
  end
  object imgAnterior: TImage
    Left = 422
    Top = 184
    Width = 105
    Height = 105
  end
  object pnlWebCam: TPanel
    Left = -8
    Top = 0
    Width = 401
    Height = 289
    BevelOuter = bvNone
    Caption = 'Webcam n'#227'o conectada'
    Color = clBtnShadow
    ParentBackground = False
    TabOrder = 0
  end
  object btnConectar: TButton
    Left = 64
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 1
    OnClick = btnConectarClick
  end
  object btnDesconectar: TButton
    Left = 208
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Desconectar'
    TabOrder = 2
    OnClick = btnDesconectarClick
  end
  object btnCopiar: TButton
    Left = 344
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Copiar'
    TabOrder = 3
  end
  object Button1: TButton
    Left = 176
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Timer1: TTimer
    Interval = 8000
    Left = 32
    Top = 336
  end
end
