public class Contactcurrentpage {
    
    public string currentpageid{get;set;}
    public string parametervalues{get;set;}
    public contact con{get;set;}
    
    public Contactcurrentpage(){
        
        currentpageid=ApexPages.currentPage().getparameters().get('id');
        con=[select id,LastName, FirstName from contact where id=:currentpageid];
    }
}