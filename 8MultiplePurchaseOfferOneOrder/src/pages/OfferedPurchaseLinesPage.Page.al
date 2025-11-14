page 50100 OfferedPurchaseLinesPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Purchase Line";
    Caption = 'Offered Purchase Lines';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(SelectLines; Rec.SelectLines)
                {
                    Caption = 'Select Lines';
                    ToolTip = 'Specifies select the purchase line.';
                }
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the type of the purchase line.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the purchase line number.';
                }
                field("Item Reference No."; Rec."Item Reference No.")
                {
                    ToolTip = 'Specifies the item reference number for the purchase line.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the description of the purchase line.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the quantity of the purchase line.';
                }


            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("CreatePurchaseOrder")
            {
                Caption = 'Create Purchase Order';
                ApplicationArea = All;
                Image = NewOrder;
                Promoted = true;
                PromotedCategory = Process;// esta linea me permite poner el botón a la derecha de "Delete"
                PromotedOnly = true;

                ToolTip = 'Creates a single purchase order from the selected quote lines.';
                trigger OnAction()
                var
                    CreateOrderMgt: Codeunit "CreateMultipleOffers";//puede que el nombre no sea 100% correcto pero es como lo entiendo de momento
                begin
                    CreateOrderMgt.CreateOorderFromSelectedLines();//este es mi procedimiento
                end;

            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange("Document Type", Rec."Document Type"::Quote);
    end;


}