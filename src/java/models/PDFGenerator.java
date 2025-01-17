/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;



import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class PDFGenerator {

    public static void generatePDF(List<IssuedItem> issuedItems, HttpServletResponse response) throws DocumentException, IOException {
        // Create a Document object
        Document document = new Document();
        // Set the response type for PDF
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();
        
        // Add the header for the table
        Paragraph title = new Paragraph("Issued Items", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16));
        title.setAlignment(Element.ALIGN_CENTER);
        document.add(title);
        
        // Add some space before the table
        document.add(new Phrase("\n"));

        // Create table with 5 columns
        PdfPTable table = new PdfPTable(5);
        table.addCell("Item Status");
        table.addCell("Quantity");
        table.addCell("Issued At");
        table.addCell("Item Name");
        table.addCell("Issued By");

        // Add data rows
        for (IssuedItem item : issuedItems) {
            table.addCell(item.getStatus());
            table.addCell(String.valueOf(item.getQuantity()));
            table.addCell(item.getCreatedAt().toString());
            table.addCell(item.getItemName());
            table.addCell(item.getFullName());
        }

        // Add the table to the document
        document.add(table);
        // Close the document
        document.close();
    }
}
