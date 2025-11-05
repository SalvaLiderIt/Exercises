page 50101 "CustomerSectorList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CustomerSector;
    Caption = 'Customer Sector List';

    layout
    {
        area(Content)
        {
            repeater(Ejercicio3)
            {
                Caption = 'Customer Sector Card';
                field(Sector; Rec.Sector)
                {

                }
                field(SectorDescription; Rec.SectorDescription)
                {
                }
            }
        }
    }
}