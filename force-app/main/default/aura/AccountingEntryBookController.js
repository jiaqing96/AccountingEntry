 /*
*  Name : Init
*  Type : function
*  Description : For foreground processing of AccountingEntryLighting component, see the helperMethod functions for details.
*/
({
	Init : function ( component, event, helper ) {
        helper.helperMethod ( component, "c.getAccountingEntry", true );
    }
})