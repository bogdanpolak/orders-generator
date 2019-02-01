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
  Model.Orders;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    OrdersTable: TFDQuery;
    fdqOrderORM: TFDQuery;
  private
  public
    procedure LoadOrdersStore;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Plus.Nullable;
{$R *.dfm}

procedure TDataModule1.LoadOrdersStore;
var
  Order: TOrder;
begin
  fdqOrderORM.Open('SELECT ' + sLineBreak +
    '  ORDERID, CUSTOMERID, EMPLOYEEID, ORDERDATE, ' + sLineBreak +
    '  REQUIREDDATE, SHIPPEDDATE, SHIPVIA, FREIGHT ' + sLineBreak +
    'FROM {id Orders} ');
  TOrderStore.Store.Clear;
  while not fdqOrderORM.Eof do
  begin
    Order := TOrder.Create;
    Order.OrderID.Create(fdqOrderORM.FieldByName('OrderID').Value);
    Order.CustomerID.Create(fdqOrderORM.FieldByName('CustomerID').Value);
    Order.EmployeeID.Create(fdqOrderORM.FieldByName('EmployeeID').Value);
    Order.OrderDate.Create(fdqOrderORM.FieldByName('OrderDate').Value);
    Order.RequiredDate.Create(fdqOrderORM.FieldByName('RequiredDate').Value);

    // Order.ShippedDate.Create(fdqOrderORM.FieldByName('ShippedDate').Value);
    Order.ShippedDate := fdqOrderORM.FieldByName('ShippedDate').Value;

    Order.ShipVia.Create(fdqOrderORM.FieldByName('ShipVia').Value);
    Order.Freight.Create(fdqOrderORM.FieldByName('Freight').Value);
    TOrderStore.Store.Add(Order);
    fdqOrderORM.Next;
  end;
  fdqOrderORM.Close;
end;

end.
