codeunit 50100 "Vendor Certificate Mgt."
{
    Permissions = tabledata "Purchase Header" = r,
                  tabledata Vendor = r,
                  tabledata VendorCertificatesHeader = r;

    procedure CheckVendorCertification(PurchaseLine: Record "Purchase Line")
    var
        PurchaseHeader: Record "Purchase Header";
        Vendor: Record Vendor;
        VendorCert: Record VendorCertificatesHeader;
    begin
        // Paso 1: Verificar que sea tipo Item (Artículo)
        if PurchaseLine.Type <> PurchaseLine.Type::Item then
            exit;

        // Paso 2: Obtener la cabecera del pedido para sacar el proveedor
        if not PurchaseHeader.Get(PurchaseLine."Document Type", PurchaseLine."Document No.") then
            exit;

        // Paso 3: Obtener el proveedor
        if not Vendor.Get(PurchaseHeader."Buy-from Vendor No.") then
            exit;

        // Paso 4: Verificar si el proveedor está homologado
        if not Vendor.Homologated then
            exit;

        // Paso 5: Buscar certificados del proveedor que estén caducados
        VendorCert.SetRange("Vendor No.", Vendor."No.");
        VendorCert.SetFilter(ExpirationDate, '<%1', PurchaseHeader."Order Date");
        if not VendorCert.IsEmpty() then
            Message('El certificado del proveedor homologado está caducado');
    end;
}