/// <summary>
/// Page KNH Vehicle Maintenance RC (ID 51508).
/// </summary>
page 51508 "KNHVehicleMaintenanceRC"
{
    Caption = 'Vehicle Maintenance RC';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control104; "KNHHeadlineRCVehicles")
            {
                ApplicationArea = All;
            }
            part(Control1901851508; "KNHVehicleActivities")
            {
                ApplicationArea = All;
            }
            systempart(Control1901377608; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }
    actions
    {
        area(Sections)
        {
            group(Group)
            {
                Caption = 'Vehicles';
                action(Vehicles)
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle List';
                    RunObject = page "KNHVehicleList";
                }
                action(Journeys)
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle Details';
                    RunObject = page "KNHVehicleJourneys";
                }
                action(Make)
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle Make';
                    RunObject = page "KNHVehicleMake";
                }
                action(Model)
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle Model';
                    RunObject = page "KNHVehicleMake";
                }
            }
        }
    }
}