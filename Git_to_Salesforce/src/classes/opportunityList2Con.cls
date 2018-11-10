public class opportunityList2Con {

/*    public apexpages.StandardSetController accs{
        get{
            if(accs==null){
     accs=new ApexPages.StandardSetController(Database.QueryLocator([Select name,CloseDate from Opportunity]));
                
            } return accs;
        }set;
    }
        public list<Opportunity> getOpportunities(){
            return (list<Opportunity>) accs.getRecords();
    }
 }*/
    // ApexPages.StandardSetController must be instantiated
    // for standard list controllers
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Name, CloseDate FROM Opportunity]));
            }
            return setCon;
        }
        set;
    }

    // Initialize setCon and return a list of records
    public List<Opportunity> getOpportunities() {
        return (List<Opportunity>) setCon.getRecords();
    }
}