unit Model.Orders;

interface

uses
  System.Generics.Collections,
  Plus.Nullable;

type
  TOrder = class
  private
    FShippedDate: Nullable<TDateTime>;
    FOrderDate: Nullable<TDateTime>;
    FRequiredDate: Nullable<TDateTime>;
    FEmployeeID: Nullable<Integer>;
    FCustomerID: Nullable<String>;
    FShipVia: Nullable<Integer>;
    FFreight: Nullable<Currency>;
    FOrderID: Nullable<Integer>;
    procedure SetCustomerID(const Value: Nullable<String>);
    procedure SetEmployeeID(const Value: Nullable<Integer>);
    procedure SetFreight(const Value: Nullable<Currency>);
    procedure SetOrderDate(const Value: Nullable<TDateTime>);
    procedure SetOrderID(const Value: Nullable<Integer>);
    procedure SetRequiredDate(const Value: Nullable<TDateTime>);
    procedure SetShippedDate(const Value: Nullable<TDateTime>);
    procedure SetShipVia(const Value: Nullable<Integer>);
  public
    property OrderID: Nullable<Integer> read FOrderID write SetOrderID;
    property CustomerID: Nullable<String> read FCustomerID write SetCustomerID;
    property EmployeeID: Nullable<Integer> read FEmployeeID write SetEmployeeID;
    property OrderDate: Nullable<TDateTime> read FOrderDate write SetOrderDate;
    property RequiredDate: Nullable<TDateTime> read FRequiredDate write SetRequiredDate;
    property ShippedDate: Nullable<TDateTime> read FShippedDate write SetShippedDate;
    property ShipVia: Nullable<Integer> read FShipVia write SetShipVia;
    property Freight: Nullable<Currency> read FFreight write SetFreight;
  end;

  TOrderStore = class(TObjectList<TOrder>)
  public
    class var Store: TOrderStore;
    class constructor Create;
    class destructor Destroy;
  end;

implementation

{ TOrder }

procedure TOrder.SetCustomerID(const Value: Nullable<String>);
begin
  FCustomerID := Value;
end;

procedure TOrder.SetEmployeeID(const Value: Nullable<Integer>);
begin
  FEmployeeID := Value;
end;

procedure TOrder.SetFreight(const Value: Nullable<Currency>);
begin
  FFreight := Value;
end;

procedure TOrder.SetOrderDate(const Value: Nullable<TDateTime>);
begin
  FOrderDate := Value;
end;

procedure TOrder.SetOrderID(const Value: Nullable<Integer>);
begin
  FOrderID := Value;
end;

procedure TOrder.SetRequiredDate(const Value: Nullable<TDateTime>);
begin
  FRequiredDate := Value;
end;

procedure TOrder.SetShippedDate(const Value: Nullable<TDateTime>);
begin
  FShippedDate := Value;
end;

procedure TOrder.SetShipVia(const Value: Nullable<Integer>);
begin
  FShipVia := Value;
end;

{ TOrderStore }

class constructor TOrderStore.Create;
begin
  Store := TOrderStore.Create();
end;

class destructor TOrderStore.Destroy;
begin
  Store.Free;
end;

end.
