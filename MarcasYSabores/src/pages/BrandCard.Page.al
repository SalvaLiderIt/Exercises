page 50103 "Brand Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Brand;
    Caption = 'Brand Card';

    layout
    {
        area(Content)
        {
            group(BrandCard)
            {
                Caption = 'Brand Card';
                field(Code; Rec.Code)
                {

                }

                field(Description; Rec.Description)
                {

                }

                field("Brand Products"; Rec."Product Count")
                {

                }

                field(Blocked; Rec.Blocked)
                {

                }

                field("Blockage Expiration"; Rec."Blockage Expiration")
                {

                }
            }
        }
    }

    actions
    {

    }

}