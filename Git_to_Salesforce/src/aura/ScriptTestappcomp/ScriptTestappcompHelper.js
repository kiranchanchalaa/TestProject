({
	updateItem : function(component,item,callback) {
		//Update the items via a server-side action
     var action= cmp.get("v.ammu");
        action.setparam({"item": item});
        //Set any optional callback and enqueue the action
        if(callback){
            action.setCallback(this,callback);
        }
        $A.enqueueAction(action);

	},
    open : function(component, note, mode, sort){
        if(mode === "new") {
            //do something
        }
        // do something else, such as firing an event
    }
})