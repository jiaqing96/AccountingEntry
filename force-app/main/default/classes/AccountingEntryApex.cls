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
    public static List<Accounting_Entry__c> getAccountingEntry ( Integer n ) {
        Integer count = [SELECT count ( ) FROM Accounting_Entry__c];
        String sql = 'SELECT Name, Occurred_Date__c, Type__c, Locked__c, Amount__c, Reason__c FROM Accounting_Entry__c order by Occurred_Date__c DESC limit:n';
        List<Accounting_Entry__c> AccountingEntryList = new List<Accounting_Entry__c> ( );
        if( n > 0 || n < = count ){
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