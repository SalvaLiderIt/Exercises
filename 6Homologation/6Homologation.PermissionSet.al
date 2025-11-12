permissionset 50100 "6Homologation"
{
    Assignable = true;
    Caption = 'Permissions', MaxLength = 30;

    Permissions =
    // tables
     table VendorEvaluationHeader = X,
    table EvaluationCriteria = X,
      table VendorEvaluationLines = X,
    //  table "Purchases & Payables Setup" = X,
    //table Customer = X,
     tabledata VendorEvaluationLines = RIMD,
    tabledata VendorEvaluationHeader = RIMD,
     tabledata EvaluationCriteria = RIMD,

     // tabledata "Purchase Header" = RIMD,
     //tabledata Customer = RIMD,
     // pages
     page VendorEvaluationList = X,
    page EvaluationCriteriaList = X,
    page VendorEvaluationCardDocument = X,
    page VendorEvaluationListSubform = X,
     page VendorEvaluationsArchived = X;
    // page CustomerTypeList = X,
    //codeunit "Vendor Certificate Mgt." = X;


    ;
}