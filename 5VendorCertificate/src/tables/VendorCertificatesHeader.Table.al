table 50100 VendorCertificatesHeader //Cabecera Certificados proveedor
{
    DataClassification = ToBeClassified;
    Caption = 'Vendor Certificates Header';
    LookupPageId = VendorCertificatesCard;
    DrillDownPageId = VendorCertificatesCard;
    Permissions = tabledata "Purchases & Payables Setup" = RIMD,
    tabledata "VendorCertificatesHeader" = RIMD;

    fields
    {
        field(1; CertifiedCode; Code[20])
        {
            Caption = 'Certified Code';
            AllowInCustomizations = Always;
            TableRelation = "No. Series";
            ToolTip = 'Specifies the code of the certificate, which is linked to a number series.';
        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            AllowInCustomizations = Always;
            Editable = false;
            TableRelation = "No. Series";
            ToolTip = 'Specifies the number series associated with the certificate code.';
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

            trigger OnValidate()
            begin
                UpdateActiveStatus();
            end;
        }
        field(4; ExpirationDate; Date)
        {
            Caption = 'Expiration Date';
            ToolTip = 'Specifies the date when the certificate expires.';
            AllowInCustomizations = Always;

            trigger OnValidate()
            begin
                UpdateActiveStatus();
            end;
        }
        field(5; Active; Boolean)
        {
            Caption = 'Active';
            ToolTip = 'Specifies whether the certificate is currently active.';
            AllowInCustomizations = Always;
            Editable = false;
        }
        field(6; Attached; Blob)
        {
            Caption = 'Attached Document';
            ToolTip = 'Specifies the document attached to the certificate.';
            AllowInCustomizations = Always;
            //  todo Obligatorio adjuntarlo para poder guardar la fecha de certificado.
        }
    }
    keys
    {
        key(PK; CertifiedCode)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; CertifiedCode, CertifiedType, IssueDate, ExpirationDate, Active)
        {
        }
        fieldgroup(Brick; CertifiedCode, CertifiedType, IssueDate, ExpirationDate, Active)
        {
        }
    }

    // contador secuencial, demasiado complejo y falta de información por parte del documento funcional
    trigger OnInsert()
    var
        PurchasesSetup: Record "Purchases & Payables Setup";
        NoSeries: Codeunit "No. Series";
        MyErrorInfo: ErrorInfo;
    begin
        if CertifiedCode = '' then begin
            if not PurchasesSetup.Get() then
                Message('Purchases & Payables Setup has not been configured.');
            PurchasesSetup.TestField("Vendor Certificate Nos.");
            CertifiedCode := NoSeries.GetNextNo(PurchasesSetup."Vendor Certificate Nos.");
            "No. Series" := PurchasesSetup."Vendor Certificate Nos.";
        end;
        UpdateActiveStatus();

        if not Attached.HasValue() then begin
            MyErrorInfo := ErrorInfo.Create('Attached Document is required when inserting a new Vendor Certificate.');
            Error(MyErrorInfo);
        end;
    end;

    local procedure UpdateActiveStatus()
    var
        VendorCert: Record VendorCertificatesHeader;
    begin
        // Calcular si este certificado está activo según las fechas 
        if (IssueDate <= WorkDate()) and (ExpirationDate >= WorkDate()) then
            Active := true
        else
            Active := false;

        // Si se marca como activo, desactivar todos los demás
        if Active then begin
            VendorCert.SetRange(Active, true);
            VendorCert.SetFilter(CertifiedCode, '<>%1', CertifiedCode);  // Excluir el actual
            if VendorCert.FindSet(true) then
                repeat
                    VendorCert.Active := false;
                    VendorCert.Modify(false);
                until VendorCert.Next() = 0;
        end;
    end;

}