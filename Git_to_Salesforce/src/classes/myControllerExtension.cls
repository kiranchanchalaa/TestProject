public class myControllerExtension {
 final Account acc;
    
    public myControllerExtension(Apexpages.StandardController  stdcontror){
       this.acc=(Account)stdcontror.getRecord();
        
    }
    public string getGreeting(){
        return 'hello'+acc.Name+ '('+acc.Id+')';
    }    
}