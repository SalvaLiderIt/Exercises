tableextension 50101 PurchaseHeaderExt extends "Purchase Header"
{
    fields
    {
        field(50100; "Province"; Text[50])
        {
            Caption = 'Province';
            ToolTip = 'Province of the purchase header address.';
            DataClassification = ToBeClassified;
            AllowInCustomizations = Always;
        }
    }
}