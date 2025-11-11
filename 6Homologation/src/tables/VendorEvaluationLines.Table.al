table 50101 VendorEvaluationLines
{
    DataClassification = ToBeClassified;
    Caption = 'Vendor Evaluation Lines';

    fields
    {
        field(1; Criteria; Code[20])
        {
            Caption = 'Criteria';
            NotBlank = true;
            TableRelation = EvaluationCriteria;

        }
        field(2; Good; Boolean)
        {
            Caption = 'Good';

        }
        field(3; Normal; Boolean)
        {
            Caption = 'Normal';

        }
        field(4; Bad; Boolean)
        {
            Caption = 'Bad';

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