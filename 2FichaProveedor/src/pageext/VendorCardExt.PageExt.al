pageextension 50100 VendorCardExt extends "Vendor Card"
{
    layout
    {
        addlast("General")
        {
            group("United Woods")
            {
                Caption = 'United Woods';

                field("Second Name"; Rec."Name 2")
                {
                    ApplicationArea = All;
                    Caption = 'Name 2';
                    ToolTip = 'Specifies the second name of the vendor.';
                    TableRelation = Vendor;
                }
                field("Supplier Type"; Rec."Supplier Type Code")
                {
                    Caption = 'Type';
                    ApplicationArea = All;
                    TableRelation = "Vendor";
                }
                field("Sector Code"; Rec."Sector Code")
                {
                    Caption = 'Sector Code';
                    ApplicationArea = All;
                    TableRelation = "Vendor";
                }
                field("Supplier Type Text"; Rec."Supplier Type Text")
                {
                    ApplicationArea = All;
                    Caption = 'Sector';
                    TableRelation = "Vendor";
                }

                field("Sector Text"; Rec."Sector Text")
                {
                    ApplicationArea = All;
                    Caption = 'Sector Text';
                    TableRelation = "Vendor";
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    Caption = 'Activity Code';
                    ApplicationArea = All;
                    TableRelation = "Vendor";
                }
                field("Activity Text"; Rec."Activity Text")
                {
                    ApplicationArea = All;
                    Caption = 'Activity Text';
                    TableRelation = "Vendor";
                }
                field("Chain Custody Subject"; Rec."Chain Custody Subject")
                {
                    ApplicationArea = All;
                    Caption = 'Chain Custody Subject';
                }
                field("Certification"; Rec."Certification")
                {
                    ApplicationArea = All;
                    Caption = 'Certification';
                    Editable = true;
                }
                field("Homologated"; Rec."Homologated")
                {
                    ApplicationArea = All;
                    Caption = 'Homologated';
                }
            }
        }
    }
    actions
    {
        addlast("F&unctions")
        {
            action("Vendor Types")
            {
                ApplicationArea = All;
                Caption = 'Table Supplier';
                Image = Table;
                ToolTip = 'Opens the Master Table Supplier page.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    SupplierRec: Record "Master Table Supplier";
                begin
                    SupplierRec.SetRange(Type, "Master Table Supplier Type"::Supplier);
                    PAGE.Run(PAGE::"MasterTableSupplier", SupplierRec);
                end;
            }
            action("Sector Types")
            {
                ApplicationArea = All;
                Caption = 'Table Sector';
                Image = Table;
                ToolTip = 'Opens the Master Table Sector page.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    SectorRec: Record "Master Table Supplier";
                begin
                    SectorRec.SetRange(Type, "Master Table Supplier Type"::Sector);
                    PAGE.Run(PAGE::"MasterTableSupplier", SectorRec);
                end;
            }
            action("Activity Types")
            {
                ApplicationArea = All;
                Caption = 'Table Activity';
                Image = Table;
                ToolTip = 'Opens the Master Table Activity page.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    ActivityRec: Record "Master Table Supplier";
                begin
                    ActivityRec.SetRange(Type, "Master Table Supplier Type"::Activity);
                    PAGE.Run(PAGE::"MasterTableSupplier", ActivityRec);
                end;
            }
        }

    }
}