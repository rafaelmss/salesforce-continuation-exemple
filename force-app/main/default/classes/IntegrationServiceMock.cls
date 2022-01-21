@IsTest
public class IntegrationServiceMock implements HttpCalloutMock {

    //Método de montagem da resposta Mock para classe teste
    public HTTPResponse respond(HTTPRequest req) {

        //Cria uma instância da resposta
        HttpResponse response = new HttpResponse();

        //Define por padrão o Status Code como "OK"
        response.setStatusCode(200);

        //Define o indicativo no header da resposta que sinaliza a estrutura
        response.setHeader('Content-Type', 'application/json');

        //Define o corpo da resposta
        response.setBody('{"messge":"teste executado com sucesso"}');

        //Retorna a instância da resposta, simulando a chamada executada
        return response;
    }
}
