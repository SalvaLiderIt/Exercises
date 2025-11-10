pageextension 50102 PurchasesPayablesSetup extends "Purchases & Payables Setup"
{
    layout
    {
        addlast(General)  // o addafter de algún campo existente
        {
            field("Vendor Certificate Nos."; Rec."Vendor Certificate Nos.")
            {
                ApplicationArea = All;
            }
        }
    }

}