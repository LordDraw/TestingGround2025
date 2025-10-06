*** Settings ***
Documentation    Simple Robot Framework test setup
Resource         ../Resources/Functionality_Keywords/Load_Users.resource

Test Tags        demo

*** Variables ***
${NAME}          Paweł Karczewski
@{FRIENDS_LIST}       Andrzej    Karolina    Piotr
&{FRIENDS_DICT}     Andrzej=Friend    Karolina=Best Friend    Piotr=Close Friend

*** Test Cases ***
TC1: Create Keyword To Print Your Name
    [Tags]    keyword_name
    ${users}    Load_Users.Read Users From JSON File
    Log    ${users["users"][0]["Full Name"]}