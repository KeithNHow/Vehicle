/// <summary>
/// Query KNH Vehicle Make (ID 51502).
/// </summary>
query 51502 "KNHVehicleMake"
{
    Caption = 'KNH Vehicle Make';
    QueryType = Normal;

    elements
    {
        dataitem(KNHVehicleMake; "KNHVehicleMake")
        {
            column("Code"; "Code")
            {
            }
            column(Country; Country)
            {
            }
            column(Description; Description)
            {
            }
            column(Name; Name)
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
