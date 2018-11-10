public class DatbaseErrorexample {
    
    public DatbaseErrorexample(){
       list<Account> accs=new list<Account>{
            new Account(name='testdb'),
            new Account()
        };
        Database.SaveResult[] srList = Database.insert(accs,false);
        for(Database.SaveResult sr: srList){
            if(sr.isSuccess()){
                System.debug('Record Inseted Sucessfully===>'+sr.getid());
            }else{
                System.debug('Syetem Record Inseration Failed ====='+sr.getId());
                System.debug('Syetem Record Inseration Failed ====='+sr.getErrors());
                System.debug('Syetem Record Inseration Failed ====='+sr.errors);
              //  System.debug('Syetem Record Inseration Failed ====='+sr.getFields());
            }
        }
    }

}