page 50103 "CustomerCategoryList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CustomerCategory;
    Caption = 'Customer Category List';

    layout
    {
        area(Content)
        {
            repeater(Ejercicio3)
            {
                Caption = 'Customer Category Card';
                field(Category; Rec.Category)
                {

                }
                field(CategoryDescription; Rec.CategoryDescription)
                {
                }
            }
        }
    }
}