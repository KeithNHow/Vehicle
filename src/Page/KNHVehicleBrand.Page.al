/// <summary>
/// Page KNH Vehicle Brand (ID 51506)
/// </summary>
page 51506 "KNHVehicleBrand"
{
    ApplicationArea = All;
    Caption = 'Vehicle Brand';
    PageType = List;
    SourceTable = KNHVehicleBrand;
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
                    Tooltip = 'Specifies the vehicle make code.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vehicle make name.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vehicle make description.';
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vehicle make country.';
                }
            }
        }
    }

    actions
    {
    }
}