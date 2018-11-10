public class ParenttoChildQuery {

    public string kirna;
    public list<Account> accs {set;get;}
    public ParenttoChildQuery(){
       accs =[select id,name,(select id,Lastname,phone from contacts)from Account];
    }    
}