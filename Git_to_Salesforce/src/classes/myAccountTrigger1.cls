@istest
public class myAccountTrigger1 {
    public static testmethod void insertupdatedeleteundelete(){
        account a=new account(name='Test 1');
        insert a;
        a.name='test 2';
        update a;
        delete a;
        undelete a;
    }
}