({
	myAction : function(component, event, helper) {
		var pageName = prompt('Visualforce page name:'); 
    $A.get("e.force:navigateToURL").setParams(
        {"https://ammukiran-dev-ed--c.ap5.visual.force.com": "/apex/" + pageName}).fire();
	}
})