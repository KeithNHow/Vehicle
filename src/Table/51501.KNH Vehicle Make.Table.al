/// <summary>
/// Table Car Brand (ID 51501)
/// </summary>
table 51501 "KNH Vehicle Make"
{
    DataClassification = CustomerContent;
    Caption = 'Vehicle Make';
    //DataCaptionFields = "Code", Description;
    //LookupPageID = "KNH Vehicle Make";

    fields
    {
        field(1; Code; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Country"; Text[100])
        {
            Caption = 'Country';
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}