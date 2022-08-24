/// <summary>
/// Page Vehicle Activities (ID 51510).
/// </summary>
page 51510 "KNH Vehicle Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Sales Cue";

    layout
    {
        area(content)
        {
            cuegroup("For Release")
            {
                Caption = 'For Release';
                field("Sales Quotes - Open"; Rec."Sales Quotes - Open")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Sales Quotes";
                    ToolTip = 'Specifies the number of vehicle journeys that have been recorded.';
                }
            }
        }
    }
}
