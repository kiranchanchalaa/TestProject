({
    doInit : function(component, event, helper) {
        var action = component.get("c.getLabel");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.mylabel", response.getReturnValue());
            }
            // error handling when state is "INCOMPLETE" or "ERROR"
         });
         $A.enqueueAction(action);
    },
    
    setLabel:function(cmp) {
        cmp.set("v._label", 'new label');
    },
    
    doInit1 : function(component, event, helper) {
        var date = new Date();
        component.set("v.datetime", date)
    }
})