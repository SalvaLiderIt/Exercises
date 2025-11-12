table 50100 VendorEvaluationHeader
{
    DataClassification = ToBeClassified;
    Caption = 'Vendor Evaluation Header';
    LookupPageId = VendorEvaluationList;
    DrillDownPageId = VendorEvaluationList;

    Permissions = tabledata Vendor = RIMD;

    fields
    {
        field(1; EvaluationNo; Code[20])
        {
            Caption = 'Nº';
            TableRelation = "No. Series";
            NotBlank = true;
            ToolTip = 'Specifies the evaluation number.';
        }
        field(2; EvaluationDate; Date)
        {
            Caption = 'Evaluation Date';
            ToolTip = 'Specifies the date of the evaluation.';
            NotBlank = true;
        }
        field(3; ArchiveDate; Date)
        {
            Caption = 'Archive Date';
            ToolTip = 'Specifies the date when the evaluation was archived.';
        }
        field(4; Blocked; Boolean)
        {
            Caption = 'Blocked';
            ToolTip = 'Specifies whether the evaluation is blocked.';
        }
        field(5; VendorNo; Code[20])
        {
            Caption = 'Vendor No.';
            ToolTip = 'Specifies the vendor number.';
            TableRelation = Vendor;
            NotBlank = true;

            trigger OnValidate()
            var
                Vendor: Record Vendor;
            begin
                if VendorNo <> '' then begin
                    if Vendor.Get(VendorNo) then
                        VendorName := Vendor.Name
                    else
                        VendorName := '';
                end else
                    VendorName := '';

            end;
        }
        field(6; VendorName; Text[100])
        {
            Caption = 'Vendor Name';
            ToolTip = 'Specifies the name of the vendor.';
        }
        field(7; OtherAspects; Text[250])
        {
            Caption = 'Other Aspects';
            ToolTip = 'Specifies other aspects of the evaluation.';
        }
        field(8; Result; Enum "ResultEnum")
        {
            Caption = 'Result';
            ToolTip = 'Specifies the result of the evaluation.';
            //  todo Se cambia a “En pruebas” cuando se marca un criterio de las líneas. Hay que agregar primero las lineas al document
        }
        field(9; Responsible; Code[50])
        {
            Caption = 'Responsible';
            ToolTip = 'Specifies the person responsible for the evaluation.';
            TableRelation = "User Setup";
        }



    }

    keys
    {
        key(Key1; EvaluationNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; EvaluationNo)
        {
        }
        fieldgroup(Brick; EvaluationNo)
        {
        }
    }

}