permissionset 50100 "4VendorCertificate"
{
    Assignable = true;
    Caption = 'Permissions', MaxLength = 30;

    Permissions =
    // tables
    table VendorCertificatesHeader = X,
    //table Item = X,
    table VendorCertificatesLines = X,
    // table CustomerCategory = X,
    //table Customer = X,
    tabledata VendorCertificatesHeader = RIMD,
    //tabledata Item = RIMD,
    tabledata VendorCertificatesLines = RIMD,
    //tabledata CustomerSector = RIMD,
    //tabledata CustomerCategory = RIMD,
    //tabledata Customer = RIMD,
    // pages
    page VendorCertificatesCard = X,
    page VendorCertificatesList = X,
    page VendorCertificatesLines = X;
    // page CustomerTypeList = X,
    //codeunit UpdateLastPurchasePrice = X;


    ;
}