/// <summary>
/// Report KNH Vehicle Balance (ID 51501).
/// </summary>
report 51501 "KNH Vehicle Balance"
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
                    field(LogInteraction; LogInteract)
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
            LogInteractionEnable := LogInteract;
        end;
    }

    trigger OnInitReport()
    begin
        CompanyInformation.SetAutoCalcFields(Picture);
        CompanyInformation.Get();
    end;

    trigger OnPostReport()
    begin
        if LogInteract and not CurrReport.Preview then
            if Vehicle.FindSet() then
                repeat
                    if Vehicle."No." <> '' then;
                //DocumentType, DocumentNo, DocNoOccurrence, VersionNo,AccountTableNo, AccountNo, SalespersonCode, CampaignNo, Description, OpportunityNo
                //SegManagement.LogDocument()
                until Vehicle.Next() = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction();
    end;

    var
        CompanyInformation: Record "Company Information";
        SegManagement: Codeunit SegManagement;
        LogInteract: Boolean;
        LogInteractionEnable: Boolean;

    local procedure InitLogInteraction()
    begin
        LogInteract := SegManagement.FindInteractTmplCode(4) <> '';
    end;
}
