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
            CalcFormula = Count("KNH Vehicle Journey" where("Entry No." = filter(<> 0)));
            Caption = 'Vehicle Journeys';
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
