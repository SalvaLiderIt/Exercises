page 50103 EvaluationCriteriaList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = EvaluationCriteria;
    Caption = 'Evaluation Criteria';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'Evaluation Criteria Details';
                field(CriteriaCode; Rec.CriteriaCode)
                {
                    Caption = 'Criteria Code';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }
        }
    }

}