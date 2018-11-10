({
	handlePeopleChange: function(component, event, helper){
            var people = component.get("v.people");
            var peopleEmails = helper.filterEmails(people);
            var action = component.get("c.findOpportunityCloseDateTime");
            action.setParam("emails", peopleEmails);

            action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
               component.set("v.opportunities", response.getReturnValue());
            } else{
               component.set("v.opportunities",[]);
            }
});
            $A.enqueueAction(action);
            var action = component.get("c.findAccountAges");
            action.setParam("emails", peopleEmails);

            action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
               component.set("v.accounts", response.getReturnValue());
            } else{
               component.set("v.accounts",[]);
            }
});
$A.enqueueAction(action);
}
})