public class DuplicateResultClassHandeller {
    
    private final contact contact;
    
    private list<sobject> duplicateRecords;
    
    public boolean hasDuplicateResult{get;set;}

    public DuplicateResultClassHandeller(){
        Id id=ApexPages.currentPage().getparameters().get('id');
        this.contact=(id == null)? new contact():
        [select id,lastname,phone,accountId from contact where id=:id];
            
           this.duplicateRecords=new list<sobject>();
            this.hasDuplicateResult=false;
    }
    public contact getcontact(){
        return this.contact;
    }
}