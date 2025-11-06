#pragma warning disable LC0068 //decirle al LinterCop que ignore este warning añadiendo una directiva en el código:
#pragma warning disable LC0048
tableextension 50110 CustomerExt extends Customer
{
    fields
    {
        field(50100; CustomerType; Code[20])
        {
            Caption = 'Customer Type';
            TableRelation = CustomerType;
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
            ToolTip = 'Provides a description of the customer type.';
            Editable = false;
            AllowInCustomizations = Always;
        }
        field(50102; CustomerSector; Code[20])
        {
            Caption = 'Customer Sector';
            TableRelation = CustomerSector;
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
            ToolTip = 'Provides a description of the customer sector.';
            Editable = false;
            AllowInCustomizations = Always;
        }
        field(50104; CustomerActivity; Code[20])
        {
            Caption = 'Customer Activity';
            TableRelation = CustomerActivity;
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
            ToolTip = 'Provides a description of the customer activity.';
            Editable = false;
            AllowInCustomizations = Always;
        }
        field(50106; CustomerCategory; Code[20])
        {
            Caption = 'Customer Category';
            TableRelation = CustomerCategory;
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
            ToolTip = 'Provides a description of the customer category.';
            Editable = false;
            AllowInCustomizations = Always;
        }

        field(50108; RiskGrantedMUSA; Decimal)
        {
            Caption = 'Risk Granted MUSA';
            //TableRelation = Customer;
            ToolTip = 'Specifies the risk granted in MUSA.';
            AllowInCustomizations = Always;
            //MinValue = 0; //validación de rango mínimo esto es un mojón
            //MaxValue = 10;//validación de rango máximo

            trigger OnValidate()
            begin
                if (RiskGrantedMUSA < 0) or (RiskGrantedMUSA > 10) then begin
                    Message('Risk Granted MUSA must be between 0 and 10.');
                    Clear(RiskGrantedMUSA);
                end;
            end;
        }
        field(50109; ExceededRiskMUSA; Decimal)
        {
            Caption = 'Exceeded Risk MUSA';
            //TableRelation = Customer;
            ToolTip = 'Specifies the exceeded risk in MUSA.';
            AllowInCustomizations = Always;
        }

    }

}