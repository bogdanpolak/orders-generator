program OrdersGenerator;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  Data.Main in 'Data.Main.pas' {DataModule1: TDataModule},
  Proxy.Orders in 'Proxy\Proxy.Orders.pas',
  Data.DataProxy in 'Proxy\Data.DataProxy.pas',
  Model.Orders in 'Model\Model.Orders.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
