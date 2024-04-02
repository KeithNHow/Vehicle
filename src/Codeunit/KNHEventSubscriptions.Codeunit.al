/// <summary>
/// Codeunit KNH Event Subscriptions (ID 51500).
/// EventSubscriber(ObjectType, Object Name, Event, ElementName, SkipOnMissingLicense, SkipOnMissingPermission).
/// Event Objects (Table, Page, Codeunit, Report, Query XMLPort, MenuSuite).
/// Event Types (Trigger, Integration, Business).
/// 1 - BUSINESS events carry an implicit promise not to change in future releases.
/// 2 - INTEGRATION events do not carry a promise of not changing, nor does it have the restriction not to expose implementation details.
/// 3 - GLOBAL events are predefined system events that are automatically raised by various base application codeunits - 9170, 42, 44, 45, 49
/// 4 - TRIGGER events
/// ------------------
/// 4a. DATABASE Trigger events are automatically raised by the system when it performs database operations on a table object, such as deleting, inserting, modifying and renaming a record, as defined in a table. Examples - OnAfterInsertEvent, OnAfterDeleteEvent, OnAfterModifyEvent, OnAfterValidateEvent, OnAfterRenameEvent - OnBeforeInsertEvent, OnBeforeDeleteEvent, OnBeforeModifyEvent, OnBeforeValidateEvent, OnBeforeRenameEvent.
/// 4b. PAGE Trigger events - OnAfterActionEvent, OnAfterActivateFields, OnAfterGetCurrRecordEvent, OnAfterGetRecordEvent, OnAfterOpenPage, OnAfterValidateEvent, OnBeforeActionEvent, OnBeforeValidateEvent.
/// </summary>
codeunit 51500 "KNHEventSubscriptions"
{
    //Set the event subscribers to bind automatically to the event
    //Default = StaticAutomatic
    EventSubscriberInstance = StaticAutomatic;

    // Integration Event found in KNHVehicle table
    // Event = OnAfterOnInsert 
    // DisplayOnInsertMessage procedure contains two parameters - KNHVehicle and xKNHVehicle
    [Eventsubscriber(ObjectType::Table, Database::"KNHVehicle", 'OnAfterOnInsert', '', true, true)]
    local procedure DisplayOnInsertMessage(var KNHVehicle: Record "KNHVehicle"; xKNHVehicle: Record "KNHVehicle")
    begin
        Message('You have found me!');
    end;

    // Integration Event found in KNHVehicle table
    // Event = OnBeforeValidateRegNo
    // DisplayRegNoMessage procedure contains two parameters - KNHVehicle and xKNHVehicle
    [Eventsubscriber(ObjectType::Table, Database::"KNHVehicle", 'OnBeforeValidateRegistrationNo', '', true, true)]
    local procedure DisplayRegNoMessage(var KNHVehicle: Record "KNHVehicle"; xKNHVehicle: Record "KNHVehicle")
    begin
        Message('You have found me!');
    end;

    // Database trigger 
    // No event or event publisher. Event is tied to OnValidate trigger of Reg Date field  
    // DisplayRegDateMessage procedure contains no parameters  
    [EventSubscriber(ObjectType::Table, Database::"KNHVehicle", 'OnAfterValidateEvent', 'Registration Date', true, true)]
    local procedure DisplayRegDateMessage()
    begin
        Message('You have found me!');
    end;

    // Integration Event found in Customer table
    // Event = OnAfterValidateCity
    // DisplayCityMessage procedure contains two parameters - Cust and xCust
    [Eventsubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateCity', '', true, true)]
    local procedure DisplayCityMessage(var Customer: Record Customer; xCustomer: Record Customer)
    begin
        Message('I am Here!');
    end;

    // Database trigger 
    // No event or event publisher. Event is tied to OnValidate trigger of Name field  
    // DisplayCustNameMessage procedure contains no parameters  
    [Eventsubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateEvent', 'Name', true, true)]
    local procedure DisplayCustNameMessage()
    begin
        Message('I am Here!');
    end;

    // Integration Event found in KNHVehicleBrand table
    // Event = OnBeforeValidateCountry
    // DisplayBeforeValidateCountry procedure contains two parameters - KNHVehicleMake and IsHandled
    [EventSubscriber(ObjectType::Table, Database::"KNHVehicleBrand", 'OnBeforeValidateCountry', '', true, true)]
    local procedure DisplayBeforeValidateCountry(var KNHVehicleBrand: Record "KNHVehicleBrand"; var IsHandled: Boolean)
    begin
        IsHandled := true;
        Message('Some sort of task is carried out here.');
    end;

    // Integration Event found in KNHVehicleBrand table
    // Event = OnAfterValidateCountry
    // DisplayAfterValidateCountry procedure contains one parameter - KNHVehicleMake
    [EventSubscriber(ObjectType::Table, Database::"KNHVehicleBrand", 'OnAfterValidateCountry', '', true, true)]
    local procedure DisplayAfterValidateCountry(var KNHVehicleBrand: Record "KNHVehicleBrand")
    begin
        Message('Validate which continent country belongs to.');
    end;

    // Integration Event found in Cust Card page
    // Event = OnAfterOnOpenPage
    // DisplayOnOpenPageMessage procedure contains two parameters - Cust and xCust  
    [Eventsubscriber(ObjectType::Page, Page::"Customer Card", 'OnAfterOnOpenPage', '', true, true)]
    local procedure DisplayOnOpenPageMessage(var Customer: Record Customer; xCustomer: Record Customer)
    begin
        Message('I am Here!');
    end;

    // Page trigger 
    // No event or event publisher. Event is tied to OnValidate trigger of Name field  
    // DisplayNameMessage procedure contains no parameters  
    [Eventsubscriber(ObjectType::Page, Page::"Customer Card", 'OnAfterValidateEvent', 'Name', true, true)]
    local procedure DisplayNameMessage()
    begin
        Message('I am Here!');
    end;

    // Integration Event found in DimMgmt codeunit
    // Event = OnBeforeEditDimensionSet
    // DisplayEditDimSetMessage procedure contains four parameters - DimSetID, NewCaption, NewDimSetID and IsHandled  
    [Eventsubscriber(ObjectType::Codeunit, Codeunit::DimensionManagement, 'OnBeforeEditDimensionSet', '', true, true)]
    local procedure DisplayEditDimSetMessage(DimSetID: Integer; NewCaption: Text[250]; var NewDimSetID: Integer; var IsHandled: Boolean)
    begin
        Message('I am Here!');
        IsHandled := true;
    end;

    // Integration Event found in DimMgmt codeunit
    // Event = OnAfterDeleteDefaultdim 
    // DisplayDeleteDefDimMessage procedure contains two parameters - table ID and No.  
    [Eventsubscriber(ObjectType::Codeunit, Codeunit::DimensionManagement, 'OnAfterDeleteDefaultDim', '', true, true)]
    local procedure DisplayDeleteDefDimMessage(TableID: Integer; No: Code[20])
    begin
        Message('I am Here!');
    end;

    // Integration Event found in KNHVehicle query
    // Event = MyQueryEvent
    // DisplayQMessage procedure contains no parameters
    [EventSubscriber(ObjectType::Query, Query::"KNHVehicle", 'MyQueryEvent', '', true, true)]
    local procedure DisplayQMessage()
    begin
        Message('I am Here!');
    end;

    // Integration Event found in KNHVehicleJourney report
    // Event = MyReportEvent
    // DisplayRMessage procedure contains one parameter - IsHandled
    // Subs Parameters: ObjectType, ObjName, EventName, EventElement, SkipOnMissLic, SkipOnMissPerm
    [Eventsubscriber(ObjectType::Report, Report::KNHVehicleJourney, 'MyReportEvent', '', true, true)]
    local procedure DisplayRMessage(var IsHandled: Boolean)
    begin
        Message('I am Here!');
        IsHandled := true;
    end;

    // Integration Event found in Customer Card page
    // Event = OnAddrLineChanged
    // CheckCustCardAddrLine procedure contains one parameter - Line
    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnAddrLineChanged', '', true, true)]
    local procedure CheckCustCardAddrLine(Line: Text[100]);
    begin
        if (StrPos(Line, '+') > 0) then
            Message('Can''t use a plus sign (+) in the address [' + Line + ']');
    end;

    // Integration Event found in KNHEventPublications codeunit
    // Event = OnAddressLineChanged
    // DisplayXMLEventMessage procedure contains no parameters
    [EventSubscriber(ObjectType::XmlPort, XMLPort::"KNHVehicleJnlLineExp", 'KNHXMLEvent', '', true, true)]
    local procedure DisplayXMLEventMessage()
    begin
        Message('I am Here!');
    end;
}
