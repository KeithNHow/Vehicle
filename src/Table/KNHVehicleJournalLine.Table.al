/// <summary>
/// Table KNH Vehicle Journal Line (ID 51507).
/// </summary>
table 51507 "KNHVehicleJournalLine"
{
    Caption = 'Vehicle Journal Line';
    DrillDownPageID = "Item Journal Lines";
    LookupPageID = "Item Journal Lines";

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Item Journal Template";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            TableRelation = "KNHVehicle";

            trigger OnValidate()
            begin
                if "Vehicle No." <> xRec."Vehicle No." then;
            end;
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';

            trigger OnValidate()
            begin
                this.TestField("Posting Date");
                this.Validate("Document Date", "Posting Date");
            end;
        }
        field(5; "Entry Type"; Enum "Item Ledger Entry Type")
        {
            Caption = 'Entry Type';

            trigger OnValidate()
            begin
            end;
        }
        field(6; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            Editable = false;
            TableRelation = if ("Source Type" = const(Customer)) Customer
            else
            if ("Source Type" = const(Vendor)) Vendor
            else
            if ("Source Type" = const(Item)) Item;
        }
        field(7; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(11; "Source Posting Group"; Code[20])
        {
            Caption = 'Source Posting Group';
            Editable = false;
            TableRelation = if ("Source Type" = const(Customer)) "Customer Posting Group"
            else
            if ("Source Type" = const(Vendor)) "Vendor Posting Group"
            else
            if ("Source Type" = const(Item)) "Inventory Posting Group";
        }
        field(16; "Unit Amount"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Amount';

            trigger OnValidate()
            begin
            end;
        }
        field(17; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';

            trigger OnValidate()
            begin
            end;
        }
        field(18; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;

                if IsHandled then
                    exit;
            end;
        }
        field(26; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            Editable = false;
            TableRelation = "Source Code";
        }
        field(34; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(35; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));
            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(39; "Source Type"; Enum "Analysis Source Type")
        {
            Caption = 'Source Type';
            Editable = false;
        }
        field(41; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("Journal Template Name"));
        }
        field(42; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(49; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(57; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(58; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(60; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(62; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(65; "Posting No. Series"; Code[20])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series";
        }

        field(72; "Unit Cost (ACY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Unit Cost (ACY)';
            Editable = false;
        }
        field(73; "Source Currency Code"; Code[10])
        {
            AccessByPermission = TableData "Drop Shpt. Post. Buffer" = R;
            Caption = 'Source Currency Code';
            Editable = false;
            TableRelation = Currency;
        }
    }
    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Line No.")
        {
            Clustered = true;
            MaintainSIFTIndex = false;
        }
    }
    fieldgroups
    {
    }
}
