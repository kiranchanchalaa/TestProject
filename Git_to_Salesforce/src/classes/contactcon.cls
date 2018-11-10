public class contactcon{   
public contact con;
    
public contactcon(ApexPages.StandardController controller){ 
  id currentpageid=ApexPages.currentPage().getparameters().get('id');
    con=[select id,AccountID,LastName, FirstName from contact where id=:currentpageid];
    System.debug('AccountID=======>'+con.AccountID);
}
public PageReference  Edit(){       
         PageReference  p=new PageReference('https://ammukiran-dev-ed.my.salesforce.com/'+ con.AccountID+'/e');
         p.setRedirect(true);
        return p;
    }
}