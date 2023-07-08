/// <summary>
/// Page KNH Vehicle Balances (ID 51505).
/// </summary>
page 51505 "KNHVehicleBalances"
{
    Caption = 'KNH Vehicle Balances';
    PageType = Card;
    SourceTable = "KNHVehicle";
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("New Cost"; Rec."New Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the vehicle when it was new.';
                }
                field("Vehicle Mileage"; Rec."Vehicle Mileage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Mileage field.';
                }
            }
        }
    }
}
