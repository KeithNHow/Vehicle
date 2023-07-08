/// <summary>
/// PermSet KNH Vehicle (ID 51500).
/// </summary>
permissionset 51500 "KNHVehicle"
{
    Assignable = true;
    Caption = 'KNH Vehicle', MaxLength = 30;
    Permissions =

        table "KNHVehicle" = X,
        tabledata "KNHVehicle" = RMID,
        table "KNHVehicleMake" = X,
        tabledata "KNHVehicleMake" = RMID,
        table "KNHVehicleModel" = X,
        tabledata "KNHVehicleModel" = RMID,
        table "KNHVehicleJourney" = X,
        tabledata "KNHVehicleJourney" = RMID,
        table "KNHVehicleSetup" = X,
        tabledata "KNHVehicleSetup" = RMID,
        table "KNHVehicleJournalTemplate" = X,
        tabledata "KNHVehicleJournalTemplate" = RMID,
        table "KNHVehicleJournalBatch" = X,
        tabledata "KNHVehicleJournalBatch" = RMID,
        table "KNHVehicleJournalLine" = X,
        tabledata "KNHVehicleJournalLine" = RMID,
        table "KNHVehicleCue" = X,
        tableData "KNHVehicleCue" = RMID,
        page "KNHVehicleCard" = X,
        page "KNHVehicleList" = X,
        page "KNHVehicleJourneys" = X,
        page "KNHVehicleSetup" = X,
        page "KNHVehicleJournalTemplate" = X,
        page "KNHVehicleBalances" = X,
        page "KNHVehicleMake" = X,
        page "KNHVehicleModel" = X,
        page "KNHVehicleMaintenanceRC" = X,
        page "KNHHeadlineRCVehicles" = X,
        page "KNHVehicleActivities" = X,
        codeunit "KNHEventSubscriptions" = X,
        codeunit "KNHVehicleMaintenance" = X,
        query "KNHVehicle" = X,
        query "KNHVehicleJourneyCount" = X,
        query "KNHVehicleMake" = X,
        report "KNHVehicleJourney" = X,
        report "KNHVehicleBalance" = X;
}
