global class DeleteOldOrders implements Schedulable, Database.Batchable<sObject> {
    
    // Processo iniciado em lote 
    global Database.QueryLocator start(Database.BatchableContext BC) {
        Date threeMonthsAgo = Date.today().addMonths(-3);
        return Database.getQueryLocator([
            SELECT Id
            FROM Pedido__c
            WHERE LastModifiedDate < :threeMonthsAgo
        ]);
    }

    // Processa os registros em lote
    global void execute(Database.BatchableContext BC, List<Pedido__c> scope) {
        delete scope;
    }

    global void finish(Database.BatchableContext BC) {
    }

    // Agenda a execucao do processo em lotes
    global void execute(SchedulableContext sc) {
        Database.executeBatch(this, 200); 
    }
}