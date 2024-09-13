*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${INPUT_TASK}    id=task-input
${TASK}    Realizar testes automatizados utilizando Robot Framework
${TASK_EDIT}    Realizar testes automatizados utilizando Cypress
${INPUT_DATE}    id=task-due-date
${DATE}    20-09-2024
${DATE_EDIT}    21-09-2024
${SELECT_PRIORITY}    id=task-priority
${PRIORITY}    alta
${PRIORITY_EDIT}    baixa
${BUTTON_ADD}    id=btn-add
${BUTTON_SAVE_EDIT}    id=btn-edit
${SPAN_ID}          task-span
${TEXT_LIST}    Realizar testes automatizados utilizando Robot Framework - 2024-09-20 - Prioridade: alta
${BUTTON_EDIT}    class=edit-btn
${MODAL}    id=success-modal
${BUTTON_DELETE}    class=delete-btn
${MODAL_DELETE}    id=delete-modal

*** Keywords ***
Dado que eu preencha os campos da Tarefa
    Input Text    ${INPUT_TASK}    ${TASK}
    Input Text    ${INPUT_DATE}    ${DATE}
    Select From List By Value    ${SELECT_PRIORITY}    ${PRIORITY}
E clique no botão Adicionar Tarefa
    Click Element    ${BUTTON_ADD}
Então a tarefa deve aparecer na lista de tarefas
    Element Should Be Visible    id=${SPAN_ID}
    Element Text Should Be    id=${SPAN_ID}    ${TEXT_LIST}
E clique no botão Editar
    Click Element    ${BUTTON_EDIT}
E edite os campos da Tarefa
    Input Text    ${INPUT_TASK}    ${TASK_EDIT}
    Input Text    ${INPUT_DATE}    ${DATE_EDIT}
    Select From List By Value    ${SELECT_PRIORITY}    ${PRIORITY_EDIT}
    Click Element    ${BUTTON_SAVE_EDIT}
Então o modal com a mensagem de sucesso deve ficar visível
    Element Should Be Visible    ${MODAL}
E clique no botão Deletar
    Click Element    ${BUTTON_DELETE}
Então o modal com a mensagem de exclusão deve ficar visível
    Element Should Be Visible    ${MODAL_DELETE}
Dado que eu clique em Adicionar Tarefa sem preencher o primeiro campo
    Click Element    ${BUTTON_ADD}
Dado que eu clique em Adicionar Tarefa sem preencher o segundo campo
    Input Text    ${INPUT_TASK}    ${TASK}
    Click Element    ${BUTTON_ADD}
Dado que eu clique em Adicionar Tarefa sem preencher o terceiro campo
    Input Text    ${INPUT_TASK}    ${TASK}
    Input Text    ${INPUT_DATE}    ${DATE}
    Click Element    ${BUTTON_ADD}
Então página deve apresentar mensagem de campo obrigatório
    ${validation_message}=    Get Element Attribute    ${INPUT_TASK}    validationMessage
    Should Be Equal    ${validation_message}    Preencha este campo.
Então página deve apresentar mensagem de data obrigatória
    ${validation_message}=    Get Element Attribute    ${INPUT_DATE}    validationMessage
    Should Be Equal    ${validation_message}    Preencha este campo.
Então página deve apresentar mensagem para selecionar um item da lista
    ${validation_message}=    Get Element Attribute    ${SELECT_PRIORITY}    validationMessage
    Should Be Equal    ${validation_message}    Selecione um item da lista.