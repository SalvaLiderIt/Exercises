page 50102 VendorEvaluationListSubform
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = VendorEvaluationLines;
    Caption = 'Vendor Evaluation Lines Subform';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                Caption = 'Vendor Evaluation Lines';
                field(Criteria; Rec.Criteria)
                {
                }
                field(Good; Rec.Good)
                {
                }
                field(Normal; Rec.Normal)
                {
                }
                field(Bad; Rec.Bad)
                {
                }

            }
        }
    }
}