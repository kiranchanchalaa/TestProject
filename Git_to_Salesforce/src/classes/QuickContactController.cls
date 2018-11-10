public with sharing class QuickContactController {
@AuraEnabled
    public static account getAccount(id accountId){
        return[SELECT Name, BillingCity, BillingState FROM Account WHERE Id=:accountId];
    }
    @auraEnabled
    public static contact saveContactWithAccount(contact contact,id accountId){
        contact.accountId=accountId;
        upsert contact;
        return contact;
    }
}