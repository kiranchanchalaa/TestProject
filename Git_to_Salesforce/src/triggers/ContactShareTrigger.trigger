trigger ContactShareTrigger on Contact (after insert) {
    
    user u=[select id from user where alias='integ'];
    list<contactShare> con=new list<contactShare>();
    for(contact c: trigger.new){
        if(c.LeadSource=='Phone Inquiry'){
            contactShare c1=new contactShare();
            c1.ContactId=c.Id;
            c1.ContactAccessLevel='Edit';
            c1.UserOrGroupId=u.id;
            c1.RowCause='Manual';
            con.add(c1);
        }
    } insert con;

}