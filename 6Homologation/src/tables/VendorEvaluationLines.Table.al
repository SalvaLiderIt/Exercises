table 50101 VendorEvaluationLines
{
    DataClassification = ToBeClassified;
    Caption = 'Vendor Evaluation Lines';
    Permissions = tabledata VendorEvaluationHeader = RIMD;

    fields
    {
        field(1; Criteria; Code[20])
        {
            Caption = 'Criteria';
            ToolTip = 'Specifies the evaluation criteria.';
            NotBlank = true;
            TableRelation = EvaluationCriteria;

        }
        field(2; Good; Boolean)
        {
            Caption = 'Good';
            ToolTip = 'Indicates if the vendor meets the good criteria.';

            trigger OnValidate()
            var
                VendorEvalHeader: Record VendorEvaluationHeader;
            begin
                if Good then  // Si se marca como verdadero
                    if VendorEvalHeader.Get(EvaluationNo) then begin
                        VendorEvalHeader.Result := VendorEvalHeader.Result::Testing;
                        VendorEvalHeader.Modify(true);
                    end;
            end;
        }
        field(3; Normal; Boolean)
        {
            Caption = 'Normal';
            ToolTip = 'Indicates if the vendor meets the normal criteria.';

            trigger OnValidate()
            var
                VendorEvalHeader: Record VendorEvaluationHeader;
            begin
                if Normal then  // Si se marca como verdadero
                    if VendorEvalHeader.Get(EvaluationNo) then begin
                        VendorEvalHeader.Result := VendorEvalHeader.Result::Testing;
                        VendorEvalHeader.Modify(true);
                    end;
            end;
        }
        field(4; Bad; Boolean)
        {
            Caption = 'Bad';
            ToolTip = 'Indicates if the vendor meets the bad criteria.';

            trigger OnValidate()
            var
                VendorEvalHeader: Record VendorEvaluationHeader;
            begin
                if Bad then  // Si se marca como verdadero
                    if VendorEvalHeader.Get(EvaluationNo) then begin
                        VendorEvalHeader.Result := VendorEvalHeader.Result::Testing;
                        VendorEvalHeader.Modify(true);
                    end;
            end;
        }
        field(5; EvaluationNo; Code[20])//campo para relacionar las lineas con el header
        {
            Caption = 'Evaluation No.';
            ToolTip = 'Specifies the evaluation number associated with this line.';
            TableRelation = VendorEvaluationHeader;
            AllowInCustomizations = Always;
        }
    }

    keys
    {
        key(Key1; EvaluationNo, Criteria)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Criteria)
        {
        }
        fieldgroup(Brick; Criteria)
        {
        }
    }

}