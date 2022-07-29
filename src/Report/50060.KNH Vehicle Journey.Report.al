/// <summary>
/// Report KNH Vehicle Journey(ID 50060).
/// </summary>
report 50060 "KNH Vehicle Journey"
{
    ApplicationArea = All;
    Caption = 'Vehicle Journey';
    UsageCategory = ReportsAndAnalysis;
    defaultlayout = rdlc;
    RDLCLayout = '.\src\Report\rdlc\KNHVehicleJourney.rdlc';

    dataset
    {
        dataitem(KNHVehicleJourney; "KNH Vehicle Journey")
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
}
