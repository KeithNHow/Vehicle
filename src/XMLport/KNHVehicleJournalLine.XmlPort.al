/// <summary>
/// XmlPort "KNHVehicleJournalLine" (ID 51500).
/// </summary>
xmlport 51500 KNHVehicleJournalLine
{
    Caption = 'KNHVehicleJournalLine';

    schema
    {
        textelement(VehicleJournalLine)
        {
            tableelement(KNHVehicleJournalLine; KNHVehicleJournalLine)
            {
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
                group(Journey)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnInitXmlPort()
    begin
    end;

    trigger OnPreXmlPort()
    begin
        KNHXMLEvent();
    end;

    trigger OnPostXmlPort()
    begin

    end;

    [IntegrationEvent(true, false)]
    local procedure KNHXMLEvent()
    begin

    end;
}
