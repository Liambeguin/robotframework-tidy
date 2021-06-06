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