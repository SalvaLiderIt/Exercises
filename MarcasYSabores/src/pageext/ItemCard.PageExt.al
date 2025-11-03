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
                ToolTip = 'Specifies Select the taste of the item.';
            }
            field("Taste Description"; Rec."Taste Description")
            {
                ApplicationArea = All;
                Caption = 'Taste Description';
                Editable = false;  // Confirmamos que no es editable
                ToolTip = 'Specifies the description of the taste-flavour.';
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

}