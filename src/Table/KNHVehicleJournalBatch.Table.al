/// <summary>
/// Table KNH Vehicle Journal Batch (ID 51506).
/// </summary>
table 51506 "KNHVehicleJournalBatch"
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
            TableRelation = "KNHVehicleJournalTemplate";
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
                    this.ItemJournalLine.SetRange("Journal Template Name", "Journal Template Name");
                    this.ItemJournalLine.SetRange("Journal Batch Name", Name);
                    this.ItemJournalLine.ModifyAll("Reason Code", "Reason Code");
                    this.Modify();
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
                    this.ItemJournalTemplate.Get("Journal Template Name");
                    if this.ItemJournalTemplate.Recurring then
                        Error(
                          this.RecurringJnlTxt,
                          this.FieldCaption("Posting No. Series"));
                    if "No. Series" = "Posting No. Series" then
                        this.Validate("Posting No. Series", '');
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
                    this.FieldError("Posting No. Series", StrSubstNo(this.PostingNoTxt, "Posting No. Series"));
                this.ItemJournalLine.SetRange("Journal Template Name", "Journal Template Name");
                this.ItemJournalLine.SetRange("Journal Batch Name", Name);
                this.ItemJournalLine.ModifyAll("Posting No. Series", "Posting No. Series");
                this.Modify();
            end;
        }
        field(21; "Template Type"; Enum "Item Journal Template Type")
        {
            CalcFormula = lookup("Item Journal Template".Type where(Name = field("Journal Template Name")));
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
        this.ItemJournalLine.SetRange("Journal Template Name", "Journal Template Name");
        this.ItemJournalLine.SetRange("Journal Batch Name", Name);
        this.ItemJournalLine.DeleteAll(true);
    end;

    trigger OnInsert()
    begin
        this.LockTable();
        this.ItemJournalTemplate.Get("Journal Template Name");
    end;

    trigger OnRename()
    begin
        this.ItemJournalLine.SetRange("Journal Template Name", xRec."Journal Template Name");
        this.ItemJournalLine.SetRange("Journal Batch Name", xRec.Name);
        while this.ItemJournalLine.FindFirst() do
            this.ItemJournalLine.Rename("Journal Template Name", Name, this.ItemJournalLine."Line No.");
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
        this.ItemJournalTemplate.Get("Journal Template Name");
        "No. Series" := this.ItemJournalTemplate."No. Series";
        "Posting No. Series" := this.ItemJournalTemplate."Posting No. Series";
        "Reason Code" := this.ItemJournalTemplate."Reason Code";
    end;
}
