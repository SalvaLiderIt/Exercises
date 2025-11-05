table 50101 CustomerSector
{
    DataClassification = ToBeClassified;
    Caption = 'Customer Sector';
    LookupPageId = "CustomerSectorList";// esto sirve para que al pulsar ctrl+click en un campo de este tipo te lleve a la pagina de lista
    DrillDownPageId = "CustomerSectorList";

    fields
    {
        field(1; Sector; Code[20])
        {
            Caption = 'Customer Sector';
            NotBlank = true;
            Editable = true;
            ToolTip = 'Specifies the sector of the customer.';
        }
        field(2; SectorDescription; Text[50])
        {
            Caption = 'Customer Sector Description';
            Editable = true;
            ToolTip = 'Provides a description of the customer sector.';
        }
    }

    keys
    {
        key(Key1; Sector)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Sector, SectorDescription) { }
        fieldgroup(Brick; Sector, SectorDescription) { }
    }

}