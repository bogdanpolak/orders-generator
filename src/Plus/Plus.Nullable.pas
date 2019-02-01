unit Plus.Nullable;

{***************************************************}
{ *** Source code coppied form Spring4D library *** }
{ *** Used properly according Spring4D licence  *** }
{   Spring Framework for Delphi - Spring4D Team     }
{            http://www.spring4d.org                }
{***************************************************}
{$DEFINE IMPLICIT_NULLABLE}
{$DEFINE UNSAFE_NULLABLE}
{$DEFINE IMPLICIT_NULLABLE_WARN}
{$DEFINE UNSAFE_NULLABLE_WARN}

interface

uses
  System.Generics.Defaults,
  System.SysUtils,
  System.TypInfo,
  System.Rtti;

type

  EInvalidCastException = System.SysUtils.EInvalidCast;

  {$REGION 'Nullable Types'}

  Nullable = record
  private
    const HasValue = 'True';
    type Null = interface end;
  end;

  /// <summary>
  ///   A nullable type can represent the normal range of values for its
  ///   underlying value type, plus an additional <c>Null</c> value.
  /// </summary>
  /// <typeparam name="T">
  ///   The underlying value type of the <see cref="Nullable&lt;T&gt;" />
  ///   generic type.
  /// </typeparam>
  Nullable<T> = record
  private
    fValue: T;
    fHasValue: string;
    class var fComparer: IEqualityComparer<T>;
    class function EqualsComparer(const left, right: T): Boolean; static;
    class function EqualsInternal(const left, right: T): Boolean; static; inline;
    function GetValue: T; inline;
    function GetHasValue: Boolean; inline;
  public
    /// <summary>
    ///   Initializes a new instance of the <see cref="Nullable&lt;T&gt;" />
    ///   structure to the specified value.
    /// </summary>
    constructor Create(const value: T); overload;

    /// <summary>
    ///   Initializes a new instance of the <see cref="Nullable&lt;T&gt;" />
    ///   structure to the specified value.
    /// </summary>
    constructor Create(const value: Variant); overload;

    /// <summary>
    ///   Retrieves the value of the current <see cref="Nullable&lt;T&gt;" />
    ///   object, or the object's default value.
    /// </summary>
    function GetValueOrDefault: T; overload;

    /// <summary>
    ///   Retrieves the value of the current <see cref="Nullable&lt;T&gt;" />
    ///   object, or the specified default value.
    /// </summary>
    /// <param name="defaultValue">
    ///   A value to return if the <see cref="HasValue" /> property is <c>False</c>
    ///    .
    /// </param>
    /// <returns>
    ///   The value of the <see cref="Value" /> property if the <see cref="HasValue" />
    ///    property is true; otherwise, the <paramref name="defaultValue" />
    ///   parameter.
    /// </returns>
    /// <remarks>
    ///   The <see cref="GetValueOrDefault" /> method returns a value even if
    ///   the <see cref="HasValue" /> property is false (unlike the <see cref="Value" />
    ///    property, which throws an exception).
    /// </remarks>
    function GetValueOrDefault(const defaultValue: T): T; overload;

    /// <summary>
    ///   Determines whether two nullable value are equal.
    /// </summary>
    /// <remarks>
    ///   <para>
    ///     If both two nullable values are null, return true;
    ///   </para>
    ///   <para>
    ///     If either one is null, return false;
    ///   </para>
    ///   <para>
    ///     else compares their values as usual.
    ///   </para>
    /// </remarks>
    function Equals(const other: Nullable<T>): Boolean;

    function ToString: string;

    /// <summary>
    ///   Returns the stored value as variant.
    /// </summary>
    /// <exception cref="EInvalidCast">
    ///   The type of T cannot be cast to Variant
    /// </exception>
    function ToVariant: Variant;

    /// <summary>
    ///   Gets the stored value. Returns <c>False</c> if it does not contain a
    ///   value.
    /// </summary>
    function TryGetValue(out value: T): Boolean; inline;

    /// <summary>
    ///   Gets a value indicating whether the current <see cref="Nullable&lt;T&gt;" />
    ///    structure has a value.
    /// </summary>
    property HasValue: Boolean read GetHasValue;

    /// <summary>
    ///   Gets the value of the current <see cref="Nullable&lt;T&gt;" /> value.
    /// </summary>
    /// <exception cref="Spring|EInvalidOperationException">
    ///   Raised if the value is null.
    /// </exception>
    property Value: T read GetValue;

    class operator Implicit(const value: Nullable.Null): Nullable<T>;
    class operator Implicit(const value: T): Nullable<T>;

{$IFDEF IMPLICIT_NULLABLE}
    class operator Implicit(const value: Nullable<T>): T; inline;
      {$IFDEF IMPLICIT_NULLABLE_WARN}inline; deprecated 'Possible unsafe operation involving implicit operator - use Value property';{$ENDIF}
{$ENDIF}

{$IFDEF UNSAFE_NULLABLE}
    class operator Implicit(const value: Nullable<T>): Variant;
      {$IFNDEF DELPHIXE4}
      {$IFDEF UNSAFE_NULLABLE_WARN}inline; deprecated 'Possible unsafe operation involving implicit Variant conversion - use ToVariant';{$ENDIF}
      {$ENDIF}
    class operator Implicit(const value: Variant): Nullable<T>;
      {$IFDEF UNSAFE_NULLABLE_WARN}inline; deprecated 'Possible unsafe operation involving implicit Variant conversion - use explicit cast';{$ENDIF}
{$ENDIF}

    class operator Explicit(const value: Variant): Nullable<T>;
    class operator Explicit(const value: Nullable<T>): T; inline;

    class operator Equal(const left, right: Nullable<T>): Boolean; inline;
    class operator Equal(const left: Nullable<T>; const right: Nullable.Null): Boolean; inline;
    class operator Equal(const left: Nullable<T>; const right: T): Boolean; inline;
    class operator NotEqual(const left, right: Nullable<T>): Boolean; inline;
    class operator NotEqual(const left: Nullable<T>; const right: Nullable.Null): Boolean; inline;
    class operator NotEqual(const left: Nullable<T>; const right: T): Boolean; inline;
  end;

  TNullableString = Nullable<string>;
{$IFNDEF NEXTGEN}
  TNullableAnsiString = Nullable<AnsiString>;
  TNullableWideString = Nullable<WideString>;
{$ENDIF}
  TNullableInteger = Nullable<Integer>;
  TNullableInt64 = Nullable<Int64>;
  TNullableNativeInt = Nullable<NativeInt>;
  TNullableDateTime = Nullable<TDateTime>;
  TNullableCurrency = Nullable<Currency>;
  TNullableDouble = Nullable<Double>;
  TNullableBoolean = Nullable<Boolean>;
  TNullableGuid = Nullable<TGUID>;

  {$ENDREGION}

/// <summary>
///   Determines whether a variant value is null or empty.
/// </summary>
function VarIsNullOrEmpty(const value: Variant): Boolean;

implementation

uses
  System.Variants,
  System.DateUtils,
  System.Math;

{$REGION 'Nullable<T>'}

constructor Nullable<T>.Create(const value: T);
begin
  fValue := value;
  fHasValue := Nullable.HasValue;
end;

constructor Nullable<T>.Create(const value: Variant);
var
  v: TValue;
begin
  if not VarIsNullOrEmpty(value) then
  begin
    v := TValue.FromVariant(value);
    fValue := v.AsType<T>;
    fHasValue := Nullable.HasValue;
  end
  else
  begin
    fHasValue := '';
    fValue := Default(T);
  end;
end;

function Nullable<T>.GetHasValue: Boolean;
begin
  Result := fHasValue <> '';
end;

function Nullable<T>.GetValue: T;
begin
  if not HasValue then
    // TODO: Fix this (incorrect message)
    raise EInvalidCast.Create('Error Message');
  Result := fValue;
end;

function Nullable<T>.GetValueOrDefault: T;
begin
  if HasValue then
    Result := fValue
  else
    Result := Default(T);
end;

function Nullable<T>.GetValueOrDefault(const defaultValue: T): T;
begin
  if HasValue then
    Result := fValue
  else
    Result := defaultValue;
end;

class function Nullable<T>.EqualsComparer(const left, right: T): Boolean;
begin
  if not Assigned(fComparer) then
    fComparer := TEqualityComparer<T>.Default;
  Result := fComparer.Equals(left, right);
end;

class function Nullable<T>.EqualsInternal(const left, right: T): Boolean;
begin
  case System.GetTypeKind(T) of
    tkInteger, tkEnumeration:
    begin
      case SizeOf(T) of
        1: Result := PByte(@left)^ = PByte(@right)^;
        2: Result := PWord(@left)^ = PWord(@right)^;
        4: Result := PCardinal(@left)^ = PCardinal(@right)^;
      end;
    end;
{$IFNDEF NEXTGEN}
    tkChar: Result := PAnsiChar(@left)^ = PAnsiChar(@right)^;
    tkString: Result := PShortString(@left)^ = PShortString(@right)^;
    tkLString: Result := PAnsiString(@left)^ = PAnsiString(@right)^;
    tkWString: Result := PWideString(@left)^ = PWideString(@right)^;
{$ENDIF}
    tkFloat:
    begin
      if TypeInfo(T) = TypeInfo(Single) then
        Result := System.Math.SameValue(PSingle(@left)^, PSingle(@right)^)
      else if TypeInfo(T) = TypeInfo(Double) then
        Result := System.Math.SameValue(PDouble(@left)^, PDouble(@right)^)
      else if TypeInfo(T) = TypeInfo(Extended) then
        Result := System.Math.SameValue(PExtended(@left)^, PExtended(@right)^)
      else if TypeInfo(T) = TypeInfo(TDateTime) then
        Result := SameDateTime(PDateTime(@left)^, PDateTime(@right)^)
      else
        case GetTypeData(TypeInfo(T)).FloatType of
          ftSingle: Result := System.Math.SameValue(PSingle(@left)^, PSingle(@right)^);
          ftDouble: Result := System.Math.SameValue(PDouble(@left)^, PDouble(@right)^);
          ftExtended: Result := System.Math.SameValue(PExtended(@left)^, PExtended(@right)^);
          ftComp: Result := PComp(@left)^ = PComp(@right)^;
          ftCurr: Result := PCurrency(@left)^ = PCurrency(@right)^;
        end;
    end;
    tkWChar: Result := PWideChar(@left)^ = PWideChar(@right)^;
    tkInt64: Result := PInt64(@left)^ = PInt64(@right)^;
    tkUString: Result := PUnicodeString(@left)^ = PUnicodeString(@right)^;
  else
    Result := EqualsComparer(left, right);
  end;
end;

function Nullable<T>.Equals(const other: Nullable<T>): Boolean;
begin
  if not HasValue then
    Exit(not other.HasValue);
  if not other.HasValue then
    Exit(False);
  Result := EqualsInternal(fValue, other.fValue);
end;

class operator Nullable<T>.Implicit(const value: T): Nullable<T>;
begin
  Result.fValue := value;
  Result.fHasValue := Nullable.HasValue;
end;

{$IFDEF IMPLICIT_NULLABLE}
class operator Nullable<T>.Implicit(const value: Nullable<T>): T;
begin
  Result := value.Value;
end;
{$ENDIF}

{$IFDEF UNSAFE_NULLABLE}
class operator Nullable<T>.Implicit(const value: Nullable<T>): Variant;
var
  v: TValue;
begin
  if value.HasValue then
  begin
    v := TValue.From<T>(value.fValue);
    if v.IsType<Boolean> then
      Result := v.AsBoolean
    else
      Result := v.AsVariant;
  end
  else
    Result := Null;
end;

class operator Nullable<T>.Implicit(const value: Variant): Nullable<T>;
var
  v: TValue;
begin
  if not VarIsNullOrEmpty(value) then
  begin
    v := TValue.FromVariant(value);
    Result.fValue := v.AsType<T>;
    Result.fHasValue := Nullable.HasValue;
  end
  else
    Result := Default(Nullable<T>);
end;
{$ENDIF}

class operator Nullable<T>.Explicit(const value: Variant): Nullable<T>;
var
  v: TValue;
begin
  if not VarIsNullOrEmpty(value) then
  begin
    v := TValue.FromVariant(value);
    Result.fValue := v.AsType<T>;
    Result.fHasValue := Nullable.HasValue;
  end
  else
    Result := Default(Nullable<T>);
end;

class operator Nullable<T>.Explicit(const value: Nullable<T>): T;
begin
  Result := value.Value;
end;

class operator Nullable<T>.Implicit(const value: Nullable.Null): Nullable<T>;
begin
  Result.fValue := Default(T);
  Result.fHasValue := '';
end;

class operator Nullable<T>.Equal(const left, right: Nullable<T>): Boolean;
begin
  Result := left.Equals(right);
end;

class operator Nullable<T>.Equal(const left: Nullable<T>;
  const right: T): Boolean;
begin
  if left.fHasValue = '' then
    Exit(False);
  Result := EqualsInternal(left.fValue, right);
end;

class operator Nullable<T>.Equal(const left: Nullable<T>;
  const right: Nullable.Null): Boolean;
begin
  Result := left.fHasValue = '';
end;

class operator Nullable<T>.NotEqual(const left, right: Nullable<T>): Boolean;
begin
  Result := not left.Equals(right);
end;

class operator Nullable<T>.NotEqual(const left: Nullable<T>;
  const right: Nullable.Null): Boolean;
begin
  Result := left.fHasValue <> '';
end;

class operator Nullable<T>.NotEqual(const left: Nullable<T>;
  const right: T): Boolean;
begin
  if left.fHasValue = '' then
    Exit(True);
  Result := not EqualsInternal(left.fValue, right);
end;

function Nullable<T>.ToString: string;
var
  v: TValue;
begin
  if HasValue then
  begin
    v := TValue.From<T>(fValue);
    Result := v.ToString;
  end
  else
    Result := 'Null';
end;

function Nullable<T>.ToVariant: Variant;
var
  v: TValue;
begin
  if HasValue then
  begin
    v := TValue.From<T>(fValue);
    if v.IsType<Boolean> then
      Result := v.AsBoolean
    else
      Result := v.AsVariant;
  end
  else
    Result := Null;
end;

function Nullable<T>.TryGetValue(out value: T): Boolean;
begin
  Result := fHasValue <> '';
  if Result then
    value := fValue;
end;

{$ENDREGION}

function VarIsNullOrEmpty(const value: Variant): Boolean;
begin
  Result := System.Variants.FindVarData(value).VType in [varEmpty, varNull];
end;


end.
