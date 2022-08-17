/// <summary>
/// Page "Vehicle" (ID 50060).
/// </summary>
page 50060 "KNH Vehicle Card"
{
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Vehicle';
    PageType = Card;
    SourceTable = "KNH Vehicle";
    RefreshOnActivate = true;
    PromotedActionCategories = 'New,Process,Report,Navigate';
    AboutTitle = 'About vehicle details';
    AboutText = 'With the **Vehicle Card** you manage information about a vehicle. From here you can also drill down on past and ongoing vehicle journey activity.';

    layout
    {
        area(content)
        {
            group(general)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(Make; Rec."Make Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Make Code field.';
                }
                field(Model; Rec."Model Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Model Code field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration Date field.';
                }
                field("Engine Plate No."; Rec."Engine Plate No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Engine Plate No. field.';
                }
                field("Owner Surname"; Rec."Owner Surname")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Owner Surname field.';
                }
                field("Owner Forename"; Rec."Owner Forename")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Owner Forename field.';
                }
                field("Road Tax Date"; Rec."Road Tax Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Road Tax Date field.';
                }
                field("New Cost"; Rec."New Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the vehicle when it was new.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
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
            action(Journeys)
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
        area(Reporting)
        {
            group(Statistics)
            {
                action(Balances)
                {
                    ApplicationArea = All;
                    Caption = 'Balances';
                    Image = Report;
                    ToolTip = 'Vehicle Balances';
                    Promoted = true;
                    Promotedonly = true;
                    PromotedCategory = Report;
                    PromotedIsBig = true;
                    RunObject = Page "KNH Vehicle Balances";
                }
            }
        }
    }
}
