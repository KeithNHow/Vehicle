/// <summary>
/// Table KNH Vehicle Cue (ID 51508).
/// </summary>
table 51508 "KNH Vehicle Cue"
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
            CalcFormula = count("KNH Vehicle Journey" where("Entry No." = filter(<> 0)));
            Caption = 'Vehicle Journeys';
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Vehicle Cost"; Decimal)
        {
            CalcFormula = sum("KNH Vehicle"."New Cost" where("New Cost" = filter(<> 0)));
            Caption = 'Vehicle Cost';
            Editable = false;
            FieldClass = Flowfield;
        }
        field(4; "Vehicle Value"; Integer)
        {
            CalcFormula = sum("KNH Vehicle"."Vehicle Mileage" where("Vehicle Mileage" = filter(<> 0)));
            Caption = 'Vehicle Mileage';
            Editable = false;
            FieldClass = FlowField;
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
