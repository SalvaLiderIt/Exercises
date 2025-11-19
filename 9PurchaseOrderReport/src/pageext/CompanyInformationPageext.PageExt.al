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
        }
    }

}