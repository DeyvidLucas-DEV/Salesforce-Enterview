# Configuração Inicial

### Objetivo:

-   Criar uma nova org de desenvolvimento no Salesforce.
-   Criar um aplicativo chamado "Globo" na organização.
-   Criar objetos customizados e campos necessários.
-   Implementar endpoints customizados para operações de Upsert e Insert.
-   Criar um objeto personalizado Pedidos com o intuito de ter maior controle do objeto!


# Passos Realizados:

1.  **Criação da Org:** Foi criada uma nova organização de desenvolvimento no Salesforce através do link fornecido.
    
2.  **Objetos Customizados e Campos:**
    
    -   Foi criado um objeto customizado chamado "País" com os campos Sigla, Moeda e Idioma.
    -   No objeto Conta (Account), foram adicionados três campos customizados:
        -   Um campo de resumo de totalização para o valor total de vendas.
        -   Um campo de relacionamento obrigatório com o objeto País.
        -   Um campo para exibir um resumo das informações do país.
        -
# Automação com Código e Sem Código

### Objetivo:

-   Enviar um e-mail sempre que uma conta for criada ou editada.
-   Incrementar o valor total de vendas da conta relacionada quando uma nova Ordem for criada.

### Passos Realizados:

1.  **Automação com Código (Envio de E-mail):**
    
    -   Utilizou-se um Apex Trigger para capturar eventos de criação e edição de Contas.
    -   Quando acionado, o Trigger dispara um e-mail para o endereço configurado, com as informações relevantes da Conta.
2.  **Automação Sem Código (Incremento do Valor Total de Vendas):**
    
    -   Criou-se um campo de resumo de totalização dentro do objeto personalizado Pedidos!


# Processo de Limpeza Diária

### Objetivo:

-   Deletar Ordens com data de modificação maiores que 3 meses.

### Passos Realizados:

1.  **Implementação do Processo de Limpeza:**
    -   Criou-se um job de agendamento Apex para ser executado diariamente.
    -   Este job executa uma query para selecionar e deletar Ordens com data de modificação maiores que 3 meses por meio de lotes de 200.


# Considerações de Design

-   **Modelo Lwc** Foi utilizado um modelo LWC que se adequasse ao padrão de cores da organização, onde se localiza na parte de **Records -> Account**
-   **Modelo Lwc** Foi utilizado um modelo LWC para padronizar a tela de inicio da organização, juntamente com relatorios e paineis!

