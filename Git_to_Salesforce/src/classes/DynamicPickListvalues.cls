public class DynamicPickListvalues{
    
  public DynamicPickListvalues(){
        list<string> psk=new list<string>();
        Schema.DescribeFieldResult dsc=Account.Industry.getDescribe();
        list<Schema.PicklistEntry> ple=dsc.getPickListValues();
        for(Schema.PicklistEntry pickvalue: ple){
             psk.add(pickvalue.getLabel());
        }
         System.debug(psk);
    }  

}