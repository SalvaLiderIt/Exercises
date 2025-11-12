page 50104 VendorEvaluationsArchived
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = VendorEvaluationHeader;
    Caption = 'Vendor Evaluations Archived';
    Editable = false;
    SourceTableView = where(Blocked = const(true)); //solo muestra archivadas

    layout
    {
        area(Content)
        {
            repeater(List)
            {
                Caption = 'Vendor Evaluations Archived';
                field(ArchiveDate; Rec.ArchiveDate)
                {

                }
                field(EvaluationNo; Rec.EvaluationNo)
                {

                }
                field(EvaluationDate; Rec.EvaluationDate)
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
    actions
    {
        area(Processing)
        {
            action(UnarchiveEvaluation)//botón para desarchivar
            {
                Caption = 'Unarchive Evaluation';
                ToolTip = 'Unarchive the selected vendor evaluation.';
                Image = Undo;

                trigger OnAction()
                var
                    ActiveEvaluation: Record VendorEvaluationHeader;
                    ConfirmMsg: Label 'The vendor %1 already has an active evaluation. Do you want to archive it and unarchive this one?', Comment = '%1 tantos tags como tenga ';
                    SuccessMsg: Label 'Evaluation has been unarchived successfully.';
                    CancelledMsg: Label 'Operation cancelled.';
                begin
                    // Buscar si el proveedor ya tiene una evaluación activa
                    ActiveEvaluation.Reset();
                    ActiveEvaluation.SetRange(VendorNo, Rec.VendorNo);
                    ActiveEvaluation.SetRange(Blocked, false);

                    if ActiveEvaluation.FindFirst() then begin
                        // Si tiene una activa, preguntar si quiere archivarla
                        if not Confirm(StrSubstNo(ConfirmMsg, Rec.VendorNo), false) then begin
                            Message(CancelledMsg);
                            exit;
                        end;

                        // Archivar la evaluación activa
                        ActiveEvaluation.Blocked := true;
                        ActiveEvaluation.ArchiveDate := Today();
                        ActiveEvaluation.Modify(true);
                    end;

                    // Desarchivar la evaluación seleccionada
                    Rec.Blocked := false;
                    Rec.ArchiveDate := 0D;  // Limpiar fecha de archivo
                    Rec.Modify(true);

                    Message(SuccessMsg);
                    CurrPage.Close();  // Cerrar la página porque ya no cumple el filtro (Blocked=true)
                end;
            }


            action(ArchiveEvaluation)//botón para archivar
            {
                Caption = 'Archive Evaluation';
                ToolTip = 'Archive the selected vendor evaluation.';
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
                    ActiveEvaluation.SetFilter(EvaluationNo, '<>%1', Rec.EvaluationNo);  // Excluir el actual

                    if ActiveEvaluation.FindFirst() then
                        Error(ErrorMsg, Rec.VendorNo, ActiveEvaluation.EvaluationNo);

                    // Archivar la evaluación
                    Rec.Blocked := true;
                    Rec.ArchiveDate := Today();
                    Rec.Modify(true);

                    Message(SuccessMsg);
                    CurrPage.Update(false);
                end;
            }
        }
    }
}