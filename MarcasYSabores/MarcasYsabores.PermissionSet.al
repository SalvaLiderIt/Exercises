
permissionset 50100 "MarcasYsabores"
{
    Assignable = true;
    Caption = 'All the permissions for Brand & Taste';

    Permissions =
        // Tablas
        tabledata Sabor = RIMD;

    // Aquí agregarás permisos para futuras tablas:
    // tabledata "Nombre Tabla" = RIMD;

    // Para páginas (cuando las crees):
    // page "Nombre Página" = X;

    // Para reports (cuando los crees):
    // report "Nombre Report" = X;

    // Para codeunits (cuando las crees):
    // codeunit "Nombre Codeunit" = X;
}