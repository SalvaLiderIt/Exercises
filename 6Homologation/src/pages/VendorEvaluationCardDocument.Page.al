page 50101 VendorEvaluationCardDocument
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = VendorEvaluationHeader;
    Caption = 'Vendor Evaluation Card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'General Information';
                field(EvaluationNo; Rec.EvaluationNo)
                {

                }
                field(EvaluationDate; Rec.EvaluationDate)
                {

                }
                field(ArchiveDate; Rec.ArchiveDate)
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
                field(OtherAspects; Rec.OtherAspects)
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