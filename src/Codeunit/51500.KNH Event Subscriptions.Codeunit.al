/// <summary>
/// Codeunit KNH Event Subscriptions (ID 51500).
/// EventSubscriber(ObjectType, Object Name, Event, ElementName, SkipOnMissingLicense, SkipOnMissingPermission).
/// Event Objects (Table, Page, Codeunit, Report, Query XMLPort, MenuSuite).
/// Event Types (Trigger, Integration, Business).
/// 1 - BUSINESS events carry an implicit promise not to change in future releases.
/// 2 - INTEGRATION events do not carry a promise of not changing, nor does it have the restriction not to expose implementation details.
/// 3 - GLOBAL events are predefined system events that are automatically raised by various base application codeunits.
/// 4 - DATABASE TRIGGER events are automatically raised by the system when it performs database operations on a table object, such as deleting, inserting, modifying and renaming a record, as defined in a table. 
/// Table Trigger Event - OnAfterInsertEvent, OnAfterDeleteEvent, OnAfterModifyEvent, OnAfterValidateEvent, OnAfterRenameEvent - OnBeforeInsertEvent, OnBeforeDeleteEvent, OnBeforeModifyEvent, OnBeforeValidateEvent, OnBeforeRenameEvent.
/// Page Trigger Event - OnAfterActionEvent, OnAfterActivateFields, OnAfterGetCurrRecordEvent, OnAfterGetRecordEvent, OnAfterOpenPage, OnAfterValidateEvent, OnBeforeActionEvent, OnBeforeValidateEvent.
/// </summary>
codeunit 51500 "KNH Event Subscriptions"
{
    [Eventsubscriber(ObjectType::Table, Database::"KNH Vehicle", 'OnBeforeValidateRegistrationNo', '', true, true)]
    local procedure OnBeforeValidateRegistrationNo(var KNHVehicle: Record "KNH Vehicle"; xKNHVehicle: Record "KNH Vehicle")
    begin
        Message('You have found me!');
    end;

    [EventSubscriber(ObjectType::Table, Database::"KNH Vehicle", 'OnAfterValidateEvent', 'Registration Date', true, true)]
    local procedure OnAfterValidateRegDate()
    begin
        Message('You have found me!');
    end;

    [Eventsubscriber(ObjectType::table, Database::Customer, 'OnAfterValidateCity', '', true, true)]
    local procedure OnAfterValidateCity(var Customer: Record Customer; xCustomer: Record Customer)
    begin
        Message('I am Here!');
    end;

    [Eventsubscriber(ObjectType::table, Database::Customer, 'OnAfterValidateEvent', 'Name', true, true)]
    local procedure OnAfterValidateTableName()
    begin
        Message('I am Here!');
    end;

    [EventSubscriber(ObjectType::Table, Database::"KNH Vehicle Make", 'OnBeforeValidateCountry', '', true, true)]
    local procedure OnBeforeValidateCountry(var KNHVehicleMake: Record "KNH Vehicle Make"; var IsHandled: Boolean)
    begin
        IsHandled := true;
        Message('Some sort of task is carried out here.');
    end;

    [EventSubscriber(ObjectType::Table, Database::"KNH Vehicle Make", 'OnAfterValidateCountry', '', true, true)]
    local procedure OnAfterValidateCountry(var KNHVehicleMake: Record "KNH Vehicle Make")
    begin
        Message('Validate which continent country belongs to.');
    end;

    [Eventsubscriber(ObjectType::Page, Page::"Customer Card", 'OnAfterOnOpenPage', '', true, true)]
    local procedure OnAfterOnOpenPage(var Customer: Record Customer; xCustomer: Record Customer)
    begin
        Message('I am Here!');
    end;

    [Eventsubscriber(ObjectType::Page, Page::"Customer Card", 'OnAfterValidateEvent', 'Name', true, true)]
    local procedure OnAfterValidatePageName()
    begin
        Message('I am Here!');
    end;

    [Eventsubscriber(ObjectType::Codeunit, Codeunit::DimensionManagement, 'OnBeforeEditDimensionSet', '', true, true)]
    local procedure OnBeforeEditDimensionSet(DimSetID: Integer; NewCaption: Text[250]; var NewDimSetID: Integer; var IsHandled: Boolean)
    begin
        Message('I am Here!');
        IsHandled := true;
    end;

    [Eventsubscriber(ObjectType::Codeunit, Codeunit::DimensionManagement, 'OnAfterDeleteDefaultDim', '', true, true)]
    local procedure OnAfterDeleteDefaultDim(TableID: Integer; No: Code[20])
    begin
        Message('I am Here!');
    end;

    /*
        [EventSubscriber(ObjectType::Query, Query::"KNH Vehicle", '', 'Make Code', true, true)]
        local procedure OnAfterElementMakeCode()
        begin
            Message('I am Here!');
        end;

        [Eventsubscriber(ObjectType::Report , Report::"KNH Vehicle Journey", '', 'Description', true, true)]
        local procedure OnAfterColumnDescription()
        begin
            Message('I am Here!');
        end;

        [EventSubscriber(ObjectType::XmlPort, XMLPort::"Export Contact", '', 'ContactNameTitle', true, true)]
        local procedure OnAfterFieldContactName()
        begin
            Message('I am Here!');
        end;
        */
}
