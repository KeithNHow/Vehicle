/// <summary>
/// Page KNH Vehicle Activities (ID 51510).
/// </summary>
page 51510 "KNHVehicleActivities"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "KNHVehicleCue";

    layout
    {
        area(content)
        {
            cuegroup(Vehicles)
            {
                Caption = 'Vehicle Details';
                field("Vehicle Journeys"; Rec."Vehicle Journeys")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "KNHVehicleJourneys";
                    ToolTip = 'Specifies the number of vehicle journeys that have been recorded.';
                }
                field("Vehicle Cost"; Rec."Vehicle Cost")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "KNHVehicleList";
                    ToolTip = 'Specifies the Total Cost of vehicles.';
                }
            }
        }
    }
}
