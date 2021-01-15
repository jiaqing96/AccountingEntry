/*
*  Name : helperMethod
*  Type : function
*  Description : Call the Backstage apex function and connect to the foreground component.
                 If the condition is met, the Apex database query statement will be displayed in the Component. 
                 If the condition is not met, an error reminder will be given
*/
({
	helperMethod : function ( component, event, helper ) {
        var action = component.get ( "c.getAccountingEntry" );
        //var recordid = component.get("c.recordId")
        var x = component.get ( "v.number" ); 
        action.setParams ( { n:x } );
        action.setParams ( { recordid:component.get("v.recordId") } ); 
        action.setCallback ( this, function ( response ) { 
        	var state = response.getState ( ); 
            if ( state === "SUCCESS" ) { 
                var count = response.getReturnValue ( ).length; 
                if ( count > 0 ) { 
                    component.set ( "v.edit", "true" );  
                    component.set ( "v.AccountingEntryBook", response.getReturnValue ( ) );
                }
                else{
                    component.set ( "v.edit", "false" );  
                }	
            }
            else {
            	console.log ( "Failed with state:s" + state );
            }
        });
         $A.enqueueAction ( action );
	}       
})