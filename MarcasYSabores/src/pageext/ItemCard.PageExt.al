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
        addafter(Functions)
        {
            action(TasteList)
            {
                ApplicationArea = All;
                Caption = 'Ver Taste List';
                Image = List;
                ToolTip = 'Opens the Taste List page.';
                // Estas dos líneas me permiten mostrar el botón en la barra de acciones principal
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                begin
                    // Abre la página Taste List
                    PAGE.Run(PAGE::"Taste List");
                end;
            }
        }
    }

}