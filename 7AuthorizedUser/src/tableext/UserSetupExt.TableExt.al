tableextension 50100 UserSetupExt extends "User Setup"
{
    fields
    {
        field(50100; "Copy Quote to Purchase Order"; Boolean)
        {
            Caption = 'Copy Quote to Purchase Order';
            ToolTip = 'Indicates whether quotes can be copied to purchase orders.';
            DataClassification = ToBeClassified;
            AllowInCustomizations = Always;
        }
    }

}