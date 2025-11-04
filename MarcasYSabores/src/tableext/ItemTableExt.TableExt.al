tableextension 50100 ItemTableExt extends Item
{
    fields
    {
        field(50100; "Taste.Code"; Code[20])
        {
            Caption = 'Taste';
            ToolTip = 'Specifies the taste of the item.';
            TableRelation = Taste.Code;
            ValidateTableRelation = true;
            DataClassification = CustomerContent;
        }
        field(50101; "Taste Description"; Text[100])
        {
            Caption = 'Taste Description';
            ToolTip = 'Specifies the description of the taste-flavour.';
            FieldClass = FlowField;
            CalcFormula = lookup(Taste.Description where(Code = field("Taste.Code")));
            Editable = false;
        }
        field(50102; "Brand Description"; Text[100])
        {
            Caption = 'Brand Description';
            ToolTip = 'Specifies the description of the brand.';
            FieldClass = FlowField;
            CalcFormula = lookup(Brand.Description where(Code = field("Brand.Code")));
            Editable = false;
        }
        field(50103; "Brand.Code"; Code[20])
        {
            Caption = 'Brand';
            ToolTip = 'Specifies the brand of the item.';
            TableRelation = Brand.Code;
            ValidateTableRelation = true;
            DataClassification = CustomerContent;
            AllowInCustomizations = Always;
        }
    }


}