/// <summary>
/// Query KNH Vehicle (ID 51500).
/// </summary>
query 51500 "KNH Vehicle"
{
    Caption = 'Vehicle Overview';
    QueryType = Normal;
    OrderBy = descending(NewCost);

    elements
    {
        dataitem(KNHVehicle; "KNH Vehicle")
        {
            DataItemTableFilter = "Registration Date" = filter(<> 0D), "New Cost" = filter(10000);
            column(No; "No.")
            {
            }
            column(MakeCode; "Make Code")
            {
            }
            column(ModelCode; "Model Code")
            {
            }
            column(RegistrationNo; "Registration No.")
            {
            }
            column(RegistrationDate; "Registration Date")
            {
            }
            column(EnginePlateNo; "Engine Plate No.")
            {
            }
            column(FuelType; "Fuel Type")
            {
            }
            column(NewCost; "New Cost")
            {
            }
            column(OwnerForename; "Owner Forename")
            {
            }
            column(OwnerSurname; "Owner Surname")
            {
            }
            column(RoadTaxDate; "Road Tax Date")
            {
            }
            dataitem(KNHVehicleJourney; "KNH Vehicle Journey")
            {
                DataItemLink = "Vehicle No." = KNHVehicle."No.";
                SqlJoinType = InnerJoin;
                column(EntryNo; "Entry No.")
                {
                }
                column(Description; Description)
                {
                }
                column(Start_Location; "Start Location")
                {
                }
                column(Destination_Location; "Destination Location")
                {
                }
            }
        }
    }

    trigger OnBeforeOpen()
    begin
    end;
}
