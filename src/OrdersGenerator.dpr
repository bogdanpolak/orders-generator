program OrdersGenerator;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  Data.Main in 'Data.Main.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
