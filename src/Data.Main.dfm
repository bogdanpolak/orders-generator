object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 220
  Width = 347
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=NorthwindPlus')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 8
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 240
    Top = 64
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 240
    Top = 8
  end
end
