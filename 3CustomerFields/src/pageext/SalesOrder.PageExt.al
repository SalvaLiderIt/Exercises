pageextension 50101 SalesOrder extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            group(Ejercicio3)
            {
                Caption = 'Ejercicio 3';
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

}