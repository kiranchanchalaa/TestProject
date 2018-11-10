({
	handleClick : function(component, event, helper) {
		 var buttonName = event.getSource().get("v.name");
        console.log(buttonName);
       },
    
    handleActive:function(cmp,event){
         var tab = event.getSource();
          switch (tab.get('v.id')) {
              case 'tab1':
               //do something when tab2 is clicked
            var itemValue =event.getParam("label");
             console.log(itemValue);   
             cmp.set("v.tabvalues",itemValue);  
                  break;
              case 'tab2':
            var itemValue1 =event.getParam("label");
             console.log(itemValue1);   
             cmp.set("v.tabvalues",itemValue1);
                  //do something when tab2 is clicked
                  break;
        } 
    }
})