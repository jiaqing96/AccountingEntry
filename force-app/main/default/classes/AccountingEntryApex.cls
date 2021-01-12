Global  with sharing class AccountingEntryApex{
    /*String sql = ' ';
    Global AccountingEntryBookLightningApex ( ) {
        this.sql='SELECT Name, Occurred_Date__c, Type__c, Locked__c, Amount__c, Reason__c FROM Accounting_Entry__c order by Occurred_Date__c DESC limit:n';
    }*/
    @AuraEnabled
    public static List<Accounting_Entry__c> getAccountingEntry ( Integer n ) {
        Integer count = [SELECT count ( ) FROM Accounting_Entry__c];
        String sql = 'SELECT Name, Occurred_Date__c, Type__c, Locked__c, Amount__c, Reason__c FROM Accounting_Entry__c order by Occurred_Date__c DESC limit:n';
        List<Accounting_Entry__c> AccountingEntryList = new List<Accounting_Entry__c> ( );
        if( n > 0 || n < = count ){
            System.debug(count+'==================');
            AccountingEntryList = Database.query  ( sql );
                try{
                    String[] fieldsToCheck = new String[] { 
                 	'Name', 'Occurred_Date__c', 'Type__c', 'Locked__c', 'Amount__c', 'Reason__c'
               		 };
                    Map<String,Schema.SObjectField> fieldDescribeTokens =
                    Schema.SObjectType.Accounting_Entry__c.fields.getMap();
                    for ( String field : fieldsToCheck ) {
                        if( ! fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
                            throw new System.NoAccessException();
                        }
                    }
                }catch(exception e){
                    throw e;
                }   
        } 
        else {
            //this.n=1;
            System.debug ( '!!!!!!!!!!!!!!!!!!' );
        }
        	return AccountingEntryList; 
    }
}