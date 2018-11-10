public class CustomSettingExample {
   
   public CustomSettingExample(){
    IndianStates__c k=	IndianStates__c.getInstance('AP'); 
        system.debug(k);
    }
}