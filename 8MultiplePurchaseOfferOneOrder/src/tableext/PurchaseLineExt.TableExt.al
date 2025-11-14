tableextension 50100 "Purchase LineExt" extends "Purchase Line"
{
    fields
    {
        field(50100; SelectLines; Boolean)
        {
            Caption = 'Select Lines';
            DataClassification = ToBeClassified;
            AllowInCustomizations = Always;
            ToolTip = 'Indicates whether the purchase line is selected.';
        }
    }

}