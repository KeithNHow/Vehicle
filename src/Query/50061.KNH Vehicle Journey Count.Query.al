/// <summary>
/// Query KNH Vehicle Journey Count (ID 50061).
/// </summary>
query 50061 "KNH Vehicle Journey Count"
{
    Caption = 'Vehicle Journey Count';
    QueryType = Normal;
    OrderBy = Ascending(VehicleNo, Driver);

    elements
    {
        dataitem(KNHVehicleJourney; "KNH Vehicle Journey")
        {
            column(VehicleNo; "Vehicle No.")
            {
            }
            column(Driver; Driver)
            {
            }
            column(Distance; Distance)
            {
                Method = Sum;
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
