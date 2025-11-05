table 50103 CustomerCategory
{
    DataClassification = ToBeClassified;
    Caption = 'Customer Category';
    LookupPageId = "CustomerCategoryList";// esto sirve para que al pulsar ctrl+click en un campo de este tipo te lleve a la pagina de lista
    DrillDownPageId = "CustomerCategoryList";

    fields
    {
        field(1; Category; Code[20])
        {
            Caption = 'Customer Category';
            NotBlank = true;
            Editable = true;
            ToolTip = 'Specifies the category of the customer.';
        }
        field(2; CategoryDescription; Text[50])
        {
            Caption = 'Customer Category Description';
            Editable = true;
            ToolTip = 'Provides a description of the customer category.';
        }
    }

    keys
    {
        key(Key1; Category)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Category, CategoryDescription) { }
        fieldgroup(Brick; Category, CategoryDescription) { }
    }

}