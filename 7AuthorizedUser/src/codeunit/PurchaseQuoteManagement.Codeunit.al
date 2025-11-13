codeunit 50100 PurchaseQuoteManagement
{
    Permissions =
        tabledata "User Setup" = RIMD;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Quote to Order", "OnBeforeRun", '', false, false)]
    local procedure CheckUserPermissionOnBeforeConvertQuoteToOrder(var PurchaseHeader: Record "Purchase Header")
    var
        UserSetup: Record "User Setup";
        UserNotAllowedErr: Label 'User doesnt have permission to copy quotes to purchase orders.';
    begin
        if not UserSetup.Get(UserId()) then
            Error(UserNotAllowedErr);

        if not UserSetup."Copy Quote to Purchase Order" then
            Error(UserNotAllowedErr);
    end;

}