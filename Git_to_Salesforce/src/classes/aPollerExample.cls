public class aPollerExample {
  integer count =0;
   
    public pageReference incrementCounter(){
        count++;
        return null;
    } 
    public integer getCount(){
        return count;
    }
}