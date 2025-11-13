pageextension 50100 VendorCardExt extends "Vendor Card"
{
    actions
    {
        addlast(navigation)
        {
            group(VendorEvaluations)
            {
                Caption = 'Evaluations';
                Image = Evaluate;

                action(ShowActiveEvaluations)
                {
                    Caption = 'Active Evaluations';
                    ToolTip = 'Show active vendor evaluations for this vendor.';
                    Image = ShowList;
                    RunObject = page VendorEvaluationList;
                    RunPageLink = VendorNo = field("No."), Blocked = const(false);
                    ApplicationArea = All;
                }

                action(ShowArchivedEvaluations)
                {
                    Caption = 'Archived Evaluations';
                    ToolTip = 'Show archived vendor evaluations for this vendor.';
                    Image = Archive;
                    RunObject = page VendorEvaluationsArchived;
                    RunPageLink = VendorNo = field("No.");
                    ApplicationArea = All;
                }
            }
        }
    }
}