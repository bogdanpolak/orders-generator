object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 401
  ClientWidth = 721
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
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 198
    Height = 395
    Align = alLeft
    Caption = 'GroupBox1'
    TabOrder = 0
    object Button1: TButton
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 188
      Height = 25
      Action = actConnectServer
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 56
      ExplicitTop = 184
      ExplicitWidth = 75
    end
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 7
      Top = 49
      Width = 184
      Height = 104
      Margins.Left = 5
      Margins.Right = 5
      Align = alTop
      Caption = 'GroupBox2'
      TabOrder = 1
      object Label1: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 174
        Height = 13
        Align = alTop
        Caption = 'Label1'
        ExplicitLeft = 80
        ExplicitTop = 96
        ExplicitWidth = 31
      end
      object Edit1: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 37
        Width = 174
        Height = 21
        Align = alTop
        TabOrder = 0
        Text = 'Edit1'
        ExplicitLeft = 32
        ExplicitTop = 115
        ExplicitWidth = 121
      end
      object Button2: TButton
        AlignWithMargins = True
        Left = 5
        Top = 64
        Width = 174
        Height = 25
        Action = actRescheduleOrders
        Align = alTop
        TabOrder = 1
        ExplicitLeft = 56
        ExplicitTop = 121
        ExplicitWidth = 75
      end
    end
    object GroupBox3: TGroupBox
      AlignWithMargins = True
      Left = 7
      Top = 159
      Width = 184
      Height = 90
      Margins.Left = 5
      Margins.Right = 5
      Align = alTop
      Caption = 'GroupBox3'
      TabOrder = 2
      object Button3: TButton
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 174
        Height = 25
        Action = actStartGenerator
        Align = alTop
        TabOrder = 0
        ExplicitLeft = 24
        ExplicitTop = 32
        ExplicitWidth = 75
      end
      object Button4: TButton
        AlignWithMargins = True
        Left = 5
        Top = 49
        Width = 174
        Height = 25
        Action = actStopGenerator
        Align = alTop
        TabOrder = 1
        ExplicitLeft = 48
        ExplicitTop = 87
        ExplicitWidth = 75
      end
    end
  end
  object ActionList1: TActionList
    Left = 224
    Top = 8
    object actConnectServer: TAction
      Caption = 'actConnectServer'
      OnExecute = actConnectServerExecute
    end
    object actRescheduleOrders: TAction
      Caption = 'actRescheduleOrders'
      OnExecute = actRescheduleOrdersExecute
    end
    object actStartGenerator: TAction
      Caption = 'actStartGenerator'
      OnExecute = actStartGeneratorExecute
    end
    object actStopGenerator: TAction
      Caption = 'actStopGenerator'
      OnExecute = actStopGeneratorExecute
    end
  end
end
