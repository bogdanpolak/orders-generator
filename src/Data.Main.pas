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
{$R *.dfm}

procedure TDataModule1.LoadOrdersStore;
var
  Order: TOrder;
begin
  fdqOrderORM.Open('SELECT ' + sLineBreak +
    '  ORDERID, CUSTOMERID, EMPLOYEEID, ORDERDATE, ' + sLineBreak +
    '  REQUIREDDATE, SHIPPEDDATE, SHIPVIA, FREIGHT ' + sLineBreak +
    'FROM ORDERS ');
  TOrderStore.Store.Clear;
  while not fdqOrderORM.Eof do
  begin
    Order := TOrder.Create;
    Order.OrderID := fdqOrderORM.FieldByName('OrderID').Value;
    Order.CustomerID := fdqOrderORM.FieldByName('CustomerID').Value;
    Order.EmployeeID := fdqOrderORM.FieldByName('EmployeeID').Value;
    Order.OrderDate := fdqOrderORM.FieldByName('OrderDate').Value;
    Order.RequiredDate := fdqOrderORM.FieldByName('RequiredDate').Value;
    // TODO: Potrzebny jest TNullableDateTime (sprawdü Spring4D)
    // Ewentualnie zmienic wszystkie wartoúci na Variant (brrrr!!)
    Order.ShippedDate := fdqOrderORM.FieldByName('ShippedDate').AsDateTime;
    Order.ShipVia := fdqOrderORM.FieldByName('ShipVia').Value;
    Order.Freight := fdqOrderORM.FieldByName('Freight').Value;
    TOrderStore.Store.Add(Order);
    fdqOrderORM.Next;
  end;
  fdqOrderORM.Close;
end;

end.
