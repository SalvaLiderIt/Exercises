page 50100 VendorEvaluationList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = VendorEvaluationHeader;
    Caption = 'Vendor Evaluations';

    layout
    {
        area(Content)
        {
            repeater(List)
            {
                field(EvaluationNo; Rec.EvaluationNo)
                {

                }
                field(EvaluationDate; Rec.EvaluationDate)
                {

                }
                field(Blocked; Rec.Blocked)
                {

                }
                field(VendorNo; Rec.VendorNo)
                {
                }
                field(VendorName; Rec.VendorName)
                {
                }
                field(Result; Rec.Result)
                {
                }
                field(Responsible; Rec.Responsible)
                {
                }
            }
        }
    }

}