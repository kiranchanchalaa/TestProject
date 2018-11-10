({
	handleClick : function(component, event, helper) {
		var btnclicked = event.getSource();
        var btnmessage= btnclicked.get('v.label');
        consol.log("handleClick : message"+btnmessage);
        component.set("v.message",btnmessage);
	},

    handleClick2 : function(component, event, helper) {
        var newmessage= event.getSource().get('v.label');
        consol.log("handleClick2 : message"+newmessage);
        component.set("v.message",newmessage);
    },
    
    handleClick3: function(component, event,helper){
     component.set("v.message",event.getSource().get("v.label"));
}
})