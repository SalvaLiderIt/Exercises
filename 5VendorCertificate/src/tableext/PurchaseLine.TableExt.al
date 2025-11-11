tableextension 50102 PurchaseLine extends "Purchase Line"
{
    fields
    {
        modify(Quantity)
        {
            ToolTip = 'Specifies the quantity of the item to be purchased.';
            trigger OnAfterValidate()
            var
                VendorCertMgt: Codeunit "Vendor Certificate Mgt.";
            begin
                VendorCertMgt.CheckVendorCertification(Rec);
            end;
        }

    }
}