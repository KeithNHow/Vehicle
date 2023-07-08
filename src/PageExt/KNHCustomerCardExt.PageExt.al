/// <summary>
/// PageExtension "KNHCustomerExt" (ID 51500) extends Record Customer.
/// </summary>
pageextension 51500 "KNHCustomerCardExt" extends "Customer Card"
{
    layout
    {
        modify(Address)
        {
            trigger OnBeforeValidate();
            begin
                OnAddrLineChanged(Rec.Address);
            end;
        }
    }

    [IntegrationEvent(false, false)]
    local procedure OnAddrLineChanged(Line: Text[100])
    begin
    end;
}
