@istest
public class OwnerReassignmentTest {
    private static testMethod void testbatch(){
        user u = [SELECT ID, UserName FROM User 
             WHERE username='kiran@chanchalaa.com'];
         user u2 = [SELECT ID, UserName FROM User 
              WHERE username='integration@00d7f000001cqlruaa.com'];
        
        String u2id = u2.id;
        list<account> a=new list<account>();
        for(integer i=0; i<200; i++){
             account s=new account(name ='testbatch'+'i');
             a.add(s);
        }
        insert a;
        Test.startTest();
        BatchUserRecordsassin reassign = new BatchUserRecordsassin();
        reassign.query = 'SELECT Id, Name, Ownerid FROM Account ' + 
                'WHERE ownerid=\'' + u.id + '\'';
         reassign.email='kirannaikgugulothu@gmail.com';
        reassign.fromUserId = u.id;
         reassign.toUserId = u2.id;
       ID batchprocessid = Database.executeBatch(reassign);
        Test.stopTest();
        
        System.AssertEquals(
           database.countquery('SELECT COUNT()'
              +' FROM Account WHERE OwnerId=\'' + u2.Id + '\''),
           200);  
   
   }
}