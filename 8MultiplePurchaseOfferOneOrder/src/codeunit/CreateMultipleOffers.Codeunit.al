codeunit 50100 CreateMultipleOffers
{
    Permissions =
        tabledata "Purchase Header" = RIMD,
        tabledata "Purchase Line" = RIMD;
    trigger OnRun()
    begin

    end;

    procedure CreateOorderFromSelectedLines()
    var
        PurchaseLine: Record "Purchase Line";
        PurchaseHeader: Record "Purchase Header";
        NewPurchaseHeader: Record "Purchase Header";
        NewPurchaseLine: Record "Purchase Line";
        VendorNo: Code[20];
        LineCount: Integer;
        FirstDocumentNo: Code[20];
    begin
        // Filtrar solo las líneas seleccionadas
        PurchaseLine.SetRange(SelectLines, true);
        PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Quote);

        // Validar que hay líneas seleccionadas
        if not PurchaseLine.FindSet() then
            Error('No lines selected. Please select at least one line.');

        // Contar líneas y obtener el proveedor
        LineCount := (PurchaseLine.Count());
        VendorNo := PurchaseLine."Buy-from Vendor No.";
        FirstDocumentNo := PurchaseLine."Document No.";

        // Validar que todas las líneas seleccionadas sean del mismo proveedor
        PurchaseLine.Reset();
        PurchaseLine.SetRange(SelectLines, true);
        PurchaseLine.SetFilter("Buy-from Vendor No.", '<>%1', VendorNo);
        if not PurchaseLine.IsEmpty() then
            Error('All selected lines must be from the same vendor.');

        // Obtener la cabecera de la primera oferta para copiar datos
        if PurchaseHeader.Get(PurchaseHeader."Document Type"::Quote, FirstDocumentNo) then begin

            // Crear la nueva cabecera del pedido
            NewPurchaseHeader.Init();
            NewPurchaseHeader."Document Type" := NewPurchaseHeader."Document Type"::Order;
            NewPurchaseHeader.Insert(true);  // true = asignar número automáticamente

            // Validar el proveedor (esto rellena automáticamente muchos campos)
            NewPurchaseHeader.Validate("Buy-from Vendor No.", VendorNo);

            // Copiar otros campos relevantes (opcional)
            NewPurchaseHeader."Posting Date" := WorkDate();
            NewPurchaseHeader."Order Date" := WorkDate();

            NewPurchaseHeader.Modify(true);
        end;

        // Resetear filtros y obtener líneas seleccionadas
        PurchaseLine.Reset();
        PurchaseLine.SetRange(SelectLines, true);
        PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Quote);

        if PurchaseLine.FindSet() then
            repeat
                // Crear nueva línea en el pedido
                NewPurchaseLine.Init();
                NewPurchaseLine."Document Type" := NewPurchaseHeader."Document Type";
                NewPurchaseLine."Document No." := NewPurchaseHeader."No.";
                NewPurchaseLine."Line No." := NewPurchaseLine."Line No." + 10000;
                NewPurchaseLine.Insert(true);

                // Copiar campos principales
                NewPurchaseLine.Validate(Type, PurchaseLine.Type);
                NewPurchaseLine.Validate("No.", PurchaseLine."No.");
                NewPurchaseLine.Validate(Quantity, PurchaseLine.Quantity);
                NewPurchaseLine.Validate("Direct Unit Cost", PurchaseLine."Direct Unit Cost");

                // Copiar otros campos relevantes
                NewPurchaseLine.Description := PurchaseLine.Description;
                NewPurchaseLine."Description 2" := PurchaseLine."Description 2";
                NewPurchaseLine."Unit of Measure Code" := PurchaseLine."Unit of Measure Code";
                NewPurchaseLine."Location Code" := PurchaseLine."Location Code";

                NewPurchaseLine.Modify(true);

            until PurchaseLine.Next() = 0;

        // info : Descomentar para eliminar las líneas originales después de crear el pedido
        /* {
        PurchaseLine.Reset();
        PurchaseLine.SetRange(SelectLines, true);
        if PurchaseLine.FindSet() then
            repeat
                PurchaseLine.Delete(true);
            until PurchaseLine.Next() = 0;
        } */

        // Mensaje de confirmación
        Message('Purchase Order %1 created successfully with %2 lines.', NewPurchaseHeader."No.", LineCount);

        // Abrir el pedido recién creado
        Page.Run(Page::"Purchase Order", NewPurchaseHeader);
    end;


}