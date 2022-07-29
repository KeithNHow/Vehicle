/// <summary>
/// Page KNH Vehicle List (ID 50061).
/// </summary>
page 50061 "KNH Vehicle List"
{
    ApplicationArea = All;
    Caption = 'Vehicles';
    CardPageID = "KNH Vehicle Card";
    PageType = List;
    Editable = false;
    SourceTable = "KNH Vehicle";
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
                SubPageLink = "Table ID" = CONST(50060), "No." = FIELD("No.");
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
                RunObject = page "KNH Vehicle Journeys";
                RunPageLink = "Vehicle No." = field("No.");
                RunPageView = sorting("Vehicle No.") order(Descending);
                ShortCutKey = 'Ctrl+F7';
                ToolTip = 'View the history of transactions that have been posted for the selected record.';
            }
        }
    }
}
