({
	helperMethod : function(component, event, helper) {
        var action = component.get("c.getAccountingEntry"); //获取apex方法与cmp连接
        var x = component.get ( "v.number" ); //将前台用户输入rownumber赋给x
        //var error = component.get ( "v.edit" ); //将前台attribute edit赋给error,判断true/false
        action.setParams ( { n:x } ); //将用户输入的number传给apex n
        action.setCallback ( this, function(response ) { //回调函数
        	var state = response.getState ( ); //获取状态
            console.log(state + "=======");
            if ( state === "SUCCESS" ) { //当状态是成功的时候
                var count=response.getReturnValue ( ).length; //获取apex sql list的长度
                console.log (count+'!!!!!!!!!!!!!!' );
                if(count > 0){ //当我的list符合条件的时候
                    component.set ( "v.edit","true" );  //对前台aura:if进行true的赋值
                    component.set ( "v.AccountingEntryBook", response.getReturnValue ( ) );//返回结果
                }
                else{
                    component.set ( "v.edit","false" );  //对前台aura:if进行false的赋值
                }	
            }
            else {
           		console.log ( "Failed with state: " + state );
           }
        });
         $A.enqueueAction ( action );
	}       
})