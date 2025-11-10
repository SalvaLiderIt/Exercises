tableextension 50100 PurchasesSetup extends "Purchases & Payables Setup"
{
    fields
    {
        field(50100; "Vendor Certificate Nos."; Code[20])
        {
            Caption = 'Vendor Certificate Nos.';
            DataClassification = CustomerContent;
            Description = 'Specifies the certificate numbers associated with vendors for tax and compliance purposes.';
            ToolTip = 'Specifies the number series for vendor certificates.';
            AllowInCustomizations = Always;
            TableRelation = "No. Series";
        }
    }

}