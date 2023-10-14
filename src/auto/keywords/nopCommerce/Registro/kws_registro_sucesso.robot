*** Settings ***
Documentation    Keywords da tela de registro do nopCommerce

Resource         ../../../../config/main.resource

*** Keywords ***
que o usuario esteja na tela de registro
    que o usuário esteja na tela de Home do nopCommerce
    Title Should Be                      ${pg_Registro.title}
    Wait Until Element Contains          ${pg_Registro.subtitle}    text=Your Personal Details

preenche os campos obrigatórios
    Massa de Testes Aleatórias
    Wait Until Element Is Visible        css=${pg_Registro.checkbox_male}           ${TIMEOUT.MINIMAL}    
    Select Radio Button                  Gender                                     M                                         
    Radio Button Should Be Set To        Gender                                     M
    Wait Until Element Is Visible        css=${pg_Registro.input_firstName}         ${TIMEOUT.MINIMAL}  
    Input Text                           css=${pg_Registro.input_firstName}         ${FirstName_TEST}     
    Wait Until Element Is Visible        css=${pg_Registro.input_lastName}          ${TIMEOUT.MINIMAL}  
    Input Text                           css=${pg_Registro.input_lastName}          ${LastName_TEST}
    Wait Until Element Is Visible        css=${pg_Registro.select_day}              ${TIMEOUT.MINIMAL}  
    Select From List By Value            css=${pg_Registro.select_day}              28
    Wait Until Element Contains          css=${pg_Registro.day_option_28}           28
    #${days} =                            Run Keyword                                Generate Random Day
    #${year} =                            Run Keyword                                Generate Random Year
    #${month} =                           Run Keyword                                Generate Random Month
    Select From List By Value            css=${pg_Registro.select_month}            10
    Wait Until Element Contains          css=${pg_Registro.month_option_10}         October
    Select From List By Value            css=${pg_Registro.select_year}             1999
    Wait Until Element Contains          css=${pg_Registro.year_option_1999}        1999
    Wait Until Element Is Visible        css=${pg_Registro.input_email}             ${TIMEOUT.MINIMAL}  
    Input Text                           css=${pg_Registro.input_email}             ${EMAIL_TEST}
    Wait Until Element Is Visible        css=${pg_Registro.input_nameCompany}       ${TIMEOUT.MINIMAL}        
    Input Text                           css=${pg_Registro.input_nameCompany}       ${Company_TEST}
    Scroll Element Into View             css=${pg_Registro.btn_register}  
    Select Checkbox                      css=${pg_Registro.input_newsletter} 
    Checkbox Should Be Selected          css=${pg_Registro.input_newsletter}          
    Input Password                       css=${pg_Registro.input_password}          apresentacao
    Input Password                       css=${pg_Registro.input_confirmPassword}   apresentacao
clica no botão de registro
    Wait Until Element Is Visible        css=${pg_Registro.btn_register}            ${TIMEOUT.MINIMAL}
    Click Element                        css=${pg_Registro.btn_register}        
o sitema deve exibir uma mensagem que o registro foi realizado sucesso.      
    Wait Until Element Is Visible        css=${pg_Registro.message_sucess}          ${TIMEOUT.MINIMAL}