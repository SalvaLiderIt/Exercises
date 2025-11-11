pageextension 50101 VendorCard extends "Vendor Card"
{

    layout
    {
        addlast(General)
        {
            field(Homologated; Rec.Homologated)
            {
                ApplicationArea = All;
                Caption = 'Homologated';
            }
        }
    }
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
                    PAGE.Run(PAGE::VendorCertificatesCard);
                end;

            }
        }
    }
}