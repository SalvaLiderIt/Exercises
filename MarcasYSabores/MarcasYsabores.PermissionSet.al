
permissionset 50100 "MarcasYsabores"
{
    Assignable = true;
    Caption = 'Permissions', MaxLength = 30;

    Permissions =
        // tables
        table Taste = X,
        table Item = X,
        tabledata Taste = RIMD,
        tabledata Item = RIMD,
        page "Taste List" = X;
    /* tabledata Brand = RIMD, */
    // pages
    /*         page BrandCard = X,
            page BrandList = X, */
    /*  page "Taste Card" = X; */


    // Para reports (cuando los crees):
    // report "Nombre Report" = X;

    // Para codeunits (cuando las crees):
    // codeunit "Nombre Codeunit" = X;
}