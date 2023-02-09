/// <summary>
/// Table KNH Vehicle Model (ID 51502)
/// </summary>
table 51502 "KNH Vehicle Model"
{
    DataClassification = CustomerContent;
    Caption = 'Vehicle Model';
    DataCaptionFields = "Code", Description;
    //LookupPageID = "KNH Vehicle Model";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Power; Integer)
        {
            Caption = 'Power (cc)';
        }
        field(4; FuelType; Enum "KNH Vehicle Fuel Type")
        {
            Caption = 'Fuel Type';
        }
        field(5; Cost; Decimal)
        {
            Caption = 'Cost';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}