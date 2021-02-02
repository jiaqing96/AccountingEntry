/**************************************************************************************************
 * Name           : AccountingEntryApex
 * Object         : Account_Book_Entry_relationship__c
 * Requirement    : 
 * Target         :
 * Refer classes  :
 * Author         : Anna
 * Create Date    : 2021-01-28
 * Modify History : 
 **************************************************************************************************/
Global  with sharing class AccountingBook {
    /*
    *  Name : getAccountingEntry
    *  Type : List
    *  Description : Query and output processing on Account_Book_Entry_relationship__c object.
    */
    @AuraEnabled
        public static List<Account_Book_Entry_relationship__c> getAccountingEntry ( Integer n, String recordid) {
          System.debug(n+'=============');
          System.debug(recordid+'=============');
          String sql = 'SELECT Accounting_Entry__r.Name, Accounting_Entry__r.Occurred_Date__c, Accounting_Entry__r.Type__c, Accounting_Entry__r.Locked__c, Accounting_Entry__r.Amount__c, Accounting_Entry__r.Reason__c FROM Account_Book_Entry_relationship__c WHERE Accounting_Book__r.Account__c=:recordid order by Accounting_Entry__r.Occurred_Date__c DESC limit:n';
          List<Account_Book_Entry_relationship__c> AccountingEntryList = new List<Account_Book_Entry_relationship__c> ( );
          if( n > 0 && n < 50000 ){
                AccountingEntryList = Database.query ( sql );  
           }
          return AccountingEntryList;   
        }
}