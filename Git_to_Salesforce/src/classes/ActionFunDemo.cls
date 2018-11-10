// ActionFunction Example
public class ActionFunDemo {
     public boolean showtxt{set;get;}
    public contact con{set;get;}
    public Account acc{set;get;}
    public opportunity opty{set;get;}
    
  public ActionFunDemo(){
        acc=new Account();
        showtxt = false;
        con =new contact();
         showtxt=false;
        opty=new opportunity();
          showtxt=false;
    }
   public PageReference statuschanged(){
        if(acc.Active__c=='yes'){
            showtxt=true;
        }else{
            showtxt=false;
        }
        return null;
    }
    public pageReference ContactStatus(){
        if(con.LeadSource=='web'){
            showtxt=true;
        }else{
            showtxt=false;
            }
        return null;
       }
    public pageReference optystatus(){
        if(opty.StageName=='closed won'){
            showtxt=true;
        }else{
            showtxt=false;
        }
        return null;
    }
    
}