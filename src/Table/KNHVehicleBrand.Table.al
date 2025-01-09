/// <summary>
/// Table KNH Vehicle Make (ID 51501)
/// </summary>
table 51501 "KNHVehicleBrand"
{
    DataClassification = CustomerContent;
    Caption = 'Vehicle Make';
    //DataCaptionFields = "Code", Description;
    //LookupPageID = "KNH Vehicle Make";

    fields
    {
        field(1; "Code"; Code[10])
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
        field(4; Country; Text[100])
        {
            Caption = 'Country';
            TableRelation = "Country/Region";

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                this.OnBeforeValidateCountry(xRec, IsHandled);
                Message('Validation Code');
                this.OnAfterValidateCountry(Rec);
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
    local procedure OnBeforeValidateCountry(var KNHVehicleBrand: Record "KNHVehicleBrand"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateCountry(var KNHVehicleBrand: Record "KNHVehicleBrand")
    begin
    end;
}