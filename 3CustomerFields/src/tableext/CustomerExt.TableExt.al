#pragma warning disable LC0068 //decirle al LinterCop que ignore este warning añadiendo una directiva en el código:
tableextension 50110 CustomerExt extends Customer
{
    fields
    {
        field(50100; CustomerType; Code[20])
        {
            Caption = 'Customer Type';
            TableRelation = CustomerType;
            DataClassification = ToBeClassified;
            ToolTip = 'Specifies the type of customer.';
            AllowInCustomizations = Always;
            trigger OnValidate()//trigger para copiar la descripcion automaticamente y mostrarla al seleccionar codigo
            var
                CustomerTypeRec: Record CustomerType;
            begin
                if CustomerType <> '' then begin
                    if CustomerTypeRec.Get(CustomerType) then
                        CustomerDescription := CustomerTypeRec.CustomerDescription
                    else
                        CustomerDescription := '';//si no encuentra el codigo, borra la descripcion
                end else
                    CustomerDescription := '';//si se borra el codigo, borra la descripcion
            end;
        }
        field(50101; CustomerDescription; Text[50])
        {
            Caption = 'Customer Description';
            DataClassification = ToBeClassified;
            ToolTip = 'Provides a description of the customer type.';
            Editable = false;
            AllowInCustomizations = Always;
        }
        field(50102; CustomerSector; Code[20])
        {
            Caption = 'Customer Sector';
            TableRelation = CustomerSector;
            DataClassification = ToBeClassified;
            ToolTip = 'Specifies the sector of the customer.';
            AllowInCustomizations = Always;
            trigger OnValidate()
            var
                CustomerSectorRec: Record CustomerSector;
            begin
                if CustomerSector <> '' then begin
                    if CustomerSectorRec.Get(CustomerSector) then
                        SectorDescription := CustomerSectorRec.SectorDescription
                    else
                        SectorDescription := '';
                end else
                    SectorDescription := '';
            end;
        }
        field(50103; SectorDescription; Text[50])
        {
            Caption = 'Sector Description';
            DataClassification = ToBeClassified;
            ToolTip = 'Provides a description of the customer sector.';
            Editable = false;
            AllowInCustomizations = Always;
        }
        field(50104; CustomerActivity; Code[20])
        {
            Caption = 'Customer Activity';
            TableRelation = CustomerActivity;
            DataClassification = ToBeClassified;
            ToolTip = 'Specifies the type of customer.';
            AllowInCustomizations = Always;
            trigger OnValidate()
            var
                CustomerActivityRec: Record CustomerActivity;
            begin
                if CustomerActivity <> '' then begin
                    if CustomerActivityRec.Get(CustomerActivity) then
                        ActivityDescription := CustomerActivityRec.ActivityDescription
                    else
                        ActivityDescription := '';
                end else
                    ActivityDescription := '';
            end;
        }
        field(50105; ActivityDescription; Text[50])
        {
            Caption = 'Activity Description';
            DataClassification = ToBeClassified;
            ToolTip = 'Provides a description of the customer activity.';
            Editable = false;
            AllowInCustomizations = Always;
        }
        field(50106; CustomerCategory; Code[20])
        {
            Caption = 'Customer Category';
            TableRelation = CustomerCategory;
            DataClassification = ToBeClassified;
            ToolTip = 'Specifies the category of the customer.';
            AllowInCustomizations = Always;
            trigger OnValidate()
            var
                CustomerCategoryRec: Record CustomerCategory;
            begin
                if CustomerCategory <> '' then begin
                    if CustomerCategoryRec.Get(CustomerCategory) then
                        CategoryDescription := CustomerCategoryRec.CategoryDescription
                    else
                        CategoryDescription := '';
                end else
                    CategoryDescription := '';
            end;
        }
        field(50107; CategoryDescription; Text[50])
        {
            Caption = 'Category Description';
            DataClassification = ToBeClassified;
            ToolTip = 'Provides a description of the customer category.';
            Editable = false;
            AllowInCustomizations = Always;
        }
    }

}