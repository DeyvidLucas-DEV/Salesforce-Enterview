@RestResource(urlMapping='/insertOrders')
global class OrderInsertController {

    @HttpPost
    global static void insertOrders(String nome,String idConta,String idContrato) {
      Pedido__c pedido = new Pedido__c();
        
        pedido.Order_Name__c = nome;
        pedido.Conta__c = idConta;
        pedido.Contrato__c = idContrato;
        
        try {
            insert pedido;
        } catch(Exception e) {
            RestContext.response.responseBody = Blob.valueOf(e.getMessage());
        }
    }
}