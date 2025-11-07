table 50100 Qualities
{
    DataClassification = ToBeClassified;
    Caption = 'Qualities';

    fields
    {
        field(1; QualityCode; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; QualityDescription; Text[50])
        {
            Caption = 'Description';
        }
        field(3; Input; Text[100])
        {
            Caption = 'Input';
            //  todo El valor de este campo se imprimirá en el formato de Órden de pedido, en la devolución de compra,
            // proforma, albarán de venta, abono de venta, etiqueta de recepción, expedición y producto.
            // Se imprimirá debajo de cada artículo y para cada uno de ellos
        }

    }
    fieldgroups
    {
        fieldgroup(DropDown; QualityCode, QualityDescription)
        {
        }
        fieldgroup(Brick; QualityCode, QualityDescription, Input)
        {
        }
    }

}