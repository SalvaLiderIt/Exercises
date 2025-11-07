pageextension 50100 ItemCard extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            group(ejercicio4)
            {
                Caption = 'Ejercicio 4 - Qualities';
                field(Subfamily; Rec.Subfamily)
                {
                    ApplicationArea = All;
                }
                field(CustodyChain; Rec.CustodyChain)
                {
                    ApplicationArea = All;
                }
                field(Quality; Rec.Quality)
                {
                    ApplicationArea = All;
                }
                field(Veta; Rec.Veta)
                {
                    ApplicationArea = All;
                }
                field(IdArdis; Rec.IdArdis)
                {
                    ApplicationArea = All;
                }
                field(ArdisCategory; Rec.ArdisCategory)
                {
                    ApplicationArea = All;
                }
                field(Beta; Rec.Beta)
                {
                    ApplicationArea = All;
                }
                field(TextureRoute; Rec.TextureRoute)
                {
                    ApplicationArea = All;
                }
            }
        }
        addlast(InventoryGrp)
        {
            group(ejercicio4_2)
            {
                Caption = 'Ejercicio 4 - Qualities 2';
                field(Width; Rec.Width)
                {
                    ApplicationArea = All;
                }
                field(Length; Rec.Length)
                {
                    ApplicationArea = All;
                }
                field(Thickness; Rec.Thickness)
                {
                    ApplicationArea = All;
                }
                field(Density; Rec.Density)
                {
                    ApplicationArea = All;
                }
                field(Volumen; Rec.Volumen)
                {
                    ApplicationArea = All;
                }
                field(PlaneNumber; Rec.PlaneNumber)
                {
                    ApplicationArea = All;
                }
                field(OnDeposit; Rec.OnDeposit)
                {
                    ApplicationArea = All;
                }
            }
        }
        addlast("Costs & Posting")
        {
            group(ejercicio4_3)
            {
                Caption = 'Ejercicio 4 - Qualities 3';
                field(LastPurchasePrice; Rec.LastPurchasePrice)
                {
                    ApplicationArea = All;
                }
                field(MarginPercentaje; Rec.MarginPercentaje)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}