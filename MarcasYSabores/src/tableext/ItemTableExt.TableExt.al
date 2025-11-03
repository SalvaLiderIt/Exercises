tableextension 50100 ItemTableExt extends Item
{
    fields
    {
        field(50100; "Taste.Code"; Code[20])
        {
            Caption = 'Taste';
            ToolTip = 'Specifies the taste of the item.';
            TableRelation = Taste;
            // when validated, update the description field, if empty shows empty description
            trigger OnValidate()
            var
                TasteRec: Record Taste;
            begin
                if "Taste.Code" = '' then
                    "Taste Description" := ''  // if empty shows empty description
                else begin
                    TasteRec.SetLoadFields(Description);
                    if TasteRec.Get("Taste.Code") then
                        "Taste Description" := TasteRec.Description
                    else
                        "Taste Description" := '';
                end;

            end;
        }
        field(50101; "Taste Description"; Text[100])
        {
            Caption = 'Taste Description';
            ToolTip = 'Specifies the description of the taste-flavour.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50102; "Brand Description"; Text[100])
        {
            Caption = 'Brand Description';
            ToolTip = 'Specifies the description of the brand.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50103; "Brand.Code"; Code[20])
        {
            Caption = 'Brand';
            ToolTip = 'Specifies the brand of the item.';
            DataClassification = CustomerContent;
            AllowInCustomizations = Always;
            TableRelation = Brand;//linea importante para relacionar con la tabla brand y que muestre las opciones en menu desplegable
            trigger OnValidate()
            var
                BrandRec: Record Brand;
            begin
                if "Brand.Code" = '' then
                    "Brand Description" := ''  // if empty shows empty description
                else begin
                    BrandRec.SetLoadFields(Description);
                    if BrandRec.Get("Brand.Code") then
                        "Brand Description" := BrandRec.Description
                    else
                        "Brand Description" := '';
                end;

            end;
        }
    }


}