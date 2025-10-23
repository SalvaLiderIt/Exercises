
permissionset 50100 "MarcasYsabores"
{
    Assignable = true;
    Caption = 'All the permissions for Brand & Taste';

    Permissions =
        // tables
        tabledata Taste = RIMD;
    /* tabledata Brand = RIMD, */
    // pages
    /*         page BrandCard = X,
            page BrandList = X, */
    /* page TasteCard = X,
    page TasteList = X; */

    // Para reports (cuando los crees):
    // report "Nombre Report" = X;

    // Para codeunits (cuando las crees):
    // codeunit "Nombre Codeunit" = X;
}