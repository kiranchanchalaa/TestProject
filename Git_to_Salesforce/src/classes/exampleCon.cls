public class exampleCon {
    
    string uname;
    
    public string getusername(){
        return uname;
    }
    
    public Pagereference sayHello(){
      uname=UserInfo.getName();
        return null;
    }
    
    public void setState(string n){
        State = n;
    }
    public string getState(){
        return State;
    }
    public PageReference methodone(){
        return null;
    } 
    private string State = 'no'; 
}