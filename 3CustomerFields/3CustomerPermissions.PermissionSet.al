permissionset 50100 "3CustomerPermissions"
{
    Assignable = true;
    Caption = 'Permissions', MaxLength = 30;

    Permissions =
    // tables
    table CustomerActivity = X,
    table CustomerType = X,
    table CustomerSector = X,
    table CustomerCategory = X,
    table Customer = X,
    //tabledata Taste = RIMD,
    tabledata CustomerActivity = RIMD,
     tabledata CustomerType = RIMD,
    tabledata CustomerSector = RIMD,
    tabledata CustomerCategory = RIMD,
    tabledata Customer = RIMD,
    // pages
    page CustomerSectorList = X,
    page CustomerActivityList = X,
    page CustomerCategoryList = X,
    page CustomerTypeList = X,
    codeunit CopyFields = X;



}