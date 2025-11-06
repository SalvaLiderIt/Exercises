tableextension 50100 SalesHeader extends "Sales Header"
{
    fields
    {
        field(50110; SalesZone; Code[20])
        {
            Caption = 'Sales Zone';
            TableRelation = Territory;
            ToolTip = 'Specifies the sales zone of the customer.';
            AllowInCustomizations = Always;
            Editable = false;
        }
        field(50111; Route; Code[20])
        {
            Caption = 'Route';
            TableRelation = "Shipment Method";
            ToolTip = 'Specifies the route of the customer.';
            AllowInCustomizations = Always;
            Editable = false;
        }
        field(50112; TransportAgency; Code[20])
        {
            Caption = 'Transport Agency';
            TableRelation = "Shipping Agent";
            ToolTip = 'Specifies the transport agency of the customer.';
            AllowInCustomizations = Always;
            Editable = false;
        }
    }
}