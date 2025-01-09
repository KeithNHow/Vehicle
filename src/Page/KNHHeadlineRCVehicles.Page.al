/// <summary>
/// Page KNH Headline RC Vehicles (ID 51509).
/// </summary>
page 51509 "KNHHeadlineRCVehicles"
{
    Caption = 'Headline';
    PageType = HeadlinePart;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            group(Control1)
            {
                ShowCaption = false;
                Visible = UserGreetingVisible;
                field(GreetingText; this.RCHeadlinesPageCommon.GetGreetingText())
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Greeting headline';
                    Editable = false;
                }
            }
            group(Control2)
            {
                ShowCaption = false;
                Visible = DefaultFieldsVisible;
                field(DocumentationText; this.RCHeadlinesPageCommon.GetDocumentationText())
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Documentation headline';
                    DrillDown = true;
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        HyperLink(this.RCHeadlinesPageCommon.DocumentationUrlTxt());
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        this.RCHeadlinesPageCommon.HeadlineOnOpenPage(Page::"Headline RC Order Processor");
        this.DefaultFieldsVisible := this.RCHeadlinesPageCommon.AreDefaultFieldsVisible();
        this.UserGreetingVisible := this.RCHeadlinesPageCommon.IsUserGreetingVisible();
    end;

    var
        RCHeadlinesPageCommon: Codeunit "RC Headlines Page Common";
        UserGreetingVisible: Boolean;
        DefaultFieldsVisible: Boolean;
}
