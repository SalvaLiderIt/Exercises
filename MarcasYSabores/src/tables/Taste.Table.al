table 50100 Taste
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
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
        }
        field(3; "Product Count"; Integer)
        {
            Caption = 'Taste Products Count';
            FieldClass = FlowField;
            CalcFormula = count(Item where("Taste.Code" = field(Code)));
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