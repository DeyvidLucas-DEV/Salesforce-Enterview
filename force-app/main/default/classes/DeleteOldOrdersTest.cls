@isTest
    private class DeleteOldOrdersTest {
        
        @isTest
        static void testNoDeleteOldOrders() {
            // Crie um país de teste
            Country__c country = new Country__c(
                Name = 'Brasil',
                acronym__c = 'BR'
            );
            insert country;
    
            // Crie uma conta de teste e associe-a ao país criado
            Account testAccount = new Account(
                Name = 'Test Account',
                Retrive_email__c = true,
                Email__c = 'test@example.com',
                Country__c = country.Id 
            );
            insert testAccount;
            
            List<Pedido__c> testOrders = new List<Pedido__c>();
            for(Integer i = 0; i < 10; i++) {
                testOrders.add(new Pedido__c(
                     Order_Name__c	 = 'Pedido 1',
                    Contrato__c = '800aj000008mRd2AAE',
                    Conta__c = testAccount.Id 
                ));
            }
            insert testOrders;
    
            System.assertEquals(10, [SELECT COUNT() FROM Pedido__c]);
    
            // Inicie o teste do processo em lote
            Test.startTest();
            DeleteOldOrders scheduler = new DeleteOldOrders();
            scheduler.execute(null);
            Test.stopTest();
    
            // Verifique se os pedidos novos nao foram excluidos
            System.assertEquals(0, [SELECT COUNT() FROM Order]);
        }
        
         @isTest
        static void testDeleteOldOrders() {
            // Crie um país de teste
            Country__c country = new Country__c(
                Name = 'Brasil',
                acronym__c = 'BR'
            );
            insert country;
    
            // Crie uma conta de teste e associe-a ao país criado
            Account testAccount = new Account(
                Name = 'Test Account',
                Retrive_email__c = true,
                Email__c = 'test@example.com',
                Country__c = country.Id 
            );
            insert testAccount;
            
            List<Pedido__c> testOrders = new List<Pedido__c>();
            for(Integer i = 0; i < 10; i++) {
                testOrders.add(new Pedido__c(
                   Order_Name__c = 'Pedido 1',
                    Contrato__c = '800aj000008mRd2AAE',
                    Conta__c = testAccount.Id 
                ));
            }
            insert testOrders;
    
            System.assertEquals(10, [SELECT COUNT() FROM Pedido__c]);
    
            // Inicie o teste do processo em lote
            Test.startTest();
            DeleteOldOrders scheduler = new DeleteOldOrders();
            scheduler.execute(null,testOrders);
            Test.stopTest();
    
            // Verifique se os pedidos novos nao foram excluidos
            System.assertEquals(0, [SELECT COUNT() FROM Pedido__c]);
        }
    }