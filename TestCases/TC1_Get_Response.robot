*** Settings ***
Resource          ../Resources/common_keywords.robot
Library  RequestsLibrary
Library  JSONLibrary
Library    Collections
Library    requests
Test Timeout    2s
Test Setup    WELCOME_START
Test Teardown    WELCOME_END
Suite Setup   SDG_BNE_SUITE_SETUP
Suite Teardown   SUITE_END
#Force Tags   HELLOS
#Default Tags   the
Library           DateTime
Library           String

*** Variables ***

*** Test Cases ***
TC_001_Get_ListUser
     [Tags]  Sanity   Regression
     [Documentation]  Following is details
     ...    ${\n}   1.This is second line
     ...    ${\n}   2.This is second line
     ...    ${\n}   3.This is second line
     ...    ${\n}   4.This is second line
     [Timeout]  1s
     Log   '${get_student_info}'
     create session    mysession     ${API_Base_Endpoint}
     ${response}=    GET On Session    mysession     url=${get_student_info}
     log    ${response}
     log    ${response.status_code}
     ${json_response}=    set variable   ${response.json()}
     Log    ${json_response}
     @{data_response_id_1}=  get value from json  ${json_response}   data[0]
     #${type string}=    Evaluate     type(@{data_response_id_1})
     #Log To Console     ${type string}
     ${value_id} =	Get From Dictionary	@{data_response_id_1}	id
     ${value_id_string}=   Convert To String    ${value_id}
     Log  ${value_id}
     Should Be Equal   ${value_id_string}    1
     ${value_firstname} =	Get From Dictionary	@{data_response_id_1}	first_name
     Should Be Equal    ${value_firstname}    George
     @{data_response_id_2}=  get value from json  ${json_response}   data[1]
     @{data_response_id_3}=  get value from json  ${json_response}   data[2]


TC_002 create new resource
     [Timeout]  1s
     create session    addData     ${API_Base_Endpoint}
     &{body}=  Create Dictionary  "name"=dhoni  "job"="Manager"
     &{header}=  Create Dictionary  "Content-Type"=application/json
     ${response}=    post request    addData     /api/users   data=${body}   headers=${header}
     log    ${response}
     log    ${response.status_code}
     log    ${response.content}

TC_003 delete new resource
     [Tags]  Regression
     [Timeout]  1s
     create session    deletedata     ${API_Base_Endpoint}
     &{body}=  Create Dictionary  "name"=dhoni  "job"="Manager"
     &{header}=  Create Dictionary  "Content-Type"=application/json
     ${response}=    delete request    deletedata     /api/users/1
     log    ${response}
     log    ${response.status_code}
     log    ${response.content}

TC_004 put new resource
     [Tags]  Regression
     [Timeout]  1s
     create session    putData     ${API_Base_Endpoint}
     &{body}=  Create Dictionary  "name"=dhoni  "job"="SR.Manager"
     &{header}=  Create Dictionary  "Content-Type"=application/json
     ${response}=    put request    putData     /api/users/2   data=${body}   headers=${header}
     log    ${response}
     log    ${response.status_code}
     log    ${response.content}


TC_002 create new resource with json file
     [Tags]  Regression
     [Timeout]  1s
     create session    addData     ${API_Base_Endpoint}
     &{header}=  Create Dictionary  "Content-Type"=application/json
     ${data_FROM_JSON_FILE}=   READ_JSON_FILE
     log  ${data_FROM_JSON_FILE}
     ${response}=    post request    addData     /api/users   data=${data_FROM_JSON_FILE}   headers=${header}
     log    ${response}
     log    ${response.status_code}
     log    ${response.content}

TC_001 FOR LOOP TEST CASE
  [Documentation]   Comments Added with TEST
  [Tags]   LOOP
  FOR  ${i}  IN  element1   element2   element3
     log  i
     IF    $i == "element2"
           log  value found
           BREAK
     END
  END
  &{dictionary}=  Create Dictionary   e1="FirstElement"   e2="FirstElement"   e3="FirstElement"
  Log   ${dictionary}
  FOR  ${KEY}   ${VALUE}  IN  &{dictionary}
       Log   ${KEY}
       Log   ${VALUE}
  END

TC_001 Alphabets Numbers
  [Tags]   ALPANUM
  [Documentation]   This will print following Items
  ...   {/n}1.Alphabets
  ...   {/n}2.Numbers
  @{alphabets}=  Create List   a   b   c   d
  Log   ${alphabets}
  @{numbers}=    Create List   1   2   3   4
  Log   ${numbers}
  FOR   ${alphabet}   IN   @{alphabets}
     FOR   ${number}   IN  @{numbers}
        Log   ${alphabet}${number}
     END
  END


LAST_UPDATED_ON
    [Tags]   TIME_DATE
    TEST_ING_KEYWOD_WITH_ARGS   d=10089
