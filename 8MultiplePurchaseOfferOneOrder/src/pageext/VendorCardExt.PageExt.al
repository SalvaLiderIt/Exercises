pageextension 50100 VendorCardExt extends "Vendor Card"
{
    actions
    {
        addlast("Ven&dor")
        {
            action("OfferedPurchaseLines")
            {
                Caption = 'Offered Purchase Lines';
                ApplicationArea = All;
                Image = Purchase;
                Promoted = true;
                PromotedCategory = Category9;//categoria para que aparezca el boton dentro del apartado de vendor
                PromotedIsBig = true;
                ToolTip = 'Manage offered purchase lines.';
                trigger OnAction()

                var
                    PurchaseLine: Record "Purchase Line";
                begin
                    // Filtras las líneas por el proveedor actual y tipo Quote
                    PurchaseLine.SetRange("Buy-from Vendor No.", Rec."No.");
                    PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Quote);

                    // Abres la página CON el filtro aplicado
                    PAGE.Run(PAGE::OfferedPurchaseLinesPage, PurchaseLine);
                end;

            }
        }
    }

}