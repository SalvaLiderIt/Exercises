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

    actions
    {
        area(Processing)
        {
            action(ArchiveEvaluation)
            {
                Caption = 'Archive Evaluation';
                ToolTip = 'Archive this vendor evaluation.';
                Image = Archive;

                trigger OnAction()
                var
                    ActiveEvaluation: Record VendorEvaluationHeader;
                    ErrorMsg: Label 'Cannot archive: The vendor %1 already has an active evaluation (Nº %2).', Comment = '%1 si no incluyo esto me da warning y %2 tantos tags como tenga ';
                    SuccessMsg: Label 'Evaluation has been archived successfully.';
                begin
                    // Verificar que no haya otra evaluación activa del mismo proveedor
                    ActiveEvaluation.Reset();
                    ActiveEvaluation.SetRange(VendorNo, Rec.VendorNo);
                    ActiveEvaluation.SetRange(Blocked, false);
                    ActiveEvaluation.SetFilter(EvaluationNo, '<>%1', Rec.EvaluationNo);

                    if ActiveEvaluation.FindFirst() then
                        Error(ErrorMsg, Rec.VendorNo, ActiveEvaluation.EvaluationNo);

                    // Archivar la evaluación
                    Rec.Blocked := true;
                    Rec.ArchiveDate := Today();
                    Rec.Modify(true);

                    Message(SuccessMsg);
                    CurrPage.Close();  // Cerrar la ficha
                end;
            }
        }
    }
}