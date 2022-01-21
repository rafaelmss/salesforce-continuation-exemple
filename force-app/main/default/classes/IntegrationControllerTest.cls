@IsTest
private class IntegrationControllerTest {

    //Método para testar a chamada de dados do serviço, conforme o componente executa de maneira síncrona 
    @IsTest
    static void executeControllerTest() {

        //Define a classe Mock para simular a resposta da chamada
        Test.setMock(HttpCalloutMock.class, new IntegrationServiceMock());

        //Inicia o contexto do processamento do teste
        Test.startTest();

        //Executa a chamada síncrona da mesma maneira que o componente irá executar
        String response = IntegrationController.fetchData('POST','http://test.com');
        
        //Finaliza contexto do processamento do teste
        Test.stopTest();

        //Verifica se a resposta obtida é de fato a mesma determinada na classe mock
        System.assertEquals('{"messge":"teste executado com sucesso"}', response, 'Deve retornar a mensagem de teste');
    }

    //Método para testar a chamada de dados do serviço, conforme o componente executa de maneira síncrona 
    //com o retorno do envelope do Continuation (não necessita de um Mock Class)
    @IsTest
    static void executeAsyncControllerTest() {

        //Inicia o contexto do processamento do teste
        Test.startTest();

        //Executa a chamada de forma ascíncrona e recebe um Continuation Data
        Object continuationData = IntegrationController.fetchAsyncData('POST','http://test.com');

        //Verifica se o envelope do Continuation é válido
        System.assertNotEquals(null, continuationData, 'Deve retornar a instância do Continuation');

        //Executa o processamento da resposta, acionado pelo Continuation
        try {
            IntegrationController.processAsyncResponse(
                new List<String>{'Continuation-1'},
                'Hello, my state controll!'
            );
            System.assert(false, 'Obrigatoriamente deve falhar por não existir de fato uma instância do Continuation no teste');
        } catch (Exception ex) {
            System.assertNotEquals(null,ex.getMessage(),'Processaento deve gerar uma exception válida');
        }
        
        //Finaliza contexto do processamento do teste
        Test.stopTest();
    }
}
