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
        dataitem(PurchaseHeader; "Purchase Header")
        {
            DataItemTableView = where("Document Type" = const(Order));

            //  todo EN EL HEADER SE REPITE SOLO IMAGEN Y EL "SELLO"
            column(Name2; CompanyInformation.Name2)
            {
                IncludeCaption = true;
            }
            column(CIF; CompanyInformation."VAT Registration No.") { }
            column(Picture; CompanyInformation.Picture) { }
            column(Adress; CompanyInformation.Address) { }
            column(Adress2; CompanyInformation."Address 2") { }
            column(Post_Code; CompanyInformation."Post Code") { }
            column(City; CompanyInformation.City) { }
            column(Province; CompanyInformation.Province) { }
            column(Phone; CompanyInformation."Phone No.") { }
            column(Phone2; CompanyInformation.PhoneNo2) { }
            column(email; CompanyInformation."E-Mail") { }
            column(homepage; CompanyInformation."Home Page") { }


            dataitem(PurchaseLine; "Purchase Line")
            {
                // BODY ------------------------------------------------------------------------------------------------------------------------------------------
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");

                column(Description; Description) { }
                column(TotalAmount; GetLineAmountExclVAT())//recordar que se pueden poner procedimientos en las columnas, no tiene por que ser únicamente tablas o campos
                {
                }
                column(No; PurchaseLine."Document No.") { }

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
        ToTalInvoice = 'Total Invoice EUR:';
        Officelbl = 'OFFICE. Tel. +';
        Factorylbl = 'FACTORY. Tel. +';
        Footerlbl = 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. ';

    }


    trigger OnPreReport()
    begin
        CompanyInformation.Get();

    end;

    var
        CompanyInformation: Record "Company Information";
}