page 50100 VendorCertificatesCard //Ficha Certificado Proveedor
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = VendorCertificatesHeader;
    Caption = 'Vendor Certificates';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'Vendor Certificates Header';
                field(CertifiedCode; Rec.CertifiedCode)
                {

                }
                field(CertifiedType; Rec.CertifiedType)
                {
                }
                field(IssueDate; Rec.IssueDate)
                {
                }
                field(ExpirationDate; Rec.ExpirationDate)
                {
                }
                field(Active; Rec.Active)
                {
                }
                /* field(Attached; Rec.Attached)
                {
                } */
            }
            part(VendorCertificatesLines; VendorCertificatesLines) //  note para agregar lineas dentro de una pagina tipo documento. Importante que la pagina de lineas sea tipo ListPart. Una "pagina vinculada a otra tabla" dentro de otra pagina, es como un renderizado dentro de otro renderizado
            {
            }
        }
        area(FactBoxes)
        {
            systempart(Notes; Notes)
            {
            }
            systempart(Links; Links)
            {
            }
            part("Attached Documents List"; "Doc. Attachment List Factbox")
            {
            }
            part("Datos Adjuntos"; "Document Attachment Factbox") { }//  note  para mostrar el factbox de documentos adjuntos en la pagina de certificado proveedor, lo van a borrar
        }
    }


    actions
    {
        area(Processing)
        {
            action(ImportAttachment)
            {
                Caption = 'Import Document';
                Image = Import;
                ToolTip = 'Import and attach a document to this certificate.';
                ApplicationArea = All;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Promoted = true;

                trigger OnAction()
                var
                    InStr: InStream;
                    OutStr: OutStream;
                    FileName: Text;
                begin
                    if UploadIntoStream('Select a file', '', '', FileName, InStr) then begin
                        Clear(Rec.Attached);  // Limpiar el blob primero
                        Rec.Attached.CreateOutStream(OutStr);  // Crear el stream de salida
                        CopyStream(OutStr, InStr);  // Copiar los datos
                        Rec.Modify(true);
                        Message('File %1 uploaded successfully.', FileName);
                    end;
                end;
            }

            action(ExportAttachment)
            {
                Caption = 'Export Document';
                Image = Export;
                ToolTip = 'Download the attached document.';
                ApplicationArea = All;

                trigger OnAction()
                var
                    InStr: InStream;
                    FileName: Text;
                begin
                    if not Rec.Attached.HasValue() then
                        Message('No hay ningún documento adjunto.');

                    Rec.Attached.CreateInStream(InStr);
                    FileName := 'Certificate_' + Rec.CertifiedCode + '.pdf';  // Puedes mejorar el nombre
                    DownloadFromStream(InStr, 'Export', '', '', FileName);
                end;
            }

            action(DeleteAttachment)
            {
                Caption = 'Delete Document';
                Image = Delete;
                ToolTip = 'Remove the attached document.';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if not Rec.Attached.HasValue() then
                        Message('No hay ningún documento adjunto.');

                    if Confirm('¿Está seguro de que desea eliminar el documento adjunto?') then begin
                        Clear(Rec.Attached);
                        Rec.Modify(true);
                        Message('Documento eliminado.');
                    end;
                end;
            }
        }
    }

}