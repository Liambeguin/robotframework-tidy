*** Keywords ***
Keyword
    IF    True
        Log    Hi!
        FOR    ${var}    IN    one    two
        IF    "${var}" == "one"
        Log    ${var} is one!
    END

Keyword With Deprecated For Loop
    FOR  ${value}  IN  @{LIST}
        Keyword
        Other Keyword
    END

    IF  ${condition}
        IF  False
            FOR  ${value}  IN  RANGE  10
                Log    ${value}
            END

        ELSE IF  True
            No Operation
        END
    END