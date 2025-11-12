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
                    MultiLine = true; //esto permite que el campo sea más grande
                }
                field(Result; Rec.Result)
                {

                }
                field(Responsible; Rec.Responsible)
                {
                }
            }
            part(VendorEvaluationListSubform; "VendorEvaluationListSubform") //  note para agregar lineas dentro de una pagina tipo documento. Importante que la pagina de lineas sea tipo ListPart. Una "pagina vinculada a otra tabla" dentro de otra pagina, es como un renderizado dentro de otro renderizado
            {
                SubPageLink = EvaluationNo = field(EvaluationNo);
            }
        }
    }

}