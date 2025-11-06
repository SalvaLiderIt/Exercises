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
                field(RiskGrantedMUSA; Rec.RiskGrantedMUSA)
                {
                    ApplicationArea = All;
                    Caption = 'Risk Granted MUSA';
                    ToolTip = 'Specifies the risk granted in MUSA (0-10).';

                    //colores
                    Style = Favorable;//mostramos color verde por defecto, esto se cambia siempre que stylExpr tenga un valor
                    StyleExpr = Color;

                    trigger OnValidate()
                    begin
                        //llamamos al procedimiento para cambiar el color según el valor introducido
                        SetRiskStyle();
                    end;

                }
                field(ExceededRiskMUSA; Rec.ExceededRiskMUSA)
                {
                    ApplicationArea = All;
                    Caption = 'Exceeded Risk MUSA';
                }
                field(SalesZone; Rec.SalesZone)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Zone';
                }
                field(Route; Rec.Route)
                {
                    ApplicationArea = All;
                    Caption = 'Route';
                }
                field(TransportAgency; Rec.TransportAgency)
                {
                    ApplicationArea = All;
                    Caption = 'Transport Agency';
                }
            }
        }
    }
    //variables globales
    var
        Color: Text;
    //trigger global
    trigger OnAfterGetRecord()
    begin
        SetRiskStyle();
    end;

    //procedimientos
    local procedure SetRiskStyle()
    begin
        if (Rec.RiskGrantedMUSA >= 0) and (Rec.RiskGrantedMUSA <= 4) then
            Color := Format(PageStyle::Favorable) //verde
        else
            if (Rec.RiskGrantedMUSA > 4) and (Rec.RiskGrantedMUSA <= 7) then
                Color := Format(PageStyle::Ambiguous) //amarillo
            else
                if (Rec.RiskGrantedMUSA > 7) and (Rec.RiskGrantedMUSA <= 10) then
                    Color := Format(PageStyle::Unfavorable) //rojo
                else
                    Color := Format(PageStyle::Standard); //sin color
    end;


}