/// <summary>
/// Table KNH Vehicle Cue (ID 51508).
/// </summary>
table 51508 "KNHVehicleCue"
{
    Caption = 'Vehicle Cue';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Vehicle Journeys"; Integer)
        {
            CalcFormula = count("KNHVehicleJourney" where("Entry No." = filter(<> 0)));
            Caption = 'Vehicle Journeys';
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Vehicle Cost"; Decimal)
        {
            Caption = 'Vehicle Cost';
            Editable = false;
            FieldClass = Flowfield;
            CalcFormula = sum("KNHVehicle"."New Cost" where("New Cost" = filter(<> 0)));
        }
        field(4; "Vehicle Value"; Integer)
        {
            Caption = 'Vehicle Mileage';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("KNHVehicle"."Total Vehicle Mileage" where("Total Vehicle Mileage" = filter(<> 0)));
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
