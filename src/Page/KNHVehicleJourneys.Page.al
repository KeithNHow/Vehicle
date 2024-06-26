/// <summary>
/// Page KNH Vehicle Journeys (ID 51502).
/// </summary>
page 51502 "KNHVehicleJourneys"
{
    ApplicationArea = All;
    Caption = 'Vehicle Journeys';
    PageType = List;
    SourceTable = "KNHVehicleJourney";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                    ApplicationArea = All;
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Start Location"; Rec."Start Location")
                {
                    ToolTip = 'Specifies the value of the Start Location field.';
                    ApplicationArea = All;
                }
                field("Destination Location"; Rec."Destination Location")
                {
                    ToolTip = 'Specifies the value of the Destintion Location field.';
                    ApplicationArea = All;
                }
                field(Distance; Rec.Distance)
                {
                    ToolTip = 'Specifies the value of the Distance field.';
                    ApplicationArea = All;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ToolTip = 'Specifies the value of the Reason Code field.';
                    ApplicationArea = All;
                }
                field(Driver; Rec.Driver)
                {
                    ToolTip = 'Specifies the value of the Driver field.';
                    ApplicationArea = All;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                    ApplicationArea = All;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            action(JnlLineExp)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'XML Export';
                Image = Export;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'XML file export of Vehicle Journal Line.';
                ShortCutKey = 'Ctrl+F6';
                trigger OnAction();
                begin
                    Xmlport.Run(Xmlport::KNHVehicleJnlLineImp, true, false, Rec);
                end;

            }
            action(JnlLineImp)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vehicle Journal Line Import';
                Image = Import;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Xml file Import of Vehicle Journal Lines.';
                ShortcutKey = 'Ctrl+F7';
                trigger OnAction();
                begin
                    Xmlport.Run(Xmlport::KNHVehicleJnlLineImp, true, true);
                end;
            }
        }
    }
}
