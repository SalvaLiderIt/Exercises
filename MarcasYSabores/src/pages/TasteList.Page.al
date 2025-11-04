page 50100 "Taste List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Taste;
    CardPageId = "Taste Card"; //supuestamente eso permite abrir directamente la card desde la lista
    Caption = 'Taste List';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {

                    Caption = 'Code';
                    ToolTip = 'Specifies Code of the taste.';
                }
                field(Description; Rec.Description)
                {

                    Caption = 'Taste Description';
                    ToolTip = 'Specifies Description of the taste.';
                }
                field("Product Count Display"; Rec.GetProductCountDisplay())
                {
                    Caption = 'Taste Products';
                    ToolTip = 'Specifies View products with this flavor.';

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Item.SetRange("Taste.Code", Rec.Code);
                        Page.Run(Page::"Item List", Item);
                    end;
                }
            }
        }
    }
}