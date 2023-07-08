/// <summary>
/// Query KNH Vehicle Journey Count (ID 51501).
/// </summary>
query 51501 "KNHVehicleJourneyCount"
{
    Caption = 'Vehicle Journey Count';
    QueryType = Normal;
    OrderBy = ascending(VehicleNo, Driver);

    elements
    {
        dataitem(KNHVehicleJourney; "KNHVehicleJourney")
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
