tableextension 50100 ItemTableExt extends Item
{
    fields
    {
        field(50100; "Taste.Code"; Code[20])
        {
            Caption = 'Taste';
            TableRelation = Taste;
            // when validated, update the description field, if empty shows empty description
            trigger OnValidate()
            var
                TasteRec: Record Taste;
            begin
                if "Taste.Code" = '' then
                    "Taste Description" := ''  // if empty shows empty description
                else
                    if TasteRec.Get("Taste.Code") then
                        "Taste Description" := TasteRec.Description
                    else
                        "Taste Description" := ''

            end;
        }
        field(50101; "Taste Description"; Text[100])
        {
            Caption = 'Taste Description';
            Editable = false;
            DataClassification = CustomerContent;
        }
    }


}