pageextension 50101 ItemCategories extends "Item Categories"
{
    layout
    {
        addbefore(Code)
        {
            field(Clasification; Rec.Clasification)
            {
                ApplicationArea = All;
                Caption = 'Clasification';
            }
        }
    }

}