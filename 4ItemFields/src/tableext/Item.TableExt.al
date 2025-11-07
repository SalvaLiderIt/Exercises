tableextension 50100 Item extends Item
{
    fields
    {
        modify("Item Category Code")//when i need to change a field in the base table i can use the modify keyword.
        {
            ToolTip = 'Specifies the category code of the item.';
            TableRelation = "Item Category" where("Clasification" = const(Family));
        }
        // info fields for General group
        field(50100; Subfamily; Code[20])
        {
            Caption = 'Subfamily Code';
            ToolTip = 'Specifies the subfamily code for the item.';
            AllowInCustomizations = Always;
            TableRelation = "Item Category" where("Clasification" = const(Subfamily));
        }
        field(50101; CustodyChain; Boolean)
        {
            Caption = 'Custody Chain';
            ToolTip = 'Indicates whether the item requires custody chain tracking.';
            AllowInCustomizations = Always;
            // todo si está marcado obligatorio informar de calidad (siguiente campo)
        }
        field(50102; Quality; Code[20])
        {
            Caption = 'Quality Code';
            ToolTip = 'Specifies the quality code for the item.';
            AllowInCustomizations = Always;
            TableRelation = "Qualities";
            // todo CREAR TABLA QUALITIES y Editable si Cadena de custodia está marcado
        }
        field(50103; Veta; Enum VetaEnum)
        {
            Caption = 'Veta';
            ToolTip = 'Specifies the veta option for the item.';
            AllowInCustomizations = Always;
        }
        field(50104; IdArdis; Text[100])
        {
            Caption = 'Ardis ID';
            ToolTip = 'Specifies the Ardis identification for the item.';
            AllowInCustomizations = Always;
            //  todo  Para la integración. Solo los que tengan informado este campo serán los que se integrarán
        }
        field(50105; ArdisCategory; Text[255])
        {
            Caption = 'Ardis Category';
            ToolTip = 'Specifies the Ardis category for the item.';
            AllowInCustomizations = Always;
            //  todo  Para la integración
        }
        field(50106; Beta; Enum BetaEnum)
        {
            Caption = 'Beta';
            ToolTip = 'Specifies the beta option for the item.';
            AllowInCustomizations = Always;
            // todo crear enum BetaEnum con valores: blanco (vacio posiblemente?), largo, ancho
        }
        field(50107; TextureRoute; Text[255])
        {
            Caption = 'Texture Route';
            ToolTip = 'Specifies the texture route for the item.';
            AllowInCustomizations = Always;
        }


        // info fields for inventory group
        field(50108; Width; Integer)
        {
            Caption = 'Width';
            ToolTip = 'Specifies the width of the item in centimeters.';
            AllowInCustomizations = Always;

            trigger OnValidate()
            begin
                CalculateValues();
            end;
        }
        field(50109; Length; Integer)
        {
            Caption = 'Length';
            ToolTip = 'Specifies the length of the item in centimeters.';
            AllowInCustomizations = Always;

            trigger OnValidate()
            begin
                CalculateValues();
            end;
        }
        field(50110; Thickness; Integer)
        {
            Caption = 'Thickness';
            ToolTip = 'Specifies the thickness of the item in millimeters.';
            AllowInCustomizations = Always;

            trigger OnValidate()
            begin
                CalculateValues();
            end;
        }
        field(50111; SurfaceArea; Decimal)
        {
            Caption = 'Surface Area';
            ToolTip = 'Specifies the surface area of the item in square meters.';
            AllowInCustomizations = Always;
            Editable = false;
        }
        field(50112; Density; Decimal)
        {
            Caption = 'Density';
            ToolTip = 'Specifies the density of the item in kg/m3.';
            AllowInCustomizations = Always;
        }
        field(50113; Volumen; Decimal)
        {
            Caption = 'Volume';
            ToolTip = 'Specifies the volume of the item in cubic meters.';
            AllowInCustomizations = Always;
            Editable = false;
        }
        field(50114; PlaneNumber; Text[100])
        {
            Caption = 'Plane Number';
            ToolTip = 'Specifies the plane number associated with the item.';
            AllowInCustomizations = Always;
        }
        field(50115; OnDeposit; Boolean)
        {
            Caption = 'On Deposit';
            ToolTip = 'Indicates whether the item is on deposit.';
            AllowInCustomizations = Always;
            //  todo para el cálculo de inventario fisico
        }

        //  info fields for "Cost & Posting" group
        field(50116; LastPurchasePrice; Decimal)
        {
            Caption = 'Last Purchase Price';
            ToolTip = 'Specifies the last purchase price of the item.';
            AllowInCustomizations = Always;
            //  todo campo calculado que se actualiza con el ultimo precio de compra
        }
        field(50117; MarginPercentaje; Decimal)
        {
            Caption = '% Margin';
            ToolTip = 'Specifies the percentage margin for the item.';
            AllowInCustomizations = Always;
            //  todo En función del % aplicado al último precio de compra de un producto, se debe restringir el precio de venta para que no se venda por menos de ese precio.

        }
    }
    local procedure CalculateValues()
    begin
        // Calcular superficie (solo si Width y Length tienen valor)
        if (Width <> 0) and (Length <> 0) then
            SurfaceArea := (Width * Length) / 1000000
        else
            SurfaceArea := 0;

        // Calcular volumen (solo si los 3 tienen valor)
        if (Width <> 0) and (Length <> 0) and (Thickness <> 0) then
            Volumen := (Width * Length * Thickness) / 1000000000
        else
            Volumen := 0;
    end;


}