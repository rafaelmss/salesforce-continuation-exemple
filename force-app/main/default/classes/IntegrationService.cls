public class IntegrationService {

    //Método de chamada (ex: POST, GET, DELETE, etc.)
    private String method;

    //URL do endpoint à ser chamado
    private String endpoint;

    //Método construtor que estabelece o endpoint
    public IntegrationService(String method, String endpoint) {
        this.method = method;
        this.endpoint = endpoint;
    }

    //Método para executar a requisição e retornar o corpo da resposta
    public String execute(){

        //Montagem da requisição com Verbo e URL
        HttpRequest request = new HttpRequest();
        request.setTimeout(120000);
        request.setMethod(this.method);
        request.setEndpoint(this.endpoint);

        //Execução da requisição e retorno da resposta
        HttpResponse response = new Http().send(request);   
        return response.getBody();     
    }

    //Método para Montar o envelope do Continuation com a requisição 
    //e retornar o envelope a ser enviado para processamento no Continaution Server
    public Object executeAsync(){

        //Montagem da requisição com Verbo e URL
        HttpRequest request = new HttpRequest();
        request.setTimeout(120000);
        request.setMethod(this.method);
        request.setEndpoint(this.endpoint);

        //Montagem do envelope do continuation com a instância
        //definindo o tempo de timeout em segundos
        Continuation continuationData = new Continuation(40);

        //Define o nome do método na controller à ser chamado após o
        //término do processamento da requisição
        continuationData.continuationMethod='processAsyncResponse';

        //(Opcional) Controle de objeto à ser passado para o método de 
        //processamento da resposta
        continuationData.state='Hello, my state controll!';

        //Adição da requisição na instância do envelope
        continuationData.addHttpRequest(request);

        //Retorna o envelope do Continuation com toda parametrização 
        return continuationData;     
    }
}
