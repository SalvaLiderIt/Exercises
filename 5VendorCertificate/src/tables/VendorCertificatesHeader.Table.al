table 50100 VendorCertificatesHeader //Cabecera Certificados proveedor
{
    DataClassification = ToBeClassified;
    Caption = 'Vendor Certificates Header';
    LookupPageId = VendorCertificatesCard;
    DrillDownPageId = VendorCertificatesCard;

    fields
    {
        field(1; CertifiedCode; Code[20])
        {
            Caption = 'Certified Code';
            AllowInCustomizations = Always;
            NotBlank = true;
            TableRelation = "No. Series";
            ToolTip = 'Specifies the code of the certificate, which is linked to a number series.';
            // todo contador secuencial. Ponerlo en configuración de compras y ventas para configurarlo
        }
        field(2; CertifiedType; Enum "CertifiedType")
        {
            Caption = 'Certified Type';
            ToolTip = 'Specifies the type of the certificate.';
            AllowInCustomizations = Always;
        }
        field(3; IssueDate; Date)
        {
            Caption = 'Issue Date';
            ToolTip = 'Specifies the date when the certificate was issued.';
            AllowInCustomizations = Always;
        }
        field(4; ExpirationDate; Date)
        {
            Caption = 'Expiration Date';
            ToolTip = 'Specifies the date when the certificate expires.';
            AllowInCustomizations = Always;
        }
        field(5; Active; Boolean)
        {
            Caption = 'Active';
            ToolTip = 'Specifies whether the certificate is currently active.';
            AllowInCustomizations = Always;
            //  todo Automático en función de las fechas. Si el rango de fechas coincide con la fecha de trabajo, marcado. Control para que solo haya 1 activo.
        }
        field(6; Attached; Blob)
        {
            Caption = 'Attached Document';
            ToolTip = 'Specifies the document attached to the certificate.';
            AllowInCustomizations = Always;
            //  todo Obligatorio adjuntarlo para poder guardar la fecha de certificado.
        }
    }


    fieldgroups
    {
        fieldgroup(Brick; CertifiedCode)
        {
        }
        fieldgroup(DropDown; CertifiedCode)
        {
        }
    }

}