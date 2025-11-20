pageextension 50101 PurchaseOrderExt extends "Purchase Order"
{
    layout
    {
        addafter("Buy-from City")
        {
            field("Province"; Rec."Province")
            {
                ApplicationArea = All;
            }
        }
    }

}