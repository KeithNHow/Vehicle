/// <summary>
/// Enum KNH Vehicle Fuel Type (ID 51500)
/// </summary>
enum 51500 "KNHVehicleFuelType"
{
    Extensible = true;
    value(0; Petrol)
    {
        Caption = 'Petrol';
    }
    value(1; Diesel)
    {
        Caption = 'Diesel';
    }
    value(2; Electric)
    {
        Caption = 'Electric';
    }
    value(3; Hybrid)
    {
        Caption = 'Hybrid';
    }
}