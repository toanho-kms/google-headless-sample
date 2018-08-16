*** Settings ***
Documentation    Check WebUI
Library          Selenium2Library
Test Timeout     2 minutes
Test Setup       Test_setup
Test Teardown    Test_teardown

*** Test Cases ***
Test Chrome Headless Run
    [Tags]    webui
    Go To    https://settings.staging.rentlytics.com
    Wait Until Element Is Visible  xpath=//input[@id="email"]
    Capture Page Screenshot
    # Input Text  id=lst-ib    It's alive!
    #Capture Page Screenshot
    #Submit Form  id=tsf
    #Capture Page Screenshot

*** Keywords ***
Test_setup
    ${c_opts} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${c_opts}   add_argument    headless
    Call Method    ${c_opts}   add_argument    disable-gpu
    Call Method    ${c_opts}   add_argument    no-sandbox
    Call Method    ${c_opts}   add_argument    window-size\=1024,768
    Create Webdriver    Chrome    crm_alias    chrome_options=${c_opts}

Test_teardown
    Close All Browsers