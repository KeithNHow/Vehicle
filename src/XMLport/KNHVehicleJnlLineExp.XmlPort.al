/// <summary>
/// XmlPort "KNH Vehicle Journal Line" (ID 51500).
/// </summary>
xmlport 51500 "KNHVehicleJnlLineExp"
{
    Caption = 'Vehicle Journal Line';

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(KNHVehicleJournalLine; KNHVehicleJournalLine)
            {
                textattribute(FileName)
                {
                    trigger OnBeforePassVariable()
                    begin
                        FileName := 'Vehicle Journal Lines';
                    end;
                }
                textattribute(ExportNumber)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ExportNumber := Format(0001);
                    end;
                }
                textattribute(PymtRecordCount)
                {
                    trigger OnBeforePassVariable()
                    begin
                        PymtRecordCount := Format(RecordCount);
                    end;
                }
                fieldelement(Amount; KNHVehicleJournalLine.Amount)
                {
                    trigger OnBeforePassField()
                    begin

                    end;
                }
                fieldelement(CountryRegionCode; KNHVehicleJournalLine."Country/Region Code")
                {
                    trigger OnBeforePassField()
                    begin

                    end;
                }
                fieldelement(Description; KNHVehicleJournalLine.Description)
                {
                }
                fieldelement(DocumentDate; KNHVehicleJournalLine."Document Date")
                {
                }
                fieldelement(DocumentNo; KNHVehicleJournalLine."Document No.")
                {
                }
                fieldelement(EntryType; KNHVehicleJournalLine."Entry Type")
                {
                }
                fieldelement(ExternalDocumentNo; KNHVehicleJournalLine."External Document No.")
                {
                }
                fieldelement(GenBusPostingGroup; KNHVehicleJournalLine."Gen. Bus. Posting Group")
                {
                }
                fieldelement(GenProdPostingGroup; KNHVehicleJournalLine."Gen. Prod. Posting Group")
                {
                }
                fieldelement(JournalBatchName; KNHVehicleJournalLine."Journal Batch Name")
                {
                }
                fieldelement(JournalTemplateName; KNHVehicleJournalLine."Journal Template Name")
                {
                }
                fieldelement(LineNo; KNHVehicleJournalLine."Line No.")
                {
                }
                fieldelement(PostingDate; KNHVehicleJournalLine."Posting Date")
                {
                }
                fieldelement(PostingNoSeries; KNHVehicleJournalLine."Posting No. Series")
                {
                }
                fieldelement(ReasonCode; KNHVehicleJournalLine."Reason Code")
                {
                }
                fieldelement(ShortcutDimension1Code; KNHVehicleJournalLine."Shortcut Dimension 1 Code")
                {
                }
                fieldelement(ShortcutDimension2Code; KNHVehicleJournalLine."Shortcut Dimension 2 Code")
                {
                }
                fieldelement(SourceCode; KNHVehicleJournalLine."Source Code")
                {
                }
                fieldelement(SourceCurrencyCode; KNHVehicleJournalLine."Source Currency Code")
                {
                }
                fieldelement(SourceNo; KNHVehicleJournalLine."Source No.")
                {
                }
                fieldelement(SourcePostingGroup; KNHVehicleJournalLine."Source Posting Group")
                {
                }
                fieldelement(SourceType; KNHVehicleJournalLine."Source Type")
                {
                }
                fieldelement(UnitAmount; KNHVehicleJournalLine."Unit Amount")
                {
                }
                fieldelement(UnitCost; KNHVehicleJournalLine."Unit Cost")
                {
                }
                fieldelement(UnitCostACY; KNHVehicleJournalLine."Unit Cost (ACY)")
                {
                }
                fieldelement(VehicleNo; KNHVehicleJournalLine."Vehicle No.")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PostingDate; ExportDateReq)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Export Date';
                        ToolTip = 'Specifies the export date for the Journal Lines.';
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
            }
        }

        trigger OnOpenPage()
        begin
            if ExportDateReq = 0D then
                ExportDateReq := WorkDate();
        end;
    }
    trigger OnInitXmlPort()
    begin
    end;

    trigger OnPreXmlPort()
    var
        KNHVehicleJournalLine: Record "KNHVehicleJournalLine";
    begin
        KNHVehicleJournalLine.SetRange("Journal Template Name", 'Default');
        KNHVehicleJournalLine.SetRange("Journal Batch Name", 'Default');
        RecordCount := KNHVehicleJournalLine.Count();

        MyXmlPortEvent();
    end;

    trigger OnPostXmlPort()
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure MyXmlPortEvent()
    begin
    end;

    var
        ExportDateReq: Date;
        RecordCount: Integer;
}
