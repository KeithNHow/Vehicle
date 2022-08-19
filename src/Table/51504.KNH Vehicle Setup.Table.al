/// <summary>
/// Table KNH Vehicle Setup (ID 51504).
/// </summary>
table 51504 "KNH Vehicle Setup"
{
    Caption = 'Vehicle Setup';
    DataClassification = ToBeClassified;
    DrillDownPageID = "Sales & Receivables Setup";
    LookupPageID = "Sales & Receivables Setup";

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Vehicle Nos."; Code[20])
        {
            Caption = 'Vehicle Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(3; "Registration No. Mandatory"; Code[20])
        {
            Caption = 'Registration No. Mandatory';
            DataClassification = ToBeClassified;
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
