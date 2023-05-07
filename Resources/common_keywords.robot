*** Settings ***
Library           ../Resources/EnvLoadjson.py
Resource          ../config/CommonConfig.txt
Library           ReadJSON.py

*** Variables ***
${EnvironmentValue}   DATA_SITE_1
*** Keywords ***
SDG_BNE_SUITE_SETUP
    [Arguments]    ${file_name}=None
    log     ${CONFIG_PATH}
    ${Which-Lab}    SET VARIABLE    ${EnvironmentValue}
    SET GLOBAL VARIABLE    ${Which-Lab}
    log   ${CONFIG_PATH}
    LOAD_ENVIRONMENT_VARIABLES    ${CONFIG_PATH}    ${EnvironmentValue}

READ_JSON_FILE
  ${data_readed} =  read_content
  [Return]  ${data_readed}

WELCOME_START
   [Documentation]   This is welcome
   Log    This is welcome

WELCOME_END
   [Documentation]   This is welcome  end
   Log   This is welcome end

SUITE_END
   [Documentation]   suite end
   Log   suite end