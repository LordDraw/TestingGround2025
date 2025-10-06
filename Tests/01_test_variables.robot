*** Settings ***
Documentation    Simple Robot Framework test setup
Library          Collections
Library          String

Test Tags        demo

*** Variables ***
${NAME}          Paweł Karczewski
@{FRIENDS_LIST}       Andrzej    Karolina    Piotr
&{FRIENDS_DICT}  Andrzej=Friend    Karolina=Best Friend    Piotr=Close Friend

*** Test Cases ***
TC1: Print Your Name
    [Tags]    name
    Log    Paweł Karczewski

TC2: Set Your Name As Variable Then Print It
    [Tags]    name_variable
    ${name}=    Set Variable    Paweł Karczewski
    Log    ${name}

TC3: Move Your Name To Variables Section Then Print It
    [Tags]    name_variable_section
    Log    ${NAME}

TC4: Create List Of Your Friends And Print It
    [Tags]    friends_list
    @{friends}    Create List    Andrzej    Karolina    Piotr
    Log    ${friends}

TC5: Move Your Friends List To Variables Section Then Print It
    [Tags]    friends_list_variable_section
    Log    ${FRIENDS_LIST}

TC6: Print Your Friends One By One
    [Tags]    friends_list_one_by_one
    FOR    ${friend}    IN    @{FRIENDS_LIST}
        Log    ${friend}
    END

TC7: Create Dictionary Of Your Friends And Print It
    [Tags]    friends_dict
    &{friends_dict}    Create Dictionary    Andrzej=Friend    Karolina=Best Friend    Piotr=Close Friend
    Log    ${friends_dict}

TC8: Move Your Friends Dictionary To Variables Section Then Print It
    [Tags]    friends_dict_variable_section
    Log    ${FRIENDS_DICT}

TC9: Print Your Friends From Dictionary One By One
    [Tags]    friends_dict_one_by_one
    FOR    ${name}    IN    @{FRIENDS_DICT.keys()}
        Log    ${name}: ${FRIENDS_DICT["${name}"]}
        Log    ${name}: ${FRIENDS_DICT}[${name}]
    END

    FOR    ${key}    ${value}    IN    &{FRIENDS_DICT}
        Log    ${key}: ${value}
    END
