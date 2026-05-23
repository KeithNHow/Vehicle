/// <summary>
/// Page KNH Headline RC Vehicles (ID 51509).
/// </summary>
namespace KNHVehicle;
using System.Visualization;

page 51509 KNHHeadlineRCVehicles
{
    Caption = 'Headline';
    PageType = HeadlinePart;
    RefreshOnActivate = true;
    ApplicationArea = All;

    layout
    {
        area(Content)
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
                    ToolTip = 'Specifies the value of the Greeting headline field.';
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
                    ToolTip = 'Specifies the value of the Documentation headline field.';

                    trigger OnDrillDown()
                    begin
                        Hyperlink(this.RCHeadlinesPageCommon.DocumentationUrlTxt());
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
        DefaultFieldsVisible: Boolean;
        UserGreetingVisible: Boolean;
}
