@isTest
public class InvoiceIntegrationTest 
{
	static testMethod void createInvoice()
    {
        // Step 1: create a new Invoice record - think of this as clicking 
        // the New button on the Invoice tab
        Invoice__c invoice = new Invoice__c();
        
        // Step 2: entering data about our Invoice record - think of this as
        // filling in the fields on a page layout
        invoice.Amount__c = 15000;
        invoice.Status__c = 'Sent';
        
        // Step 3: insert the Invoice record - think of this as clicking 
        // the Save button after we entered details for our Invoice
        insert invoice;
        
        // Step 4: looking at and verifying our newly created Invoice record - 
        // think of this as looking at the Invoice's detail page after clicking
        // save, and visually checking that our data is still there
        invoice = [SELECT Id, Amount__c, Status__c, Date_Paid__c, Date_Sent__c FROM Invoice__c WHERE Id = :invoice.Id];
        System.assertEquals(15000, invoice.Amount__c);
        System.assertEquals('Sent', invoice.Status__c);
    }
    
    static testMethod void updateInvoice()
    {
        // Step 1: create a new Invoice record - think of this as clicking 
        // the New button on the Invoice tab
        Invoice__c invoice = new Invoice__c();
        
        // Step 2: entering data about our Invoice record - think of this as
        // filling in the fields on a page layout
        invoice.Amount__c = 15000;
        invoice.Status__c = 'Sent';
        
        // Step 3: insert the Invoice record - think of this as clicking 
        // the Save button after we entered details for our Invoice
        insert invoice;
        
        // Step 4: setting a new status - think of this as clicking the
        // Edit button from the Invoice record's detail page, and setting a
        // new value for the Status field
        invoice.Status__c = 'Paid';
        
        // Step 5: update the Invoice record - think of this as clicking 
        // the Save button after we changed the Status field
		update invoice;

        // Step 6: looking at and verifying our newly created Invoice record - 
        // think of this as looking at the Invoice's detail page after clicking
        // save, and visually checking that our data is still there
        invoice = [SELECT Id, Amount__c, Status__c, Date_Paid__c, Date_Sent__c FROM Invoice__c WHERE Id = :invoice.Id];
        System.assertEquals(15000, invoice.Amount__c);
        System.assertEquals('Paid', invoice.Status__c);
    }
}