unit Model.Orders;

interface

uses
  System.Generics.Collections;

type
  TOrder = class
  private
    FShippedDate: TDateTime;
    FOrderDate: TDateTime;
    FRequiredDate: TDateTime;
    FEmployeeID: Integer;
    FCustomerID: String;
    FShipVia: Integer;
    FFreight: Currency;
    FOrderID: Integer;
    procedure SetCustomerID(const Value: String);
    procedure SetEmployeeID(const Value: Integer);
    procedure SetFreight(const Value: Currency);
    procedure SetOrderDate(const Value: TDateTime);
    procedure SetOrderID(const Value: Integer);
    procedure SetRequiredDate(const Value: TDateTime);
    procedure SetShippedDate(const Value: TDateTime);
    procedure SetShipVia(const Value: Integer);
  public
    property OrderID: Integer read FOrderID write SetOrderID;
    property CustomerID: String read FCustomerID write SetCustomerID;
    property EmployeeID: Integer read FEmployeeID write SetEmployeeID;
    property OrderDate: TDateTime read FOrderDate write SetOrderDate;
    property RequiredDate: TDateTime read FRequiredDate write SetRequiredDate;
    property ShippedDate: TDateTime read FShippedDate write SetShippedDate;
    property ShipVia: Integer read FShipVia write SetShipVia;
    property Freight: Currency read FFreight write SetFreight;
  end;

  TOrderStore = class(TObjectList<TOrder>)
  public
    class var Store: TOrderStore;
    class constructor Create;
    class destructor Destroy;
  end;

implementation

{ TOrder }

procedure TOrder.SetCustomerID(const Value: String);
begin
  FCustomerID := Value;
end;

procedure TOrder.SetEmployeeID(const Value: Integer);
begin
  FEmployeeID := Value;
end;

procedure TOrder.SetFreight(const Value: Currency);
begin
  FFreight := Value;
end;

procedure TOrder.SetOrderDate(const Value: TDateTime);
begin
  FOrderDate := Value;
end;

procedure TOrder.SetOrderID(const Value: Integer);
begin
  FOrderID := Value;
end;

procedure TOrder.SetRequiredDate(const Value: TDateTime);
begin
  FRequiredDate := Value;
end;

procedure TOrder.SetShippedDate(const Value: TDateTime);
begin
  FShippedDate := Value;
end;

procedure TOrder.SetShipVia(const Value: Integer);
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
