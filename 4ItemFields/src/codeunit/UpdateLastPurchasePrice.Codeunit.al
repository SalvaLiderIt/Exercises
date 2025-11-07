codeunit 50100 UpdateLastPurchasePrice
{
    Permissions = tabledata Item = RIMD;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", "OnAfterPurchInvLineInsert", '', false, false)]
    local procedure OnAfterPurchInvLineInsert(var PurchInvLine: Record "Purch. Inv. Line"; PurchLine: Record "Purchase Line")
    var
        Item: Record Item;
    begin
        // Solo procesar si es un item
        if PurchLine.Type <> PurchLine.Type::Item then
            exit;

        // Buscar el item
        if not Item.Get(PurchLine."No.") then
            exit;

        // Actualizar último precio de compra
        Item.LastPurchasePrice := PurchLine."Direct Unit Cost";
        Item.Modify(false);
    end;
}