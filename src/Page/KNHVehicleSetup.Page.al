/// <summary>
/// Page KNH Vehicle Setup (ID 51503).
/// </summary>
page 51503 "KNHVehicleSetup"
{
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Vehicle Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "KNHVehicleSetup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Registration No. Mandatory"; Rec."Registration No. Mandatory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Registration No. of the vehicle is mandatory.';
                }
            }
            group("No. Series")
            {
                field("Vehicle Nos."; Rec."Vehicle Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
            }
        }

        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
