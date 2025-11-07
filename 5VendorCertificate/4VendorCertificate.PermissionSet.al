permissionset 50100 "4VendorCertificate"
{
    Assignable = true;
    Caption = 'Permissions', MaxLength = 30;

    Permissions =
    // tables
    table VendorCertificatesHeader = X,
    //table Item = X,
    // table CustomerSector = X,
    // table CustomerCategory = X,
    //table Customer = X,
    tabledata VendorCertificatesHeader = RIMD;
    //tabledata Item = RIMD,
    //tabledata CustomerType = RIMD,
    //tabledata CustomerSector = RIMD,
    //tabledata CustomerCategory = RIMD,
    //tabledata Customer = RIMD,
    // pages
    // page CustomerSectorList = X,
    //page CustomerActivityList = X,
    //page CustomerCategoryList = X,
    // page CustomerTypeList = X,
    //codeunit UpdateLastPurchasePrice = X;


    ;
}