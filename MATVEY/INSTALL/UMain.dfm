object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1048#1085#1089#1090#1072#1083#1083#1103#1090#1086#1088'. '#1055#1086#1083#1091#1103#1085#1086#1074' '#1052#1072#1090#1074#1077#1081'.'
  ClientHeight = 395
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 746
    Height = 305
    Align = alTop
    Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1072#1082#1077#1090#1072' '#1080#1085#1089#1090#1072#1083#1083#1103#1094#1080#1080
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 155
      Height = 13
      Caption = #1057#1087#1080#1089#1086#1082' '#1092#1072#1081#1083#1086#1074' '#1076#1083#1103' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
    end
    object Label2: TLabel
      Left = 10
      Top = 275
      Width = 81
      Height = 13
      Caption = #1062#1077#1083#1077#1074#1072#1103' '#1087#1072#1087#1082#1072':'
    end
    object Button1: TButton
      Left = 612
      Top = 270
      Width = 117
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1082#1077#1090
      TabOrder = 0
      OnClick = Button1Click
    end
    object ListBox1: TListBox
      Left = 8
      Top = 40
      Width = 377
      Height = 197
      ItemHeight = 13
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 8
      Top = 245
      Width = 377
      Height = 21
      TabOrder = 2
    end
    object Button3: TButton
      Left = 396
      Top = 244
      Width = 75
      Height = 25
      Caption = #1071#1088#1083#1099#1082
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 396
      Top = 40
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 4
      OnClick = Button4Click
    end
    object Edit4: TEdit
      Left = 97
      Top = 272
      Width = 288
      Height = 21
      TabOrder = 5
    end
    object Button5: TButton
      Left = 396
      Top = 272
      Width = 75
      Height = 25
      Caption = #1059#1082#1072#1079#1072#1090#1100
      TabOrder = 6
      OnClick = Button5Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 305
    Width = 746
    Height = 90
    Align = alClient
    Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1080#1079' '#1087#1072#1082#1077#1090#1072' '#1080#1085#1089#1090#1072#1083#1083#1103#1094#1080#1080
    TabOrder = 1
    ExplicitTop = 303
    ExplicitHeight = 201
    object Label3: TLabel
      Left = 8
      Top = 23
      Width = 85
      Height = 13
      Caption = #1055#1091#1090#1100' '#1091#1089#1090#1072#1085#1086#1074#1082#1080':'
    end
    object Button2: TButton
      Left = 500
      Top = 58
      Width = 117
      Height = 25
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1072#1082#1077#1090
      TabOrder = 0
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 8
      Top = 60
      Width = 489
      Height = 21
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 99
      Top = 20
      Width = 498
      Height = 21
      TabOrder = 2
    end
    object Button6: TButton
      Left = 612
      Top = 16
      Width = 117
      Height = 25
      Caption = #1059#1082#1072#1079#1072#1090#1100
      TabOrder = 3
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 623
      Top = 58
      Width = 106
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1082#1077#1090
      TabOrder = 4
    end
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofFileMustExist, ofEnableSizing]
    Left = 656
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    Filter = #1060#1072#1081#1083#1099' '#1091#1089#1090#1072#1085#1074#1082#1080'(*.stp)|*.stp'
    Left = 656
    Top = 72
  end
end
