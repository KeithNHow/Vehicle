/// <summary>
/// Unknown KNH Vehicle (ID 51500).
/// </summary>
permissionset 51500 "KNH Vehicle"
{
    Assignable = true;
    Caption = 'KNH Vehicle', MaxLength = 30;
    Permissions =
        table "KNH Vehicle Model" = X,
        tabledata "KNH Vehicle Model" = RMID,
        table "KNH Vehicle" = X,
        tabledata "KNH Vehicle" = RMID,
        table "KNH Vehicle Journey" = X,
        tabledata "KNH Vehicle Journey" = RMID,
        table "KNH Vehicle Make" = X,
        tabledata "KNH Vehicle Make" = RMID,
        table "KNH Vehicle Setup" = X,
        tabledata "KNH Vehicle Setup" = RMID,
        table "KNH Vehicle Journal Template" = X,
        tabledata "KNH Vehicle Journal Template" = RMID,
        table "KNH Vehicle Journal Batch" = X,
        tabledata "KNH Vehicle Journal Batch" = RMID,
        table "KNH Vehicle Journal Line" = X,
        tabledata "KNH Vehicle Journal Line" = RMID,
        page "KNH Vehicle List" = X,
        page "KNH Vehicle Journeys" = X,
        page "KNH Vehicle Card" = X,
        page "KNH Vehicle Make" = X,
        page "KNH Vehicle Model" = X,
        page "KNH Vehicle Journal Template" = X;
}
