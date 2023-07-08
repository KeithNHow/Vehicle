/// <summary>
/// Page KNH Vehicle Model (ID 51507)
/// </summary>
page 51507 "KNHVehicleModel"
{
    ApplicationArea = All;
    Caption = 'Vehicle Model';
    PageType = List;
    SourceTable = "KNHVehicleModel";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vehicle model code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vehicle description.';
                }
                field(Power; Rec.Power)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the horse power of the vehicle model.';
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the currect cost of the vehicle model.';
                }
            }
        }
    }

    actions
    {
    }
}