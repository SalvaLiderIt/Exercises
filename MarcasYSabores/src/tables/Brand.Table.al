table 50102 Brand
{
    DataClassification = ToBeClassified;
    Caption = 'Brand';
    LookupPageId = "Brand List";
    DrillDownPageId = "Brand List";


    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
            ToolTip = 'Specifies Code of the brand.';
            NotBlank = true;
            // add a trigger to convert to uppercase when the value is validated
            trigger OnValidate()
            begin
                Code := UpperCase(Code);  // Convierte automáticamente a mayúsculas
            end;

        }
        field(2; Description; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
            ToolTip = 'Description of the brand.';
        }
        field(3; "Product Count"; Integer)
        {
            Caption = 'Brand Products Count';
            ToolTip = 'Specifies Number of products with this brand.';
            FieldClass = FlowField;
            AllowInCustomizations = Always;
            CalcFormula = count(Item where("Brand.Code" = field(Code)));
            Editable = false;
        }
        field(4; "Blocked"; Boolean)
        {
            Caption = 'Block';
            ToolTip = 'Specifies whether the brand is blocked.';
            AllowInCustomizations = Always;
            Editable = true;
            trigger OnValidate()
            begin
                if Blocked then
                    "Blockage Expiration" := CalcDate('<CM>', Today()) //CM = current month end last day
                else
                    "Blockage Expiration" := 0D; // Si desbloqueas, borra la fecha
            end;
        }
        field(5; "Blockage Expiration"; Date)
        {
            Caption = 'Blockage Expiration';
            ToolTip = 'Specifies the expiration date of the blockage.';
            Editable = false;
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
    //visual effects
    fieldgroups
    {
        fieldgroup(DropDown; Code, Description) { }
        fieldgroup(Brick; Code, Description) { }
    }

    procedure GetProductCountDisplay(): Text[10]
    begin
        CalcFields("Product Count");
        if "Product Count" = 0 then
            exit('-')
        else
            exit(Format("Product Count"));
    end;
}