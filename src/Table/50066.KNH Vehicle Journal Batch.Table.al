/// <summary>
/// Table KNH Vehicle Journal Batch (ID 50066).
/// </summary>
table 50066 "KNH Vehicle Journal Batch"
{
    Caption = 'Vehicle Journal Batch';
    DataCaptionFields = Name, Description;
    //LookupPageID = "Vehicle Journal Batches";

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            NotBlank = true;
            TableRelation = "KNH Vehicle Journal Template";
        }
        field(2; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";

            trigger OnValidate()
            begin
                if "Reason Code" <> xRec."Reason Code" then begin
                    ItemJournalLine.SetRange("Journal Template Name", "Journal Template Name");
                    ItemJournalLine.SetRange("Journal Batch Name", Name);
                    ItemJournalLine.ModifyAll("Reason Code", "Reason Code");
                    Modify();
                end;
            end;
        }
        field(5; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";

            trigger OnValidate()
            begin
                if "No. Series" <> '' then begin
                    ItemJournalTemplate.Get("Journal Template Name");
                    if ItemJournalTemplate.Recurring then
                        Error(
                          RecurringJnlTxt,
                          FieldCaption("Posting No. Series"));
                    if "No. Series" = "Posting No. Series" then
                        Validate("Posting No. Series", '');
                end;
            end;
        }
        field(6; "Posting No. Series"; Code[20])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series";

            trigger OnValidate()
            begin
                if ("Posting No. Series" = "No. Series") and ("Posting No. Series" <> '') then
                    FieldError("Posting No. Series", StrSubstNo(PostingNoTxt, "Posting No. Series"));
                ItemJournalLine.SetRange("Journal Template Name", "Journal Template Name");
                ItemJournalLine.SetRange("Journal Batch Name", Name);
                ItemJournalLine.ModifyAll("Posting No. Series", "Posting No. Series");
                Modify();
            end;
        }
        field(21; "Template Type"; Enum "Item Journal Template Type")
        {
            CalcFormula = Lookup("Item Journal Template".Type WHERE(Name = FIELD("Journal Template Name")));
            Caption = 'Template Type';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        ItemJournalLine.SetRange("Journal Template Name", "Journal Template Name");
        ItemJournalLine.SetRange("Journal Batch Name", Name);
        ItemJournalLine.DeleteAll(true);
    end;

    trigger OnInsert()
    begin
        LockTable();
        ItemJournalTemplate.Get("Journal Template Name");
    end;

    trigger OnRename()
    begin
        ItemJournalLine.SetRange("Journal Template Name", xRec."Journal Template Name");
        ItemJournalLine.SetRange("Journal Batch Name", xRec.Name);
        while ItemJournalLine.FindFirst() do
            ItemJournalLine.Rename("Journal Template Name", Name, ItemJournalLine."Line No.");
    end;

    var
        ItemJournalTemplate: Record "Item Journal Template";
        ItemJournalLine: Record "Item Journal Line";
        RecurringJnlTxt: Label 'Only the %1 field can be filled in on recurring journals.', Comment = '%1 = Posting No. Series';
        PostingNoTxt: Label 'must not be %1', Comment = '%1 = Posting No. series';

    /// <summary>
    /// SetupNewBatch.
    /// </summary>
    procedure SetupNewBatch()
    begin
        ItemJournalTemplate.Get("Journal Template Name");
        "No. Series" := ItemJournalTemplate."No. Series";
        "Posting No. Series" := ItemJournalTemplate."Posting No. Series";
        "Reason Code" := ItemJournalTemplate."Reason Code";
    end;
}
