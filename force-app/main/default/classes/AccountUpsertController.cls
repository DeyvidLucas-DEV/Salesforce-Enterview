@RestResource(urlMapping='/upsertAccounts')
global class AccountUpsertController {

  @HttpPost
  global static void upsertAccount(String name, String countryId, String phone) {
    Account acc = new Account();
    acc.Name = name;
    acc.Country__c = countryId;
    acc.Phone = phone;
      
    String nome = name;
      
    try {
      upsert acc;
    } catch (Exception e) {
      RestContext.response.responseBody = Blob.valueOf(e.getMessage());
    }
  }
}