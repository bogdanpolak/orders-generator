unit Data.Main;

interface

uses
  System.SysUtils, System.Classes,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Stan.Param,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Phys.Intf, FireDAC.Phys, FireDAC.Phys.IBDef,
  FireDAC.Phys.FBDef, FireDAC.Phys.FB, FireDAC.Phys.IBBase,
  FireDAC.Phys.IB,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Data.DB,
  Proxy.Orders;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    OrdersTable: TFDQuery;
  private
  public
    function CreateAllOrdersProxy: TOrdersProxy;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModule1 }

function TDataModule1.CreateAllOrdersProxy: TOrdersProxy;
var
  sql: string;
  Proxy: TOrdersProxy;
  Query: TFDQuery;
begin
  sql := 'SELECT ' + sLineBreak +
    '  ORDERID, CUSTOMERID, EMPLOYEEID, ORDERDATE, ' + sLineBreak +
    '  REQUIREDDATE, SHIPPEDDATE, SHIPVIA, FREIGHT ' + sLineBreak +
    'FROM ORDERS ';
  Proxy := TOrdersProxy.Create(Self);
  Query := TFDQuery.Create(Proxy);
  Query.Connection := FDConnection1;
  Query.FetchOptions.Mode := fmAll;
  Query.sql.Text := sql;
  Proxy.ConnectWithDataSet(Query);
  Proxy.Open;
  Result := Proxy;
end;

end.
