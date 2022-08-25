/// <summary>
/// Page KNH Vehicle Maintenance RC (ID 51508).
/// </summary>
page 51508 "KNH Vehicle Maintenance RC"
{
    Caption = 'Vehicle Maintenance RC';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control104; "KNH Headline RC Vehicles")
            {
                ApplicationArea = All;
            }
            part(Control1901851508; "KNH Vehicle Activities")
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
                    RunObject = page "KNH Vehicle List";
                }
                action(Journeys)
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle Details';
                    RunObject = page "KNH Vehicle Journeys";
                }
                action(Make)
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle Make';
                    RunObject = page "KNH Vehicle Make";
                }
                action(Model)
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle Model';
                    RunObject = page "KNH Vehicle Make";
                }
            }
        }
    }
}