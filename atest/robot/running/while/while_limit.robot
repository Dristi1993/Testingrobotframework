*** Settings ***
Resource          while.resource
Suite Setup       Run Tests    ${EMPTY}    running/while/while_limit.robot
Test Template     Check test case

*** Test Cases ***
Default limit is 100 iterations
    ${TEST NAME}

Limit with x iterations
    ${TEST NAME}

Limit with times iterations
    ${TEST NAME}

Limit as timestr
    ${TEST NAME}

Limit can be disabled
    ${TEST NAME}

Invalid limit no suffix
    ${TEST NAME}

Invalid limit invalid value
    ${TEST NAME}

Invalid negative limit
    ${TEST NAME}
