@IsTest
private class IntegrationServiceTest {

    //Método para teste da chamada do serviço tradicional
    @IsTest
    static void executeServiceTest() {

        //Cria uma instância da classe Service, definindo os parâmetros do contrutor
        IntegrationService service = new IntegrationService('POST','http://test.com');

        //Define a classe Mock para simular a resposta da chamada
        Test.setMock(HttpCalloutMock.class, new IntegrationServiceMock());

        //Inicia o contexto do processamento do teste
        Test.startTest();

        //Realiza a chamada (que na realidade simula a resposta conforme a classe IntegrationServiceMock)
        String response = service.execute();

        //Finaliza contexto do processamento do teste
        Test.stopTest();

        //Verifica se a resposta obtida é de fato a mesma determinada na classe mock
        System.assertEquals('{"messge":"teste executado com sucesso"}', response, 'Deve retornar a mensagem de teste');
    }

    //Método para teste da chamada do serviço com Continuation (não necessita de um Mock Class)
    @IsTest
    static void executeAsyncServiceTest() {

        //Cria uma instância da classe Service, definindo os parâmetros do contrutor
        IntegrationService service = new IntegrationService('POST','http://test.com');

        //Inicia o contexto do processamento do teste
        Test.startTest();

        //Realiza a chamada assíncrona que deve devlver a instância do continuation
        Object continuationData = service.executeAsync();

        //Finaliza contexto do processamento do teste
        Test.stopTest();

        //Verifica se a resposta obtida é de fato a mesma determinada na classe mock
        System.assertNotEquals(null, continuationData, 'Deve retornar a intância válida do continuation');
    }
}
