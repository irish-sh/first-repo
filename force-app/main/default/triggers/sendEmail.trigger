trigger sendEmail on Opportunity (after update) {
    for(Opportunity o : trigger.new){
        if(o.StageName == 'Closed Won'){
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            String[] add = 'shirish.kumar@iiitg.ac.in';
            email.setToAddresses(add);
            email.setSubject('Congratulations! The deal is successfuly closed.');
            email.setPlainTextBody('Delighted to inform the deal has been successfuly closed.');
        }
    }
}