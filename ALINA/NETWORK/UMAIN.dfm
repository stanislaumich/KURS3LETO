object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1077#1090#1080'. '#1050#1091#1088#1089#1086#1074#1072#1103' '#1088#1072#1073#1086#1090#1072'. '#1050#1088#1072#1074#1095#1077#1085#1082#1086' '#1040#1083#1080#1085#1072'.'
  ClientHeight = 267
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    438
    267)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 423
    Height = 69
    Anchors = [akLeft, akTop, akRight]
    Caption = #1048#1084#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072' '#1080' '#1088#1072#1073#1086#1095#1077#1081' '#1075#1088#1091#1087#1087#1099
    TabOrder = 0
    ExplicitWidth = 313
    object Label1: TLabel
      Left = 12
      Top = 20
      Width = 89
      Height = 13
      Caption = #1048#1084#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072':'
    end
    object Label2: TLabel
      Left = 12
      Top = 44
      Width = 84
      Height = 13
      Caption = #1056#1072#1073#1086#1095#1072#1103' '#1075#1088#1091#1087#1087#1072':'
    end
    object Edit1: TEdit
      Left = 102
      Top = 17
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 102
      Top = 41
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit2'
    end
    object Button1: TButton
      Left = 229
      Top = 15
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 229
      Top = 39
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 83
    Width = 423
    Height = 74
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' TCP/IP'
    TabOrder = 1
    ExplicitWidth = 313
    object Label3: TLabel
      Left = 34
      Top = 24
      Width = 14
      Height = 13
      Caption = 'IP:'
    end
    object Label4: TLabel
      Left = 13
      Top = 51
      Width = 35
      Height = 13
      Caption = #1052#1072#1089#1082#1072':'
    end
    object Label5: TLabel
      Left = 14
      Top = 78
      Width = 34
      Height = 13
      Caption = #1064#1083#1102#1079':'
      Visible = False
    end
    object Edit3: TEdit
      Left = 53
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 53
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit4'
    end
    object Edit5: TEdit
      Left = 53
      Top = 75
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit5'
      Visible = False
    end
    object Button3: TButton
      Left = 188
      Top = 19
      Width = 93
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 3
      OnClick = Button3Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 163
    Width = 423
    Height = 169
    Anchors = [akLeft, akTop, akRight]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' FIREWALL'
    TabOrder = 2
    ExplicitWidth = 313
    object Label6: TLabel
      Left = 53
      Top = 17
      Width = 102
      Height = 13
      Caption = #1057#1045#1058#1068' '#1055#1056#1045#1044#1055#1056#1048#1071#1058#1048#1071
    end
    object Label7: TLabel
      Left = 32
      Top = 48
      Width = 123
      Height = 13
      Caption = #1054#1041#1065#1045#1044#1054#1057#1058#1059#1055#1053#1040#1071' '#1057#1045#1058#1068
    end
    object Label8: TLabel
      Left = 79
      Top = 79
      Width = 76
      Height = 13
      Caption = #1063#1040#1057#1058#1053#1040#1071' '#1057#1045#1058#1068
    end
    object Button4: TButton
      Left = 171
      Top = 12
      Width = 75
      Height = 25
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100
      TabOrder = 0
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 252
      Top = 12
      Width = 75
      Height = 25
      Caption = #1042#1099#1082#1083#1102#1095#1080#1090#1100
      TabOrder = 1
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 171
      Top = 43
      Width = 75
      Height = 25
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100
      TabOrder = 2
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 252
      Top = 43
      Width = 75
      Height = 25
      Caption = #1042#1099#1082#1083#1102#1095#1080#1090#1100
      TabOrder = 3
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 171
      Top = 74
      Width = 75
      Height = 25
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100
      TabOrder = 4
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 252
      Top = 74
      Width = 75
      Height = 25
      Caption = #1042#1099#1082#1083#1102#1095#1080#1090#1100
      TabOrder = 5
      OnClick = Button9Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 42
    Top = 392
    Width = 245
    Height = 119
    Caption = 'GroupBox4'
    TabOrder = 3
  end
end
