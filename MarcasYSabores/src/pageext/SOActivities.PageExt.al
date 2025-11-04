pageextension 50101 "SOActivities" extends "SO Processor Activities"
{
    layout
    {
        addfirst("content")
        {
            cuegroup("Blockages")
            {
                Caption = 'Blockages';

                field("Blocked Brands"; Rec."Blocked Brands")
                {
                    ApplicationArea = All;
                    Caption = 'Blocked Brands';
                    StyleExpr = BlockedBrandsStyleText;
                    DrillDownPageId = "Brand List";
                    ToolTip = 'Specifies the number of blocked brands.';
                }
            }
        }
    }
    var
        BlockedBrandsStyleText: Text[20];

    trigger OnAfterGetRecord()
    begin
        BlockedBrandsStyleText := Rec.BlockedBrandsStyle();
    end;

}