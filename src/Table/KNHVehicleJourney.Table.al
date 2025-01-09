/// <summary>
/// Table KNH Vehicle Journey (ID 51503).
/// </summary>
table 51503 "KNHVehicleJourney"
{
    Caption = 'Vehicle Journey';
    DataClassification = CustomerContent;
    DataCaptionFields = "Vehicle No.", Description;
    LookupPageID = "KNHVehicleJourneys";
    DrillDownPageId = "KNHVehicleJourneys";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            DataClassification = CustomerContent;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(4; "Start Location"; Text[50])
        {
            Caption = 'Start Location';
            DataClassification = CustomerContent;
        }
        field(5; "Destination Location"; Text[50])
        {
            Caption = 'Destintion Location';
            DataClassification = CustomerContent;
        }
        field(6; Distance; Integer)
        {
            Caption = 'Distance';
            DataClassification = ToBeClassified;
        }
        field(7; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            DataClassification = CustomerContent;
        }
        field(8; Driver; Code[50])
        {
            Caption = 'Driver';
            DataClassification = CustomerContent;
        }
        field(9; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            DataClassification = CustomerContent;
        }
        field(10; "Cost per Mile (LCY)"; Decimal)
        {
            Caption = 'Cost per Mile (LCY)';
            DataClassification = CustomerContent;
        }
        field(11; "Cost per Mile (FCY)"; Decimal)
        {
            Caption = 'Cost per Mile (FCY)';
            DataClassification = CustomerContent;
        }
        field(12; "Journey Cost (LCY)"; Decimal)
        {
            Caption = 'Total Cost (LCY)';
            DataClassification = CustomerContent;
        }
        field(13; "Journey Cost (FCY)"; Decimal)
        {
            Caption = 'Journey Cost (FCY)';
            DataClassification = CustomerContent;
        }
        field(14; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
            SumIndexFields = Distance;
        }
        key(Key2; "Vehicle No.", "Posting Date")
        {
            SumIndexFields = Distance, "Entry No.";
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Vehicle No.", Description)
        {
        }
        fieldgroup(Brick; "Vehicle No.", Description)
        {
        }
    }
    trigger OnInsert()
    begin
        if this.FindLast() then
            "Entry No." := "Entry No." + 1
        else
            "Entry No." := 1;
    end;
}
