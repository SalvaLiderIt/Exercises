page 50102 VendorCertificatesLines //Líneas Certificado Proveedor
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = VendorCertificatesLines;
    Caption = 'Vendor Certificates Lines';

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(Category; Rec.Category)
                {

                }
                field(Subfamily; Rec.Subfamily)
                {

                }
            }
        }
    }

}