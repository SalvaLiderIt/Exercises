pageextension 50100 CustomerExtCard extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field("Second Name"; Rec."Name 2")
            {
                ApplicationArea = All;
                Caption = 'Name 2';
            }

        }
        addafter(General)
        {
            group(Ejercicio3)
            {
                Caption = 'Ejercicio 3';
                field(CustomerType; Rec.CustomerType)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Type';
                }
                field(CustomerDescription; Rec.CustomerDescription)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Description';
                }
                field(CustomerSector; Rec.CustomerSector)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Sector';
                }
                field(SectorDescription; Rec.SectorDescription)
                {
                    ApplicationArea = All;
                    Caption = 'Sector Description';
                }
                field(CustomerActivity; Rec.CustomerActivity)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Activity';
                }
                field(ActivityDescription; Rec.ActivityDescription)
                {
                    ApplicationArea = All;
                    Caption = 'Activity Description';
                }
                field(CustomerCategory; Rec.CustomerCategory)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Category';
                }
                field(CategoryDescription; Rec.CategoryDescription)
                {
                    ApplicationArea = All;
                    Caption = 'Category Description';
                }
            }
        }
    }

}