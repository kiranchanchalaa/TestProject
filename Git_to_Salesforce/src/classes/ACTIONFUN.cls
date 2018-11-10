public class ACTIONFUN {
    public boolean showtext{set;get;}
    public account accs{set;get;}
    public opportunity opty{set;get;}
    public string test {set;get;}
    
    
    public ACTIONFUN(){
        accs=new Account();
        showtext=false;
        opty=new opportunity();
        showtext=false;
    }
    public pageReference accountstatus(){
        if(accs.Rating=='HOT'){
            showtext=true;
        }else{
            showtext=false;
             apexPages.Message msg= new apexPages.Message(ApexPages.Severity.FATAL, 'my error msg');
               ApexPages.addMessage(msg);
        }
        return null;
    }
    public pageReference opportunitystatus(){
        if(opty.StageName=='closed won'){
            showtext=true;
            test='kiran';
        }else{
            showtext=false;
             apexPages.Message msg= new apexPages.Message(ApexPages.Severity.FATAL, 'my error msg');
               ApexPages.addMessage(msg);
        }
        return null;
        
    }  
   

}