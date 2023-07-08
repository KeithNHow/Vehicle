/// <summary>
/// Report KNH Vehicle Journey(ID 51500).
/// </summary>
report 51500 "KNHVehicleJourney"
{
    ApplicationArea = All;
    Caption = 'Vehicle Journey';
    UsageCategory = ReportsAndAnalysis;
    defaultlayout = rdlc;
    RDLCLayout = '.\src\Report\rdlc\KNHVehicleJourney.rdlc';

    dataset
    {
        dataitem(KNHVehicleJourney; "KNHVehicleJourney")
        {
            column(VehicleNo; "Vehicle No.")
            {
            }
            column(Description; Description)
            {
            }
            column(StartLocation; "Start Location")
            {
            }
            column(DestinationLocation; "Destination Location")
            {
            }
            column(Distance; Distance)
            {
            }
            column(Driver; Driver)
            {
            }
            column(EntryNo; "Entry No.")
            {
            }
            column(ReasonCode; "Reason Code")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
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

    trigger OnInitReport()
    begin

    end;

    trigger OnPreReport()
    var
        IsHandled: Boolean;
        A: Integer;
        B: Integer;
    begin
        IsHandled := false;
        MyReportEvent(IsHandled);
        if not IsHandled then begin
            A := 1;
            B := 2;
            Message(Format(B) + ' > ' + Format(A));
        end;
    end;

    trigger OnPostReport()
    begin
    end;

    /// <summary>
    /// MyReportEvent.
    /// </summary>
    /// <param name="IsHandled">VAR Boolean.</param>
    [IntegrationEvent(true, false)]
    procedure MyReportEvent(var IsHandled: Boolean)
    begin
    end;
}
