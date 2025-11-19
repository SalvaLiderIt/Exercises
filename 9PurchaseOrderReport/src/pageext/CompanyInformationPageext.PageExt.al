pageextension 50100 CompanyInformationPageext extends "Company Information"
{
    layout
    {
        addafter(Name)
        {
            field(Name2; Rec.Name2)
            {
                ApplicationArea = All;
            }
            field(Province; Rec.Province)
            {
                ApplicationArea = All;
            }
            field(PhoneNo2; Rec.PhoneNo2)
            {
                ApplicationArea = All;
            }

        }
    }

}