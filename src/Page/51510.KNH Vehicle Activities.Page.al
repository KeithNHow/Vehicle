/// <summary>
/// Page Vehicle Activities (ID 51510).
/// </summary>
page 51510 "KNH Vehicle Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "KNH Vehicle Cue";

    layout
    {
        area(content)
        {
            cuegroup("Vehicles")
            {
                Caption = 'Vehicle Details';
                field("Vehicle Journeys"; Rec."Vehicle Journeys")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "KNH Vehicle Journeys";
                    ToolTip = 'Specifies the number of vehicle journeys that have been recorded.';
                }
                field("Vehicle Cost"; Rec."Vehicle Cost")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "KNH Vehicle List";
                    ToolTip = 'Specifies the Total Cost of vehicles.';
                }
            }
        }
    }
}
