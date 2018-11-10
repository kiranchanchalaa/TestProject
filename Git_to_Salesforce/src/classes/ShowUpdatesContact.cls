@RestResource(urlMapping='/ShowContacts/*')
global class ShowUpdatesContact{
     
    @HttpGet
    global static list<contact> getcontacts(){
        list<contact> con;
        try{
          con=[select id,phone,Lastname from contact]; 
            return con;
        }catch(Exception e){
            System.debug('error msg'+e.getMessage());
            return con;
        }
    }
    
 
}