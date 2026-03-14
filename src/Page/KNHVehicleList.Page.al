/// <summary>
/// This page displays a list of vehicles. From here you can navigate to the vehicle card, which displays detailed information about the vehicle, as well as a list of journeys associated with the vehicle.
/// </summary>

namespace KNHVehicle;
using Microsoft.Foundation.Attachment;

page 51501 KNHVehicleList
{
    ApplicationArea = All;
    Caption = 'Vehicles';
    CardPageId = KNHVehicleCard;
    PageType = List;
    Editable = false;
    SourceTable = KNHVehicle;
    QueryCategory = 'Vehicle Category';
    UsageCategory = Lists;
    PromotedActionCategories = 'New,Process,Report,Navigate';
    AboutTitle = 'About vehicles';
    AboutText = 'Here you overview all registered vehicles. From here you can quickly create new vehicles.';

    layout
    {
        area(Content)
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
        area(FactBoxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
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
        area(Navigation)
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
                RunObject = page KNHVehicleJourneys;
                RunPageLink = "Vehicle No." = field("No.");
                RunPageView = sorting("Vehicle No.") order(descending);
                ShortcutKey = 'Ctrl+F7';
                ToolTip = 'View the history of transactions that have been posted for the selected record.';
            }
        }
    }
}
