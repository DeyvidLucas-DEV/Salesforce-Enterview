trigger updateEmailAccount on Account (after insert, after update) {
    for(Account acc : Trigger.new){
        if(acc.Retrive_email__c == true && acc.Email__c != null) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] {acc.Email__c});
            mail.setReplyTo('deyvidlucas_026@outlook.com');
            mail.setSubject('Boas vindas!');
            mail.setPlainTextBody('Olá, ' + acc.Name + '! \n Bem vindo a Globo');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        	
        }
    }
}