page 50100 MasterTableSupplier
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Master Table Supplier";
    Caption = 'Master Table Supplier';

    layout
    {
        area(Content)
        {
            repeater("Maderas Unidas")
            {
                Caption = 'Master Table Supplier';
                field(Type; Rec.Type)
                {
                    Caption = 'Type';
                }
                field(Code; Rec.Code)
                {
                    Caption = 'Code';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(Sector; Rec.Sector)
                {
                    Caption = 'Sector';
                }
                field(Activity; Rec.Activity)
                {
                    Caption = 'Activity';
                }
            }
        }
    }
    /* actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
 */
}