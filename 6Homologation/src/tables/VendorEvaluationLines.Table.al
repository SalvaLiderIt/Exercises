table 50101 VendorEvaluationLines
{
    DataClassification = ToBeClassified;
    Caption = 'Vendor Evaluation Lines';

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

        }
        field(3; Normal; Boolean)
        {
            Caption = 'Normal';
            ToolTip = 'Indicates if the vendor meets the normal criteria.';


        }
        field(4; Bad; Boolean)
        {
            Caption = 'Bad';
            ToolTip = 'Indicates if the vendor meets the bad criteria.';

        }
    }

    keys
    {
        key(Key1; Criteria)
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