from PyPDF2  import PdfReader

def pdfreaderq(pdf_location):
    pdfreader = PdfReader(pdf_location)
    fields = pdfreader.get_fields()
    
    FieldNamelist = []
    FieldValuelist = []

    for a, b in enumerate(fields):
        fieldName = fields[b].name
        value = fields[b].value
        FieldNamelist.append(fieldName)
        FieldValuelist.append(value)

    PDFValues = {}
    for key in FieldNamelist:
        for value in FieldValuelist:
            PDFValues[key] = value
            FieldValuelist.remove(value)
            break

    return PDFValues

