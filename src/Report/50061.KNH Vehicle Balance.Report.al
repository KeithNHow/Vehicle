/// <summary>
/// Report KNH Balance Report (ID 50061).
/// </summary>
report 50061 "KNH Vehicle Balance"
{
    ApplicationArea = All;
    Caption = 'Balance Report';
    UsageCategory = ReportsAndAnalysis;
    defaultlayout = rdlc;
    RDLCLayout = '.\src\Report\rdlc\KNHVehicleBalance.rdlc';

    dataset
    {
        dataitem(Vehicle; "KNH Vehicle")
        {
            column(No_; "No.")
            {
            }
            column(Registration_No_; "Registration No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
            end;

            trigger OnPreDataItem()
            begin
            end;

            trigger OnPostDataItem()
            begin
            end;
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
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies that interactions with the contact are logged.';
                    }
                }
            }
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction();
            LogInteractionEnable := LogInteraction;
        end;
    }

    trigger OnInitReport()
    begin
        CompanyInfo.SetAutoCalcFields(Picture);
        CompanyInfo.Get();
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not CurrReport.Preview then
            if Vehicle.FindSet() then
                repeat
                    if Vehicle."No." <> '' then begin
                        //DocumentType, DocumentNo, DocNoOccurrence, VersionNo,AccountTableNo, AccountNo, SalespersonCode, CampaignNo, Description, OpportunityNo
                        //SegManagement.LogDocument()
                    end;
                until Vehicle.Next() = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction;
    end;

    var
        LogInteraction: Boolean;
        LogInteractionEnable: Boolean;
        SegManagement: Codeunit SegManagement;
        CompanyInfo: Record "Company Information";

    local procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
    end;

}
