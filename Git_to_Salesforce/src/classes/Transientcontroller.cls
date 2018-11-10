public class Transientcontroller {
     datetime t1;
    Transient datetime t2;
    
    public datetime gett1(){
        if(t1==null) t1=System.now();
        return t1;
    }
    public datetime gett2(){
        if(t2==null)
            t2=system.now();
        return t2;
    }
}