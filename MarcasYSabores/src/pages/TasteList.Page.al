page 50100 TasteList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Taste;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'Code of the taste.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Taste Description';
                    ToolTip = 'Description of the taste.';
                }
                field("Product Count Display"; Rec.GetProductCountDisplay())
                {
                    ApplicationArea = All;
                    Caption = 'Taste Products';
                    ToolTip = 'View products with this flavor';

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