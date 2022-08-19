/// <summary>
/// Page KNH Vehicle Journal Template (ID 51504).
/// </summary>
page 51504 "KNH Vehicle Journal Template"
{
    ApplicationArea = All;
    Caption = 'Vehicle Journal Template';
    PageType = List;
    SourceTable = "KNH Vehicle Journal Template";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Posting No. Series"; Rec."Posting No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting No. Series field.';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source Code field.';
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason Code field.';
                }
                field("Increment Batch Name"; Rec."Increment Batch Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Increment Batch Name field.';
                }
                field("Test Report ID"; Rec."Test Report ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Test Report ID field.';
                }
                field("Test Report Caption"; Rec."Test Report Caption")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Test Report Caption field.';
                }
                field("Posting Report ID"; Rec."Posting Report ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Report ID field.';
                }
                field("Posting Report Caption"; Rec."Posting Report Caption")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Report Caption field.';
                }
                field("Force Posting Report"; Rec."Force Posting Report")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Force Posting Report field.';
                }
            }
        }
    }
}
