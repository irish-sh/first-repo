trigger countContacts on Contact (after insert, after update, after delete, after undelete) {
    // Every Contact associated to an Account should be counted
    // for each event on contact, capture account Id associated
    // now run a query on account to capture id, name and contact_count to update and store final account

    Set<Id> accId = new Set<Id>();
    List<Account> accls = new List<Account>(); 
    if(trigger.isInsert || trigger.isUndelete){
        for(Contact ct : trigger.new){
            accId.add(ct.AccountId);
        }
    }
    if(trigger.isUpdate || trigger.isDelete){
        for(Contact ct : trigger.old){
            accId.add(ct.AccountId);
        }
    }

    for(Account acc : [Select Id, Name, Number_of_contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accId]){
        Account accObj = new Account();
        accObj.Id = acc.Id;
        accObj.Number_of_contacts__c = acc.Contacts.size();
        accls.add(accObj);
    }
    update accls;
}