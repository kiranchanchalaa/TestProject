public class actionFunctionDevloperGaidExample {
    
    string name;
    
    public string getUsername(){
        return name;
    }
    public PageReference sayhello(){
        name=userinfo.getName();
        return null;
    }
    public void setState(string n){
        state=n;
    }
    public string getState(){
        return state;
    }
    public PageReference methodone(){        
        return null;
    }
    private string state='no';

}