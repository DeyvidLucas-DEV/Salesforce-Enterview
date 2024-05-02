@isTest
public class TestOrderInsertController {

    @isTest 
    public static void testMethodPositive() {
        
        // Criação de país para uso na criação de conta
        Country__c country = new Country__c(
            Name = 'Brasil',
            acronym__c = 'BR'
        );
        insert country;

        // Criação de uma conta para uso no teste
        Account testAccount = new Account(
            Name = 'Test Account',
            Retrive_email__c = true,
            Email__c = 'test@example.com',
            Country__c = country.Id 
        );
        insert testAccount;
        
        // Criação de um contrato para associar à conta
        Contract contrato = new Contract();
        contrato.AccountId = testAccount.Id;
        contrato.Status = 'Draft';
        contrato.StartDate =  Date.today();
        contrato.ContractTerm = 12; 
        insert contrato;
         
        
        Test.startTest();
        OrderInsertController.insertOrders('Pedido1', testAccount.Id, contrato.Id);
        Test.stopTest(); 
    }
}