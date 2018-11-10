public class SoQLInjecation {
     public String name {
        get { return name;}
        set { name = value;}
    } 
    contact queryResult{get;set;}
    public PageReference query() {
        String qryString = 'SELECT Id FROM Contact WHERE ' +
            '(IsDeleted = false and Name like \'%' + name + '%\')';
       queryResult = Database.query(qryString);
        System.debug(queryResult);
        return null;
    }
}