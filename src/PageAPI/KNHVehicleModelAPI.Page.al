/// <summary>
/// Page KNH Vehicle Model API (ID 51512).
/// </summary>
page 51512 KNHVehicleModelAPI
{
    APIGroup = 'apiVehicle';
    APIPublisher = 'keithHow';
    APIVersion = 'v2.0';
    Caption = 'knhVehicleModel';
    DelayedInsert = true;
    EntityName = 'vehicleModel';
    EntitySetName = 'vehicleModels';
    PageType = API;
    SourceTable = KNHVehicleModel;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(cost; Rec.Cost)
                {
                    Caption = 'Cost';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(fuelType; Rec.FuelType)
                {
                    Caption = 'Fuel Type';
                }
                field(power; Rec.Power)
                {
                    Caption = 'Power (cc)';
                }
            }
        }
    }
}
