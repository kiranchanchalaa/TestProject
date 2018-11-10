public class Apexcurrentpagesdemo {
    
    public String currentRecordId {get;set;}
     public String parameterValue {get;set;}
      public Account acc{get;set;}
      public contact con{get;set;}
 
    public Apexcurrentpagesdemo(ApexPages.StandardController controller) {
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
        acc = [select id ,name, AccountNumber, Type, Industry from Account where id =: currentRecordId ];
        parameterValue = ApexPages.CurrentPage().getparameters().get('nameParam');
    }

}