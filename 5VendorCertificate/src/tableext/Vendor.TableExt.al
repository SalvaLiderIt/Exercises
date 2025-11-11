tableextension 50101 Vendor extends Vendor
{
    fields
    {
        field(50100; Homologated; Boolean)
        {
            Caption = 'Homologated';
            ToolTip = 'Indicates whether the vendor is homologated.';
            DataClassification = ToBeClassified;
            AllowInCustomizations = Always;
        }
    }

}