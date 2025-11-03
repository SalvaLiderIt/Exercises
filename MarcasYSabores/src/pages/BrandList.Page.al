page 50102 "Brand List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Brand;
    Caption = 'Brand List';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {

                    Caption = 'Code';
                }
                field(Description; Rec.Description)
                {

                    Caption = 'Brand Description';
                    ToolTip = 'Specifies Description of the brand.';
                }
                field("Product Count Display"; Rec.GetProductCountDisplay())
                {
                    Caption = 'Brand Products';
                    ToolTip = 'Specifies View products with this brand.';

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Item.SetRange("Brand.Code", Rec.Code);//CORREGIR
                        Page.Run(Page::"Item List", Item);//CORREGIR
                    end;
                }
            }
        }
    }
}