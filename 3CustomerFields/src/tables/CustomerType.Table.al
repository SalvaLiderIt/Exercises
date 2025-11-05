table 50100 CustomerType
{
    DataClassification = ToBeClassified;
    Caption = 'Customer Type';
    LookupPageId = "CustomerTypeList";// esto sirve para que al pulsar ctrl+click en un campo de este tipo te lleve a la pagina de lista
    DrillDownPageId = "CustomerTypeList";

    fields
    {
        field(1; CustomerType; Code[20])
        {
            Caption = 'Customer Type';
            NotBlank = true;
            Editable = true;
            ToolTip = 'Specifies the type of customer.';
        }
        field(2; CustomerDescription; Text[50])
        {
            Caption = 'Customer Description';
            Editable = true;
            ToolTip = 'Provides a description of the customer type.';
        }
    }

    keys
    {
        key(Key1; CustomerType)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; CustomerType, CustomerDescription) { }
        fieldgroup(Brick; CustomerType, CustomerDescription) { }
    }

}