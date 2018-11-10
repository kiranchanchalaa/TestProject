public class customiterbleexample1 implements Iterator<contact>{
    
    list<contact> con{get;set;}    
    integer i{get;set;}
    public customiterbleexample1(){
        con=[select id,lastname,phone,Account.name,Account.phone,AccountId from contact where name='kiran'];
        i=0;
    }
    public boolean hasnext(){
        if(con.size()>0){
            return true;
        }else{
            return false;
        }
    }
    public contact next(){
        if(i==0){return null;}
        i++;
        return con[i-1];
            
    }
}