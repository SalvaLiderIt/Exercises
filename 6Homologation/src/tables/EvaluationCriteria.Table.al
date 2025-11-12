table 50102 EvaluationCriteria
{
    DataClassification = ToBeClassified;
    Caption = 'Evaluation Criteria';
    LookupPageId = EvaluationCriteriaList; // EvaluationCriteriaList
    DrillDownPageId = EvaluationCriteriaList; // EvaluationCriteriaList

    fields
    {
        field(1; CriteriaCode; Code[20])
        {
            NotBlank = true;
            Caption = 'Criteria Code';
            ToolTip = 'Specifies the code for the evaluation criteria.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            ToolTip = 'Provides a description of the evaluation criteria.';
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; CriteriaCode)
        {
        }
        fieldgroup(Brick; CriteriaCode)
        {
        }
    }

}