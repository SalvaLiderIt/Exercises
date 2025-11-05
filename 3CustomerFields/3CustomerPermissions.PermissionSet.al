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
    tabledata CustomerActivity = RIMD,
    //tabledata Taste = RIMD,
     tabledata CustomerType = RIMD,
    tabledata CustomerSector = RIMD,
    tabledata CustomerCategory = RIMD,
    // pages
    page CustomerSectorList = X,
    page CustomerActivityList = X,
    page CustomerCategoryList = X,
    page CustomerTypeList = X;



}