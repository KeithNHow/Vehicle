/// <summary>
/// Codeunit KNH Event Subscriptions (ID 50060).
/// </summary>
codeunit 50060 "KNH Event Subscriptions"
{
    [Eventsubscriber(ObjectType::Table, Database::"KNH Vehicle", 'OnBeforeValidateRegistrationNo', '', true, true)]
    local procedure OnBeforeValidateRegistrationNo(var Vehicle: Record "KNH Vehicle"; xVehicle: Record "KNH Vehicle")
    begin
        Message('You have found me!');
    end;
}
