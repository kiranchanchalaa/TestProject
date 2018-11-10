global  class Util{
    public static boolean ammukirru=false;
   @future
	public static void insertUserWithRole(String uname, String al, String em, String lname){
		 Profile  p=[SELECT Id FROM Profile WHERE Name='Standard User'];
		 userRole r=[SELECT Id FROM UserRole WHERE Name='COO'];
		   user  u=new user(
		    alias = al, email=em,
            emailencodingkey='UTF-8', lastname=lname, 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username=uname		   
		   );
        try{
         insert u;   
        }catch(Exception e){
         System.debug(e);   
        }
    }
        public static void ammu(){
            ammukirru=true;
           list<account> acc=new list<account>();
        account a=new account();
        a.Name='dmlExaption test';
         try{
         insert a;
        }catch(Exception e){
         System.debug(e);   
        } 
        }  
/*
One of the following limits can be doubled or tripled for each future method.
Heap size
CPU timeout

Number of SOQL queries
Number of DML statements issued
Number of records that were processed as a result of DML operations, Approval.process, or Database.emptyRecycleBin
@future(limits='2xHeap')	Heap size limit is doubled (24 MB).
@future(limits='3xHeap')	Heap size limit is tripled (36 MB).
@future(limits='2xCPU')	CPU timeout is doubled (120,000 milliseconds).
@future(limits='3xCPU')	CPU timeout is tripled (180,000 milliseconds).
@future(limits='2xSOQL')	Number of SOQL queries limit is doubled (400).
@future(limits='3xSOQL')	Number of SOQL queries limit is tripled (600).
@future(limits='2xDML')	Number of DML statements limit is doubled (300).
@future(limits='3xDML')	Number of DML statements limit is tripled (450).
@future(limits='2xDMLRows')1	Number of records that were processed as a result of DML operations is doubled (20,000).
@future(limits='3xDMLRows')1	Number of records that were processed as a result of DML operations is tripled (30,000).
*/	
}