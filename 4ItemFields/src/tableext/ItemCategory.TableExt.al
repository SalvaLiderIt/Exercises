tableextension 50101 ItemCategory extends "Item Category"
{
    fields
    {
        field(50100; Clasification; Enum ClasificationEnum)
        {
            Caption = 'Clasification';
            AllowInCustomizations = Always;
            ToolTip = 'Specifies the classification of the item category.';
        }
    }

}