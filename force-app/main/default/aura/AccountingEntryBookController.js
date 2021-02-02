/*
*  Name : Init
*  Type : function
*  Description : Interact the front end AccountBookEntry component with the backend APEX, and judge whether it is correct, if it is correct then output, or error report.
*/
({
	Init : function ( component, event, helper ) {
        let myAction = component.get ( "c.getAccountingEntry" );
        myAction.setParams({
            n:component.get ( "v.number" ),
            recordid:component.get ( "v.recordId" )
        });
        let myActionPromise = helper.helperMethod(component, myAction);
        myActionPromise.then(function(returnValue){ 
			let _count = returnValue.length; 
                if ( _count > 0 ) {
                    component.set ( "v.edit", "true" );
                    component.set ( "v.AccountingEntryBook", returnValue );
                }else{
                    component.set ( "v.edit", "false" ); 
              }
        }).catch(function(error){ 
            let _error ="Error";
            console.error( _error);  
        }).finally(function() {   
        });
    }
})