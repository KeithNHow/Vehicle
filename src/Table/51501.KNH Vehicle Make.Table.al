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
            TableRelation = "Country/Region";

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                OnBeforeValidateCountry(Rec, IsHandled);
                Message('Validation Code');
                OnAfterValidateCountry(Rec);
            end;
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

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateCountry(var KNHVehicleMake: Record "KNH Vehicle Make"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateCountry(var KNHVehicleMake: Record "KNH Vehicle Make")
    begin
    end;
}