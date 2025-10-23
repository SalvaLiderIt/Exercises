tableextension 50100 ItemTableExt extends Item
{
    fields
    {
        field(50100; "Taste"; Code[20])
        {
            Caption = 'Taste';
            TableRelation = Taste;  // this will show all the dropdown values from the Taste table
        }
    }


}