page 50102 "CustomerActivityList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CustomerActivity;
    Caption = 'Customer Activity List';

    layout
    {
        area(Content)
        {
            repeater(Ejercicio3)
            {
                Caption = 'Customer Activity Card';
                field(Activity; Rec.Activity)
                {

                }
                field(ActivityDescription; Rec.ActivityDescription)
                {
                }
            }
        }
    }
}