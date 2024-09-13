*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse a To-Do List
Test Teardown    Fechar o navegador

*** Test Cases ***
Verificar se ao preencher corretamente os campos da formulário, a tarefa é inserida na lista
    Dado que eu preencha os campos da Tarefa
    E clique no botão Adicionar Tarefa
    Então a tarefa deve aparecer na lista de tarefas

Verificar se ao clicar em editar após inserir uma tarefa, é possível editar esta corretamente tarefa
    Dado que eu preencha os campos da Tarefa
    E clique no botão Adicionar Tarefa
    E clique no botão Editar
    E edite os campos da Tarefa
    Então o modal com a mensagem de sucesso deve ficar visível

Verificar se ao clicar em deletar após inserir uma tarefa, a tarefa é excluída corretamente
    Dado que eu preencha os campos da Tarefa
    E clique no botão Adicionar Tarefa
    E clique no botão Deletar
    Então o modal com a mensagem de exclusão deve ficar visível