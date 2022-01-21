# Continuation - Exemple

![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)

Projeto base destinado ao estudo e aplicação de recurso "Continuation" disponibilizado em ORGs Salesforce para execução assíncrona de chamadas de longa duração (acima de 5 segundos).

> Every org has a limit on long-running requests that run for more than 5 seconds (total execution time). HTTP callout processing time is not included when calculating this limit. We pause the timer for the callout and resume it when the callout completes. See Execution Governors and Limits for Lightning Platform Apex limits.

## Conteúdo do Pacote

- Aplicativo customizado
- Página Lightning de Home do aplicativo
- Permissionset com acesso ao aplicativo
- Componente LWC para teste de chamadas
- Classes Apex 
- Configuração de sitee remoto para URL da chamada
- Configuração de Satcch ORG

Após a implantação do projeto, é necessário adicionar o Permission Set ao usuário para ganhar acesso ao aplicativo já configura para testes e chamadas.

Caso seja necessário trocar a URL de teste, é possível acessar o parâmetro na configuração do componente via  App Builder e deve ser feito também a atualização da configuração de acesso remoto para liberar acesso ao domínio da URL.

# Criação da ORG de Desenvolvimento

Para criar uma ORG de desenvolvedor e possível acessar [SALESFORCE DEV ORG](https://developer.salesforce.com/signup), criar uma ORG própria e habilitar o recurso [DEVHUB](https://help.salesforce.com/s/articleView?id=sf.sfdx_setup_enable_devhub.htm&type=5)

## Deploy

Faça o download ou clone deste repositório
```sh
sfdx force:source:push -f
```

Faça login em sua ORG de desenvolvimento à partir do VS Code
```sh
sfdx force:auth:web:login -r https://login.salesforce.com
```

Crie uma Scratch ORG à partir de sua ORG de desenvolvimento (DevHub de estar habilitado)
```sh
sfdx force:org:create -f config/enterprise-scratch-def.json
```

Faça deploy do repositório para seu ambiente Scratch
```sh
sfdx force:source:push -f
```

## Referências

- [Avoiding Apex Speeding Tickets (Concurrent Request Limits via Synchronous Callouts)](https://developer.salesforce.com/blogs/engineering/2015/11/avoiding-the-concurrent-request-limit-via-synchronous-callout-optimization)
- [Callout Limits and Limitations](https://developer.salesforce.com/docs/atlas.en-us.236.0.apexcode.meta/apexcode/apex_callouts_timeouts.htm)
- [Make Long-Running Callouts with Continuations](https://developer.salesforce.com/docs/atlas.en-us.lightning.meta/lightning/apex_continuations.htm)
- [Continuation Example (LWC)](https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.apex_continuations_component_example)
