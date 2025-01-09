/// <summary>
/// Table KNH Vehicle (ID 51500).
/// </summary>
table 51500 "KNHVehicle"
{
    Caption = 'Vehicle';
    DataClassification = ToBeClassified;
    DataCaptionFields = "No.", "Registration No.";
    LookupPageID = "KNHVehicleList";
    DrillDownPageID = "KNHVehicleList";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                this.TestNoSeries();
            end;
        }
        field(2; "Make Code"; Code[10])
        {
            Caption = 'Make';
            FieldClass = FlowField;
            CalcFormula = lookup("KNHVehicleBrand".Code where(Code = field("Make Code")));
        }
        field(3; "Model Code"; Code[10])
        {
            Caption = 'Model';
            FieldClass = FlowField;
            CalcFormula = lookup("KNHVehicleModel".Code where(Code = field("Model Code"), "Vehicle Brand" = field("Make Code")));
        }
        field(4; "Registration No."; Code[10])
        {
            Caption = 'Registration No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                this.OnBeforeValidateRegistrationNo(Rec, xRec);
                this.Testfield("Registration No.");
                this.OnAfterValidateRegistrationNo(Rec, xRec);
            end;
        }
        field(5; "Registration Date"; Date)
        {
            Caption = 'Registration Date';
            DataClassification = CustomerContent;
        }
        field(6; "Owner Surname"; Text[50])
        {
            Caption = 'Owner Surname';
            DataClassification = CustomerContent;
        }
        field(7; "Owner Forename"; Text[50])
        {
            Caption = 'Owner Forename';
            DataClassification = CustomerContent;
        }
        field(8; "Road Tax Date"; Date)
        {
            Caption = 'Road Tax Date';
            DataClassification = CustomerContent;
        }
        field(9; "Engine Plate No."; Code[20])
        {
            Caption = 'Engine Plate No.';
            DataClassification = CustomerContent;
        }
        field(10; "Fuel Type"; Enum "KNHVehicleFuelType")
        {
            Caption = 'Engine Plate No.';
            DataClassification = CustomerContent;
        }
        field(11; "New Cost"; Decimal)
        {
            Caption = 'New Cost';
            DataClassification = CustomerContent;
            TableRelation = "KNHVehicleModel".Code; //FK lookup
        }
        field(12; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(13; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            DataClassification = CustomerContent;
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1), Blocked = const(false));

            trigger OnValidate()
            begin
                this.ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(14; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            DataClassification = CustomerContent;
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2), Blocked = const(false));

            trigger OnValidate()
            begin
                this.ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(15; Image; Media)
        {
            Caption = 'Image';
            ExtendedDatatype = Person;
        }
        field(21; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            DataClassification = CustomerContent;
            ObsoleteReason = 'Created in error.';
            ObsoleteTag = 'field Removed.';
            ObsoleteState = Removed;
        }
        field(22; "Date Filter 2"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(23; "Vehicle Mileage"; Integer)
        {
            Caption = 'Vehicle Mileage';
            FieldClass = FlowField;
            CalcFormula = sum(KNHVehicleJourney.Distance where("Vehicle No." = field("No."), "Posting Date" = field("Date Filter 2")));
        }
        field(24; "Last Vehicle Journey"; Integer)
        {
            Caption = 'Vehicle Mileage';
            FieldClass = FlowField;
            CalcFormula = max(KNHVehicleJourney."Entry No." where("Vehicle No." = field("No."), "Posting Date" = field("Date Filter 2")));
        }
        field(25; "Number of Vehicle Journeys"; Integer)
        {
            Caption = 'Vehicle Mileage';
            FieldClass = FlowField;
            CalcFormula = count(KNHVehicleJourney where("Vehicle No." = field("No."), "Posting Date" = field("Date Filter 2")));
        }
        field(26; "My Vehicle Journey"; Text[100])
        {
            Caption = 'Vehicle Mileage';
            FieldClass = FlowField;
            CalcFormula = lookup(KNHVehicleJourney.Description where("Vehicle No." = field("No."), "Posting Date" = field("Date Filter 2")));
        }
        field(27; "Last Vehicle Journey Name"; Text[100])
        {
            Caption = 'Vehicle Mileage';
            FieldClass = FlowField;
            CalcFormula = lookup(KNHVehicleJourney.Description where("Vehicle No." = field("No."), "Posting Date" = field("Date Filter 2"), "Entry No." = field("Last vehicle Journey")));
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
            SumIndexFields = "New Cost";
        }
        key(Key2; "Registration No.") //secondary key
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Registration No.")
        {
        }
        fieldgroup(Brick; "No.", "Registration No.")
        {
        }
    }

    trigger OnInsert()
    begin
        this.InitVehicleNo();
        this.CuDimensionManagement.UpdateDefaultDim(Database::"KNHVehicle", "No.", "Global Dimension 1 Code", "Global Dimension 2 Code");
        Message(Format("No."));

        this.OnAfterOnInsert(Rec, xRec);
    end;

    local procedure TestNoSeries()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        //OnBeforeTestNoSeries(Rec, xRec, IsHandled);
        if IsHandled then
            exit;

        if "No." <> xRec."No." then begin
            this.KNHVehicleSetup.Get();
            this.NoSeries.TestManual(this.KNHVehicleSetup."Vehicle Nos.");
            "No. Series" := '';
        end;
    end;

    local procedure InitVehicleNo()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        //OnBeforeInitVehicleNo(Rec, xRec, IsHandled);
        if IsHandled then
            exit;

        if "No." = '' then begin
            this.KNHVehicleSetup.Get();
            this.KNHVehicleSetup.TestField("Vehicle Nos.");
            this.NoSeries.GetNextNo(this.KNHVehicleSetup."Vehicle Nos.");
        end;
    end;

    /// <summary>
    /// AssistEdit.
    /// </summary>
    /// <param name="OldKNHVehicle">Record "KNH Vehicle".</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure AssistEdit(OldKNHVehicle: Record "KNHVehicle"): Boolean
    var
        KNHVehicle: Record "KNHVehicle";
    begin
        KNHVehicle := Rec;
        this.KNHVehicleSetup.Get();
        this.KNHVehicleSetup.TestField("Vehicle Nos.");
        if this.NoSeries.LookupRelatedNoSeries(KNHVehicleSetup."Vehicle Nos.", "No. Series", "No. Series") then begin
            "No." := this.NoSeries.GetNextNo("No. Series");
            Rec := KNHVehicle;
            OnAssistEditOnBeforeExit(KNHVehicle);
            exit(true);
        end;
    end;

    /// <summary>
    /// ValidateShortcutDimCode.
    /// </summary>
    /// <param name="FieldNumber">Integer.</param>
    /// <param name="ShortcutDimCode">VAR Code[20].</param>
    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        //OnBeforeValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode, IsHandled);
        if IsHandled then
            exit;

        this.CuDimensionManagement.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        if not this.IsTemporary then begin
            this.CuDimensionManagement.SaveDefaultDim(Database::"KNHVehicle", "No.", FieldNumber, ShortcutDimCode);
            Rec.Modify();
        end;

        //OnAfterValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode);
    end;

    var
        KNHVehicleSetup: Record "KNHVehicleSetup";
        NoSeries: Codeunit "No. Series";
        CuDimensionManagement: Codeunit DimensionManagement;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateRegistrationNo(var KNHVehicle: Record "KNHVehicle"; xKNHVehicle: Record "KNHVehicle")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateRegistrationNo(var KNHVehicle: Record "KNHVehicle"; xKNHVehicle: Record "KNHVehicle")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOnInsert(var KNHVehicle: Record KNHVehicle; xKNHVehicle: Record KNHVehicle)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAssistEditOnBeforeExit(var KNHVehicle: Record KNHVehicle)
    begin
    end;
}
