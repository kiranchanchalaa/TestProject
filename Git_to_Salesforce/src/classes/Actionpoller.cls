// Actionpoller Example
public class Actionpoller{
    public string name{set;get;}
    public integer count{set;get;}
   
    public Actionpoller(){
        name=userinfo.getName();
        count=10;
    }
    public void startcounting(){
        name=userinfo.getName()+'after'+count+'seconds';
        count+=10;
    }
    
}