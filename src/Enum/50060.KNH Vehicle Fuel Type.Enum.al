/// <summary>
/// Enum Fuel Type (ID 50060)
/// </summary>
enum 50060 "KNH Vehicle Fuel Type"
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