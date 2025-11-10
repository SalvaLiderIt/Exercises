pageextension 50101 VendorCard extends "Vendor Card"
{

    actions
    {
        addlast("Ven&dor")
        {
            action("VendorCertificates")
            {
                Caption = 'Certificates';
                ApplicationArea = All;
                Image = Certificate;
                Promoted = true;
                PromotedCategory = Category9;//categoria para que aparezca el boton dentro del apartado de vendor
                PromotedIsBig = true;
                ToolTip = 'Manage vendor certificates.';
                trigger OnAction()
                begin
                    PAGE.Run(PAGE::VendorCertificatesList);
                end;

            }
        }
    }
}