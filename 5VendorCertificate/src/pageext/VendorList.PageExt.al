pageextension 50100 VendorList extends "Vendor List"
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
                PromotedCategory = Process;
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