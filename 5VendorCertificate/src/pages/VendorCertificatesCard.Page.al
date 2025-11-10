page 50100 VendorCertificatesCard //Ficha Certificado Proveedor
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = VendorCertificatesHeader;
    Caption = 'Vendor Certificates';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'Vendor Certificates Header';
                field(CertifiedCode; Rec.CertifiedCode)
                {

                }
                field(CertifiedType; Rec.CertifiedType)
                {
                }
                field(IssueDate; Rec.IssueDate)
                {
                }
                field(ExpirationDate; Rec.ExpirationDate)
                {
                }
                field(Active; Rec.Active)
                {
                }
                field(Attached; Rec.Attached)
                {
                }
            }
        }
    }

}