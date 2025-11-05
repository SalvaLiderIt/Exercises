page 50100 "CustomerTypeList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CustomerType;
    Caption = 'Customer Type List';

    layout
    {
        area(Content)
        {
            repeater(Ejercicio3)
            {
                Caption = 'Customer Type Card';
                field(CustomerType; Rec.CustomerType)
                {

                }
                field(CustomerDescription; Rec.CustomerDescription)
                {
                }
            }
        }
    }
}