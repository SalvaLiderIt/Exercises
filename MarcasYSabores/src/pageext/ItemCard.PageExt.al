pageextension 50100 ItemCard extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("Taste"; Rec."Taste.Code")
            {
                ApplicationArea = All;
                Caption = 'Taste';
                ToolTip = 'Select the taste of the item';
            }
            field("Taste Description"; Rec."Taste Description")
            {
                ApplicationArea = All;
                Caption = 'Taste Description';
                Editable = false;  // Confirmamos que no es editable
                ToolTip = 'Description of the taste-Flavour';
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

}