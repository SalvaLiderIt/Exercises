table 50102 CustomerActivity
{
    DataClassification = ToBeClassified;
    Caption = 'Customer Activity';
    LookupPageId = "CustomerActivityList";// esto sirve para que al pulsar ctrl+click en un campo de este tipo te lleve a la pagina de lista
    DrillDownPageId = "CustomerActivityList";

    fields
    {
        field(1; Activity; Code[20])
        {
            Caption = 'Customer Activity';
            NotBlank = true;
            Editable = true;
            ToolTip = 'Specifies the activity of the customer.';
        }
        field(2; ActivityDescription; Text[50])
        {
            Caption = 'Customer Activity Description';
            Editable = true;
            ToolTip = 'Provides a description of the customer activity.';
        }
    }

    keys
    {
        key(Key1; Activity)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Activity, ActivityDescription) { }
        fieldgroup(Brick; Activity, ActivityDescription) { }
    }

}