permissionset 50100 "9PurchaseOrderReport"
{
    Assignable = true;
    Caption = 'Permissions', MaxLength = 30;

    Permissions =
    // tables
    //  table OfferedPurchaseLinesTable = X,
    //  table EvaluationCriteria = X,
    //   table VendorEvaluationLines = X,
    //  table "Purchases & Payables Setup" = X,
    //table Customer = X,
    //   tabledata OfferedPurchaseLinesTable = RIMD;
    //   tabledata VendorEvaluationHeader = RIMD,
    //  tabledata EvaluationCriteria = RIMD,

    // tabledata "Purchase Header" = RIMD,
    //tabledata Customer = RIMD,
    // pages
    // page VendorEvaluationList = X,
    // page EvaluationCriteriaList = X,
    // page VendorEvaluationCardDocument = X,
    //page VendorEvaluationListSubform = X,
    //page VendorEvaluationsArchived = X;
    //  page OfferedPurchaseLinesPage = X,
    // codeunit "CreateMultipleOffers" = X;
    report PedidoCompraReport = X;

    ;
}