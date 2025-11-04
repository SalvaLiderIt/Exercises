
permissionset 50100 "2Ficha Proveedor"
{
    Assignable = true;
    Caption = 'Permissions', MaxLength = 30;

    Permissions =
        // tables
        table "Master Table Supplier" = X,
    tabledata "Master Table Supplier" = RIMD,
    page MasterTableSupplier = X;
    // pages
    //page "Brand Card" = X;
    // pages
    /*         page BrandCard = X,
            page BrandList = X, */
    /*  page "Taste Card" = X; */


    // Para reports (cuando los crees):
    // report "Nombre Report" = X;

    // Para codeunits (cuando las crees):
    // codeunit "Nombre Codeunit" = X;
}