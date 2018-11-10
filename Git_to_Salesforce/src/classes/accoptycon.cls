public class accoptycon {
    public list<Account> accopty{set;get;}
    public accoptycon(){
        accopty=[select id,name,(Select id,AccountId from Opportunities),(select id,Lastname,AccountId from contacts)from Account];
    }   
}