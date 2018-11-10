global class CustomIterable implements Iterator<Account>{
    list<Account>accs {get;set;}
    integer i{get;set;}
    
    public CustomIterable(){
       accs=[select id,name,NumberOfEmployees from Account WHERE name='AMMU&kiran'];
        i=0;
    }  
    global boolean hasnext(){
        if(i>=accs.size()){
            return false;
        }else{
            return true;           
        }
    }
    global Account next(){
        if(i==8){return null;}
        i++;
        return accs[i-1];
    }
}