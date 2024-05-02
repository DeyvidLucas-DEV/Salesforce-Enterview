@isTest
public class TestAccountUpsertController {
	
    @isTest public static void testeMethodPositive(){
        
        Country__c country = new Country__c(
            Name = 'Brasil',
            acronym__c = 'BR'
        );
        insert country;
        String nome = 'Deyvid';
        String numero = '83999999';
        
        Test.startTest();
        AccountUpsertController.upsertAccount(nome,country.Id,numero);
        Test.stopTest();
        
    }
}