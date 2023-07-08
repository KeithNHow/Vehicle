/// <summary>
/// Table Vehicle Journal Template (ID 51505).
/// </summary>
table 51505 "KNHVehicleJournalTemplate"
{
    Caption = 'Vehicle Journal Template';
    //LookupPageID = "KNH Journal Template List";
    ReplicateData = true;

    fields
    {
        field(1; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(2; Description; Text[80])
        {
            Caption = 'Description';
        }
        field(5; "Test Report ID"; Integer)
        {
            Caption = 'Test Report ID';
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Report));
        }
        field(7; "Posting Report ID"; Integer)
        {
            Caption = 'Posting Report ID';
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Report));
        }
        field(8; "Force Posting Report"; Boolean)
        {
            Caption = 'Force Posting Report';
        }
        field(10; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";

            trigger OnValidate()
            begin
                KNHVehicleJournalLine.SetRange("Journal Template Name", Name);
                KNHVehicleJournalLine.ModifyAll("Source Code", "Source Code");
                Modify();
            end;
        }
        field(11; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(15; "Test Report Caption"; Text[250])
        {
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = const(Report), "Object ID" = field("Test Report ID")));
            Caption = 'Test Report Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Posting Report Caption"; Text[250])
        {
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = const(Report), "Object ID" = field("Posting Report ID")));
            Caption = 'Posting Report Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";

            trigger OnValidate()
            begin
                if "No. Series" <> '' then
                    if "No. Series" = "Posting No. Series" then
                        "Posting No. Series" := '';
            end;
        }
        field(20; "Posting No. Series"; Code[20])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series";

            trigger OnValidate()
            begin
                if ("Posting No. Series" = "No. Series") and ("Posting No. Series" <> '') then
                    FieldError("Posting No. Series", StrSubstNo(PostTxt, "Posting No. Series"));
            end;
        }
        field(30; "Increment Batch Name"; Boolean)
        {
            Caption = 'Increment Batch Name';
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Name, Description)
        {
        }
    }

    trigger OnDelete()
    begin
        KNHVehicleJournalLine.SetRange("Journal Template Name", Name);
        KNHVehicleJournalLine.DeleteAll(true);
        KNHVehicleJournalBatch.SetRange("Journal Template Name", Name);
        KNHVehicleJournalBatch.DeleteAll();
    end;

    var
        KNHVehicleJournalBatch: Record "KNHVehicleJournalBatch";
        KNHVehicleJournalLine: Record "KNHVehicleJournalLine";
        PostTxt: Label 'must not be %1', Comment = '%1 = Posting no. Series';
}
