*** Settings ***
Resource    ../main.robot

*** Keywords ***
Dado que eu acesse a To-Do List
    Open Browser    url=https://qa-todolist-app.vercel.app    browser=Chrome

Fechar o navegador
    Close Browser