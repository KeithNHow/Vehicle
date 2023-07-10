/// <summary>
/// XmlPort "KNH Vehicle Journal Line Import" (ID 51501).
/// </summary>
xmlport 51501 "KNHVehicleJnlLineImp"
{
    Caption = 'Vehicle Journal Line Import';
    Encoding = UTF8;
    FormatEvaluate = Xml;
    FileName = 'C:\Temp\VehicleJournalLineImport.xml';
    Direction = Import;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(KNHVehicleJournalLine; KNHVehicleJournalLine)
            {
                fieldelement(Amount; KNHVehicleJournalLine.Amount)
                {
                }
                fieldelement(CountryRegionCode; KNHVehicleJournalLine."Country/Region Code")
                {
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
                    //Runs after field value assigned and before it is validated and imported.
                    trigger OnAfterAssignField()
                    begin
                        KNHVehicleJournalLine.Validate("Journal Batch Name", 'Test');
                    end;
                }
                fieldelement(JournalTemplateName; KNHVehicleJournalLine."Journal Template Name")
                {
                    trigger OnAfterAssignField()
                    begin
                        KNHVehicleJournalLine.Validate("Journal Template Name", 'Test');
                    end;
                }
                fieldelement(LineNo; KNHVehicleJournalLine."Line No.")
                {
                    trigger OnAfterAssignField()
                    begin
                        KNHVehicleJournalLine.Validate("Line No.", KNHVehicleJournalLine."Line No." + 10000);
                    end;
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
                    field(PostingDate; PostingDateReq)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies Posting Date for Import File';
                    }
                    field(FileName; FileName)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'File Name';
                        ToolTip = 'Specifies path and name for import';
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
            if PostingDateReq = 0D then
                PostingDateReq := WorkDate();
        end;
    }

    trigger OnInitXmlPort()
    begin
    end;

    trigger OnPreXmlPort()
    begin
    end;

    trigger OnPostXmlPort()
    begin
    end;

    var
        PostingDateReq: Date;
}
