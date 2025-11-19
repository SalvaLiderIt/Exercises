tableextension 50100 CompanyInformationTableExt extends "Company Information"
{
    fields
    {
        field(50100; Name2; Text[50])
        {
            Caption = 'Name2';
            ToolTip = 'Additional company name field.';
            DataClassification = ToBeClassified;
        }
    }

}