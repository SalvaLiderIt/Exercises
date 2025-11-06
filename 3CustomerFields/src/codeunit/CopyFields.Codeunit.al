codeunit 50100 CopyFields
{
    Permissions =
        tabledata Customer = RIMD,
        tabledata "Sales Header" = RIMD;
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", "OnAfterValidateEvent", "Sell-to Customer No.", false, false)]
    local procedure OnAfterValidateSellToCustomerNo(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        if Customer.Get(Rec."Sell-to Customer No.") then begin
            Rec.SalesZone := Customer.SalesZone;
            Rec.Route := Customer.Route;
            Rec.TransportAgency := Customer.TransportAgency;
        end;
    end;
}