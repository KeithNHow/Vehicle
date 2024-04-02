/// <summary>
/// Page KNH Vehicle Brand API (ID 51511).
/// </summary>
page 51511 KNHVehicleBrandAPI
{
    APIGroup = 'apiVehicle';
    APIPublisher = 'keithHow';
    APIVersion = 'v2.0';
    Caption = 'vehicleBrandAPI';
    DelayedInsert = true;
    EntityName = 'vehicleBrand';
    EntitySetName = 'vehicleBrands';
    PageType = API;
    SourceTable = KNHVehicleBrand;

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
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(country; Rec.Country)
                {
                    Caption = 'Country';
                }
                part(vehicleModels; KNHVehicleModelAPI)
                {
                    Caption = 'Car Models';
                    EntityName = 'vehicleModel';
                    EntitySetName = 'vehicleModels';
                    SubPageLink = "Vehicle Brand" = field(Code);
                    Multiplicity = ZeroOrOne;
                }
            }
        }
    }
}
