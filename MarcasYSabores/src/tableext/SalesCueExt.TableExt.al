tableextension 50101 SalesCueExt extends "Sales Cue"
{
    fields
    {
        field(50100; "Blocked Brands"; Integer)
        {
            Caption = 'Blocked Brands';
            ToolTip = 'Specifies the blocked brands of the sales cue.';
            AllowInCustomizations = Always;
            Editable = false;
            Access = Public;

            FieldClass = FlowField;
            CalcFormula = count(Brand where("Blocked" = const(true)));


        }

    }


    procedure BlockedBrandsStyle(): Text[20]
    begin
        CalcFields("Blocked Brands");
        if "Blocked Brands" = 0 then
            exit(Format(PageStyle::Favorable))//verde
        else
            if "Blocked Brands" <= 5 then
                exit(Format(PageStyle::Ambiguous))//amarillo
            else
                exit(Format(PageStyle::Unfavorable));//rojo
    end;

}