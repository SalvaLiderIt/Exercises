pageextension 50100 UserSetupExt extends "User Setup"
{
    layout
    {
        addafter("Allow Posting To")
        {
            field("Copy Quote to Purchase Order"; Rec."Copy Quote to Purchase Order")
            {
                ApplicationArea = All;
                Caption = 'Copy Quote to Purchase Order';
            }
        }
    }
}