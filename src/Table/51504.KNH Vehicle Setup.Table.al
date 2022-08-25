/// <summary>
/// Table KNH Vehicle Setup (ID 51504).
/// </summary>
table 51504 "KNH Vehicle Setup"
{
    Caption = 'Vehicle Setup';
    DataClassification = CustomerContent;
    DrillDownPageID = "Sales & Receivables Setup";
    LookupPageID = "Sales & Receivables Setup";

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; "Vehicle Nos."; Code[20])
        {
            Caption = 'Vehicle Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(3; "Registration No. Mandatory"; Boolean)
        {
            Caption = 'Registration No. Mandatory';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
