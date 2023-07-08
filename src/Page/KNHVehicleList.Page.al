/// <summary>
/// Page KNH Vehicle List (ID 51501).
/// </summary>
page 51501 "KNHVehicleList"
{
    ApplicationArea = All;
    Caption = 'Vehicles';
    CardPageID = "KNHVehicleCard";
    PageType = List;
    Editable = false;
    SourceTable = "KNHVehicle";
    QueryCategory = 'Vehicle Category';
    UsageCategory = Lists;
    PromotedActionCategories = 'New,Process,Report,Navigate';
    AboutTitle = 'About vehicles';
    AboutText = 'Here you overview all registered vehicles. From here you can quickly create new vehicles.';

    layout
    {
        area(content)
        {
            repeater(control1)
            {
                ShowCaption = false;

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Make; Rec."Make Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec."Model Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50060), "No." = field("No.");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            action(Journey)
            {
                ApplicationArea = All;
                Caption = 'Journeys';
                Image = Ledger;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = page "KNHVehicleJourneys";
                RunPageLink = "Vehicle No." = field("No.");
                RunPageView = sorting("Vehicle No.") order(descending);
                ShortCutKey = 'Ctrl+F7';
                ToolTip = 'View the history of transactions that have been posted for the selected record.';
            }
        }
    }
}
