object WaitMessageForm: TWaitMessageForm
  Left = 380
  Top = 240
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 99
  ClientWidth = 392
  Color = $00F9F8FA
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object f_WaitMessageMemo: TMemo
    Left = 0
    Top = 0
    Width = 392
    Height = 85
    Align = alClient
    Alignment = taCenter
    BevelInner = bvNone
    BevelOuter = bvNone
    Color = $00F9F8FA
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object f_GradientWaitBarPanel: TPanel
    Left = 0
    Top = 85
    Width = 392
    Height = 14
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object f_GradientWaitBar: TvtGradientWaitbar
      Left = 0
      Top = 1
      Width = 390
      Height = 12
      Active = True
      Color1 = clSkyBlue
      Color2 = clBlue
      Speed = 10
    end
  end
end
