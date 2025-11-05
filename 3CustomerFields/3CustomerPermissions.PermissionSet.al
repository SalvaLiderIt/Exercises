permissionset 50100 "3CustomerPermissions"
{
    Assignable = true;
    Caption = 'Permissions', MaxLength = 30;

    Permissions =
    // tables
    //table Taste = X,
    table CustomerType = X,
    //table Brand = X,
    //tabledata RIMD = X,
    //tabledata Taste = RIMD,
     tabledata CustomerType = RIMD,
    //tabledata Brand = RIMD,
    // pages
    page CustomerTypeList = X;


}