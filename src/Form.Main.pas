unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    ActionList1: TActionList;
    actConnectServer: TAction;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    actRescheduleOrders: TAction;
    actStartGenerator: TAction;
    actStopGenerator: TAction;
    procedure actConnectServerExecute(Sender: TObject);
    procedure actRescheduleOrdersExecute(Sender: TObject);
    procedure actStartGeneratorExecute(Sender: TObject);
    procedure actStopGeneratorExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.actConnectServerExecute(Sender: TObject);
begin
  // TODO: code it
end;

procedure TForm1.actRescheduleOrdersExecute(Sender: TObject);
begin
  // TODO: code it
end;

procedure TForm1.actStartGeneratorExecute(Sender: TObject);
begin
  // TODO: code it
end;

procedure TForm1.actStopGeneratorExecute(Sender: TObject);
begin
  // TODO: code it
end;

end.
