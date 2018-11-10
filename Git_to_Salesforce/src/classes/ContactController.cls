public with sharing class ContactController{
@auraEnabled
    public static list<contact> getContacts(){
        list<contact> contacts=[SELECT Id, Name, MailingStreet, Phone, Email, LeadSource FROM Contact];
              return contacts;
       }

}