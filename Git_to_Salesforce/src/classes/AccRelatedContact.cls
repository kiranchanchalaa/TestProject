public class AccRelatedContact {

    public list<account> accs=new list<Account>([select id,name,(select id,accountId,Lastname from contacts)from account]);
    public list<contact> ac {set;get;} 
    
    public void AccRelatedContact(){ 
        ac=new list<Contact>();
        for(Account a: accs){
         ac=a.contacts;        
   }         
  }
}