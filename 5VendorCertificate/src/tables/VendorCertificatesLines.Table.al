table 50101 VendorCertificatesLines
{
    DataClassification = ToBeClassified;
    Caption = 'Vendor Certificates Lines';

    fields
    {
        field(1; Category; Code[20])
        {
            Caption = 'Category';
            AllowInCustomizations = Always;
            ToolTip = 'Specifies the category of the certificate line.';
            TableRelation = "Item Category";
            NotBlank = true;
        }
        field(2; Subfamily; Code[20])
        {
            Caption = 'Subfamily';
            AllowInCustomizations = Always;
            TableRelation = "Item Category";
            ToolTip = 'Specifies the subfamily of the certificate line.';
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Category)
        {
        }
        fieldgroup(Brick; Category)
        {
        }
    }
}