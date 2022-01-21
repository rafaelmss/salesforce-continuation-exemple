public with sharing class IntegrationController {

    //Método de chamada do serviço e retrono do dado para o componente
    @AuraEnabled(cacheable=false)
    public static String fetchData(String method, String endpoint) {

        //Gera a instânca da Service
        IntegrationService service = new IntegrationService(method,endpoint);

        //Executa e retorna o conteúdo do corpo da resposta
        return service.execute();
    }

    //Método de chamada do serviço com Continuation e retrona
    //o envelope com a requisição à ser executada no Contination Server
    @AuraEnabled(continuation=true cacheable=false)
    public static Object fetchAsyncData(String method, String endpoint) {

        //Gera a instânca da Service
        IntegrationService service = new IntegrationService(method,endpoint);

        //Executa e retorna o envelope do Continuation
        return service.executeAsync();
    }

    //Método a ser chamado do componente quando a requisição envelopada no
    //Continuation estiver executada
    @AuraEnabled(cacheable=false)
    public static String processAsyncResponse(List<String> labels, Object state) {

        //Busca por indexação a resposta da requisição inserida no envelope
        HttpResponse response = Continuation.getResponse(labels[0]);

        //Retorna o conteúdo da resposta da requisição
        return response.getBody();
    }
}
