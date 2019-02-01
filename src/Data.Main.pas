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
  Proxy.Orders,
  Model.Orders;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    OrdersTable: TFDQuery;
  private
    function CreateAllOrdersProxy: TOrdersProxy;
  public
    procedure LoadOrdersStore;
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

procedure TDataModule1.LoadOrdersStore;
var
  OrdersProxy: TOrdersProxy;
  Order: TOrder;
begin
  OrdersProxy := CreateAllOrdersProxy;
  try
    TOrderStore.Store.Clear;
    while not OrdersProxy.Eof do begin
      Order := TOrder.Create;
      Order.OrderID := OrdersProxy.OrderID.Value;
      Order.CustomerID := OrdersProxy.CustomerID.Value;
      Order.EmployeeID := OrdersProxy.EmployeeID.Value;
      Order.OrderDate := OrdersProxy.OrderDate.Value;
      Order.RequiredDate := OrdersProxy.RequiredDate.Value;
      Order.ShippedDate := OrdersProxy.ShippedDate.Value;
      Order.ShipVia := OrdersProxy.ShipVia.Value;
      Order.Freight := OrdersProxy.Freight.Value;
      TOrderStore.Store.Add(Order);
      OrdersProxy.Next;
    end;
  finally
    OrdersProxy.Free;
  end;


end;

end.
