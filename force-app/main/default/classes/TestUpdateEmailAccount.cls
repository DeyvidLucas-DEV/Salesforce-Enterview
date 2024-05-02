@isTest
private class TestUpdateEmailAccount {
    @isTest
    static void testUpdateEmailAccount() {
        Country__c country = new Country__c(
            Name = 'Brasil',
            acronym__c = 'BR'
        );
        insert country;

        Account testAccount = new Account(
            Name = 'Test Account',
            Retrive_email__c = true,
            Email__c = 'test@example.com',
            Country__c = country.Id 
        );
        insert testAccount;

        // Acionamento da trigger
        Test.startTest();
        update testAccount;
        Test.stopTest();

        List<EmailMessage> sentEmails = [SELECT Id, ToAddress, Subject, TextBody FROM EmailMessage];
        System.assertEquals(2, sentEmails.size());

        // Verificar o conteudo do e-mail
        EmailMessage sentEmail = sentEmails[0];
        System.assertEquals('test@example.com', sentEmail.ToAddress);
        System.assertEquals('Boas vindas!', sentEmail.Subject);
        System.assert(sentEmail.TextBody.contains('Olá, Test Account!'));
        System.assert(sentEmail.TextBody.contains('Bem vindo a Globo'));
    }
}