/// <summary>
/// This page is the role center for vehicle maintenance. It provides an overview of the vehicles, as well as quick access to the vehicle list, vehicle details, and vehicle brands and models. The page also includes a section for notes, where users can add and view notes related to vehicle maintenance.
/// </summary>

namespace KNHVehicle;

page 51508 KNHVehicleMaintenanceRC
{
    Caption = 'Vehicle Maintenance RC';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            part(Control104; KNHHeadlineRCVehicles)
            {
                ApplicationArea = All;
            }
            part(Control1901851508; KNHVehicleActivities)
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
                    ToolTip = 'View the list of vehicles.';
                    RunObject = page KNHVehicleList;
                }
                action(Journeys)
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle Details';
                    ToolTip = 'View details and journeys for each vehicle.';
                    RunObject = page KNHVehicleJourneys;
                }
                action(Brand)
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle Brand';
                    ToolTip = 'View the list of vehicle brands.';
                    RunObject = page KNHVehicleBrand;
                }
                action(Model)
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle Model';
                    ToolTip = 'View the list of vehicle models.';
                    RunObject = page KNHVehicleBrand;
                }
            }
        }
    }
}