/**************************************************************************************************
 * Name           : AccountingEntryApex
 * Object         : Accounting_Entry__c
 * Requirement    : 
 * Target         :
 * Refer classes  :
 * Author         : Anna
 * Create Date    : 2021-01-12
 * Modify History : 
 **************************************************************************************************/

Global  with sharing class AccountingEntryApex{
    /*
    *  Name : getAccountingEntry
    *  Type : List
    *  Description : Query and output processing on Accounting_Entry__c object.
    */
    @AuraEnabled
    public static List<Accounting_Entry__c> getAccountingEntry ( Integer n, String recordid ) {
        Integer count = [SELECT count ( ) FROM Accounting_Entry__c];
        String sql = 'SELECT Accounting_Entry__c.Name, Accounting_Entry__c.Occurred_Date__c, Accounting_Entry__c.Type__c, Accounting_Entry__c.Locked__c, Accounting_Entry__c.Amount__c, Accounting_Entry__c.Reason__c FROM Accounting_Entry__c WHERE Accounting_Entry__c.Account_Book_Entry_relationship__c.Accounting_Book__c.Account__c.id=:recordid order by Accounting_Entry__c.Occurred_Date__c DESC limit:n';
        List<Accounting_Entry__c> AccountingEntryList = new List<Accounting_Entry__c> ( );
        System.debug(count+'=====================');
        System.debug(n+'=====================');
        if( n > 0 && n < 50000 ){
        	AccountingEntryList = Database.query ( sql );
            try{
            	String [ ] fieldsToCheck = new String [ ] { 
                'Name', 'Occurred_Date__c', 'Type__c', 'Locked__c', 'Amount__c', 'Reason__c'
                };
                Map<String,Schema.SObjectField> fieldDescribeTokens =
                Schema.SObjectType.Accounting_Entry__c.fields.getMap ( );
                for ( String field : fieldsToCheck ) {
                	if( ! fieldDescribeTokens.get ( field ) .getDescribe ( ).isAccessible ( ) ) {
                    	throw new System.NoAccessException ( );
                    }
                }
            }catch ( exception e ) {
            	throw e;
            }   
       }  
       return AccountingEntryList; 
    }
}