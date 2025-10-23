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
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

}