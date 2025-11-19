report 50100 PedidoCompraReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/reports/PedidoCompraReport.rdl';

    Permissions = tabledata "Company Information" = r,
                  tabledata "Purchase Header" = r,
                  tabledata "Purchase Line" = r;

    dataset
    {
        //HEADER ------------------------------------------------------------------------------------------------------------------------------------------
        dataitem(DataSet_Result; "Purchase Header")
        {
            //  todo EN EL HEADER SE REPITE SOLO IMAGEN Y EL "SELLO"
            column(Name2; CompanyInformation.Name2)
            {
                IncludeCaption = true;
            }
            column(CIF; CompanyInformation."VAT Registration No.")//  todo falta por ver como poner el "-" entre la B y el numero
            {
            }
            column(Picture; CompanyInformation.Picture) { }



            dataitem(PurchaseLine; "Purchase Line")
            {
                // BODY ------------------------------------------------------------------------------------------------------------------------------------------
                DataItemLink = "Document No." = field("No.");//filtro para que solo salgan las lineas del albaran actual


                column(Description; Description) { }
                column(TotalAmount; GetLineAmountExclVAT())//recordar que se pueden poner procedimientos en las columnas, no tiene por que ser únicamente tablas o campos
                {
                }

            }

            trigger OnAfterGetRecord()
            begin
                CompanyInformation.CalcFields(Picture);//muy importante para que se cargue la imagen
            end;
        }
    }


    labels
    {
        CIFlbl = 'C.I.F.'; //  todo falta por ver como poner el "-" entre la B y el numero
        InvoiceNolbl = 'Invoice Nº:';
        InvoiceDatelbl = 'Invoice Date:';
        NIFlbl = 'N.I.F.:';
        DeliveryDatelbl = 'Delivery Date:';
        Conceptlbl = 'Concept';
        Amount = 'Amount';
        InformationClause = 'Information Clause';
        LawText = 'Con el siguiente texto fijo: “De conformidad con el artículo 13 de la sección 2 del Reglamento (UE) 2016/679 del Parlamento Europeo y del Consejo, de 27 de abril de 2016 y la Ley Orgánica 3/2018, relativo a la protección de las personas físicas en lo que respecta al tratamiento de datos personales y a la libre circulación de estos datos, le informamos que el responsable del tratamiento es CLÍNICA LA ARRUZAFA, S.L., que dicho tratamiento se lleva a cabo para la gestión contable, fiscal y administrativa y para el envio de comunicaciones comerciales sobre productos y servicios de la Clínica que ser de su interés. La base legal que permite legitimar este tratamiento el cumplimiento de una obligación legal. Se comunicarán datos a terceros para poder llevar a cabo las finalidades objeto de este contrato. Puede usted acceder, rectificar y suprimir sus datos, así como otros derechos, dirigiéndose por escrito a nuestro Delegado de Protección de Datos m.montaldo@compliancecorporativo.es. Puede usted obtener información ampliada sobre protección de datos solicitándola a nuestro Delegado de Protección de Datos m.montaldo@compliancecorporativo.es”.';
        ToTalInvoice = 'Total Invoice EUR:';
    }


    trigger OnPreReport()
    begin
        CompanyInformation.Get();

    end;

    var
        CompanyInformation: Record "Company Information";
}