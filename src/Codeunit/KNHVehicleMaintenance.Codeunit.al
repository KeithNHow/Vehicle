/// <summary>
/// Codeunit KNH Vehicle Maintenance (ID 51501).
/// The partial records capability allows for loading a subset of normal table fields
/// Available Methods - SetLoadFields, AddLoadFields, AreFieldsLoaded, LoadFields
/// </summary>
codeunit 51501 "KNHVehicleMaintenance"
{
    /// <summary>
    /// ComputeArithmeticMean.
    /// </summary>
    /// <returns>Return value of type Decimal.</returns>
    procedure ComputeArithmeticMean(): Decimal;
    var
        Item: Record Item;
        SumTotal: Decimal;
        Counter: Integer;
    begin
        Item.SetLoadFields(Item."Standard Cost");
        if Item.FindSet() then begin
            repeat
                SumTotal += Item."Standard Cost";
                Counter += 1;
            until Item.Next() = 0;
            exit(SumTotal / Counter);
        end;
    end;
}
