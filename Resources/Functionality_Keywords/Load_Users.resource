*** Settings ***
Library    OperatingSystem
Library    json

*** Variables ***
${PATH}    ${EXECDIR}/data/users.json 
...    #robot framework ma wbudowane zmienne

*** Keywords ***
Read Users From JSON File
    [Documentation]    Reads user data from JSON file and return parsed data
    ${content}    Get File    ${PATH}
    ${users}    Evaluate    json.loads('''${content}''')    json
    RETURN    ${users}