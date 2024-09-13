*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse a To-Do List
Test Teardown    Fechar o navegador

*** Test Cases ***
Verificar se ao tentar salvar uma tarefa sem preencher o título, a mensagem de campo obrigatório é exibida
    Dado que eu clique em Adicionar Tarefa sem preencher o primeiro campo
    Então página deve apresentar mensagem de campo obrigatório

Verificar se ao tentar salvar uma tarefa sem preencher a data, a mensagem de campo obrigatório é exibida
    Dado que eu clique em Adicionar Tarefa sem preencher o segundo campo
    Então página deve apresentar mensagem de data obrigatória

Verificar se ao tentar salvar uma tarefa sem preencher a prioridade, a mensagem de campo obrigatório é exibida
    Dado que eu clique em Adicionar Tarefa sem preencher o terceiro campo
    Então página deve apresentar mensagem para selecionar um item da lista
    