public class myAccountsCon {

    public list<Account> acc{
        get{
        acc=[select name,phone, billingcity, billingstate, billingstreet, billingpostalcode from Account
            where ownerid = :userinfo.getuserid()];
        return acc;
    }set;
    }
}