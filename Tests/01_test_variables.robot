*** Settings ***
Documentation    Simple Robot Framework Test Setup
Library    Collections
Library    String

Test Tags    demo

*** Variables ***
${name}    Paweł Karczewski
@{FRIENDS_LIST}    Andrzej    Karolina    Piotr
&{FRIENDS_DICT}    Piotr=Friend    Andrzej=BestFriend    Karolina=CloseFriend

*** Test Cases ***
TC1: Print you name
    [Tags]    name
    Log    Paweł Karczewski

TC2: Set Your Name As Variable Then Print It
    [Tags]    new_variable
    ${name}    Set Variable     Paweł Karczewski
    Log    $(name)

TC3: Move Your Name To Variable Section Then Print It
    [Tags]    name_variable_section
    Log    $(NAME)

TC4: Create List Of Your Friends
    [Tags]     friends_list
    @{friends}  BuiltIn.CreateList    Andrzej    Karolina    Piotr
    Log    $(friends)

TC5: Move Your Friends List To Variables Section Then Print It
    [Tags]    friends_list_variable_section
    Log    $(FRIENDS_LIST)

TC6: Print your Friends One By One
    [Tags]        friends_list_one_by_one
    FOR    ${friend}    IN    @(FRIENDS_LIST)
        Log           $(friend)
    END
    
TC7: Create Dictionary Of Your Friends And Print It
    [Tags]  friends_dict
    &{friends_dict}    CreateDictionary    Piotr=Friend    Andrzej=BestFriend    Karolina=CloseFriend
    log     ${friends_dict}

TC8: Move Your Friends Dictionary To Variable Section Then Print It
    [Tags]    friends_dict_variable_section
    Log    $(FRIENDS_DICT)

TC9: Print Your Friends From Dictionary One By One
    [Tags]    friends_dict_one_by_one
    FOR    ${name}    IN    @{FRIENDS_DICT.keys()}
        Log    ${name}: ${FRIENDS_DICT["${name}"]}
        Log    ${name}: ${FRIENDS_DICT}[${name}]
    END

    FOR    ${key}    ${value}    IN    &{FRIENDS_DICT}
        Log    ${key}: ${value}
    END

    
*** Keywords ***
Print My Name
    [Arguments]    ${name}
    Log    ${name}

#python-m robot -i 