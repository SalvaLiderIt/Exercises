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
        field(50101; Province; Text[100])
        {
            Caption = 'Province';
            ToolTip = 'Province of the company address.';
            DataClassification = ToBeClassified;
            AllowInCustomizations = Always;
        }
        field(50102; PhoneNo2; Text[30])
        {
            Caption = 'Phone 2';
            ToolTip = 'Secondary phone number for the company.';
            DataClassification = ToBeClassified;
            AllowInCustomizations = Always;
        }
    }

}