/// <summary>
/// Codeunit KNH Event Subscriptions (ID 51500).
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
}
