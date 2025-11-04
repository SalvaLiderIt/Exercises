table 50100 "Master Table Supplier"
{
    DataClassification = ToBeClassified;
    Caption = 'Master Table Supplier';
    DrillDownPageId = MasterTableSupplier;
    LookupPageId = MasterTableSupplier;

    fields
    {
        field(1; Type; Enum "Master Table Supplier Type")
        {
            Caption = 'Type';
            ToolTip = 'Specifies the type.';

        }
        field(2; Code; Code[20])
        {
            Caption = 'Code';
            ToolTip = 'Specifies the code.';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the description.';
        }
        field(4; Sector; Code[20])
        {
            Caption = 'Sector';
            ToolTip = 'Specifies the sector.';
        }
        field(5; Activity; Code[20])
        {
            Caption = 'Activity';
            ToolTip = 'Specifies the activity.';
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Code)
        { }
        fieldgroup(Brick; Code)
        { }
    }



}