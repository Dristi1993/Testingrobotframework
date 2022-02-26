*** Variables ***
${variable}    ${1}
${limit}       ${11}

*** Test Cases ***
Default limit is 100 iterations
    [Documentation]     FAIL While loop aborted due to not terminating within 100 iterations.
    WHILE    $variable < 2
        Log    ${variable}
    END

Limit with x iterations
    [Documentation]     FAIL While loop aborted due to not terminating within 5 iterations.
    WHILE    $variable < 2    limit=5x
        Log    ${variable}
    END

Limit with times iterations
    [Documentation]     FAIL While loop aborted due to not terminating within 3 iterations.
    WHILE    $variable < 2    limit=3 times
        Log    ${variable}
    END

Limit as timestr
    [Documentation]     FAIL While loop aborted due to not terminating within 0.5 seconds.
    WHILE    $variable < 2    limit=0.5s
        Log     ${variable}
    END

Limit from variable
    [Documentation]     FAIL While loop aborted due to not terminating within 11 iterations.
    WHILE    $variable < 2    limit=${limit}
        Log     ${variable}
    END

Limit can be disabled
    WHILE    $variable < 110    limit=NoNe
        Log     ${variable}
        ${variable}=    Evaluate    $variable + 1
    END

Invalid limit no suffix
    [Documentation]     FAIL ValueError: Invalid time string '1'.
    WHILE    $variable < 2    limit=1
        Log     ${variable}
    END

Invalid limit invalid value
    [Documentation]     FAIL ValueError: Iteration limit must be positive integer when using 'x' or 'times', got: 'fdas '
    WHILE    $variable < 2    limit=fdas x
        Log     ${variable}
    END

Invalid negative limit
    [Documentation]     FAIL ValueError: Iteration limit must be positive integer when using 'x' or 'times', got: '-1'
    WHILE    $variable < 2    limit=-1x
        Log     ${variable}
    END
