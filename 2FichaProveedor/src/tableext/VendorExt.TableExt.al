tableextension 50100 VendorExt extends Vendor
{
    fields
    {
        field(50102; "Supplier Type Code"; Code[20])
        {
            Caption = 'Supplier Type';
            ToolTip = 'Specifies the supplier type.';
            AllowInCustomizations = Always;
            TableRelation = "Master Table Supplier".Code where("Type" = const(Supplier));
        }
        field(50103; "Supplier Type Text"; Text[100])
        {
            Caption = 'Supplier Sector';
            ToolTip = 'Specifies the supplier sector.';
            AllowInCustomizations = Always;
            FieldClass = FlowField;
            CalcFormula = lookup("Master Table Supplier".Description where(Code = field("Supplier Type Code")));
            Editable = false;
        }
        field(50104; "Sector Code"; Code[20])
        {
            Caption = 'Sector Code';
            ToolTip = 'Specifies the sector code.';
            AllowInCustomizations = Always;
            TableRelation = "Master Table Supplier".Code where("Type" = const(Sector));
        }
        field(50105; "Sector Text"; Text[100])
        {
            Caption = 'Sector Text';
            ToolTip = 'Specifies the sector text.';
            AllowInCustomizations = Always;
            FieldClass = FlowField;
            CalcFormula = lookup("Master Table Supplier".Sector where(Code = field("Sector Code")));
            Editable = false;
        }
        field(50106; "Activity Code"; Code[20])
        {
            Caption = 'Activity Code';
            ToolTip = 'Specifies the activity code.';
            AllowInCustomizations = Always;
            TableRelation = "Master Table Supplier".Code where("Type" = const(Activity));
        }
        field(50107; "Activity Text"; Text[100])
        {
            Caption = 'Activity Text';
            ToolTip = 'Specifies the activity text.';
            AllowInCustomizations = Always;
            FieldClass = FlowField;
            CalcFormula = lookup("Master Table Supplier".Activity where(Code = field("Activity Code")));
            Editable = false;
        }
        field(50108; "Chain Custody Subject"; Boolean)
        {
            Caption = 'Chain Custody Subject';
            ToolTip = 'Indicates whether the vendor is subject to chain of custody requirements.';
            AllowInCustomizations = Always;
        }
        field(50109; "Certification"; Enum "Vendor Certification")
        {
            Caption = 'Certification';
            ToolTip = 'Specifies the vendor certification.';
            AllowInCustomizations = Always;
        }
        field(50110; "Homologated"; Boolean)
        {
            Caption = 'Homologated';
            ToolTip = 'Indicates whether the vendor is homologated.';
            AllowInCustomizations = Always;
        }
    }
}