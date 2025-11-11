table 50102 EvaluationCriteria
{
    DataClassification = ToBeClassified;
    Caption = 'Evaluation Criteria';

    fields
    {
        field(1; CriteriaCode; Code[20])
        {
            NotBlank = true;
            Caption = 'Criteria Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
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