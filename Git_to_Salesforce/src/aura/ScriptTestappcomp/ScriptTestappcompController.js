({
	hello:function(cmp) {
        cmp.set("v.ammu","ammu i love you");
	},
    newItemEvent:function(cmp,event,helper){
        helper.updateItem(cmp,event.getparam("item"));
    },
    getValue : function(component, event, helper) {
        component.set("v.value", _counter1.getValue());
    },

    increment : function(component, event, helper) {
        component.set("v.value", _counter1.increment());
    }
})