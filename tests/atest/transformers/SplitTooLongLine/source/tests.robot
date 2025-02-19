# Use 4 spaces separator and line_length=80

*** Tasks ***

Different keyword calls
    This is a keyword     fits even with its    # comment

    This is a keyword     fits with its               # comment, but has bad spacing

    This is a keyword       these fit   but        only if you space them correctly

    This is a keyword     these args do not fit       even if you set spacing properly

    This is a keyword     this    last    argument    is    not    really    a # comment

    This is a keyword     these    arguments    won't    fit    with     that   # comment

    This is a keyword     these    arguments    won't    fit    with    or    without    that   # comment

    This is a keyword     these     args    have    an    interesting
    ...  # Edge case here →→→→→→→→→→→→→→→→                                    HERE
    ...  More arguments here

    This is a keyword     and     these      are       its     args
    ...    here   are   some    more    args      to      split
    ...    with                irregular                       spacing

    ${assignment}=    This keyword sets the variable   using   these     args

    ${assignment}=    This keyword sets the variable   using   these     args
    ...    here   are   some    more    args      to      split
    ...    with                irregular                       spacing


    This is a keyword     and     these      are       its     args  # Comment

    This is a keyword     and     these      are       its     arg   # Comment
    ...    here   are   some    more    args
    ...    with                irregular                       spacing

    This is a keyword     and     these      are       its     arg   # Comment 1
    ...    here   are   some    more    args                         # Comment 2
    ...    with                irregular                     spacing # Not really a comment


    ${assignment}=    This keyword sets the variable   using   these  args  # Comment

    ${assignment}=    This keyword sets the variable   using   these     args
    ...    here   are   some    more    args      to      split            # Comment
    ...    with                irregular                       spacing


Newlines
    Keyword

    # Newlines with trailing space are not changed
        
        

    Keyword


For loop
    FOR   ${i}   IN    1  2  3  4  5  6  7  8  9  10  11  12  13  14  15  16  17  18  20
        This is a keyword     fits even with its    # comment

        This is a keyword     fits with its               # comment, but has bad spacing

        This is a keyword     these fit         but only if you space them correctly

        This is a keyword     these args do not fit       even if you set spacing properly

        This is a keyword     this    last    argument    is    not    really    a # comment

        This is a keyword     these    arguments    won't    fit    with     that   # comment

        This is a keyword     these    arguments    won't    fit    with    or    without    that   # comment

        This is a keyword     these     args    have    an    interesting
        ...  # Edge case here →→→→→→→→→→→→→→→→                                    HERE
        ...  More arguments here

        This is a keyword     and     these      are       its     args
        ...    here   are   some    more    args      to      split
        ...    with                irregular                       spacing

        ${assignment}=   This keyword sets the variable   using   these     args

        ${assignment}=   This keyword sets the variable   using   these     args
        ...    here   are   some    more    args      to      split
        ...    with                irregular                       spacing


        This is a keyword     and     these      are       its     args  # Comment

        This is a keyword     and     these      are       its     arg   # Comment
        ...    here   are   some    more    args
        ...    with                irregular                       spacing

        This is a keyword     and     these      are       its     arg   # Comment 1
        ...    here   are   some    more    args                         # Comment 2
        ...    with                irregular                     spacing # Not really a comment


        ${assignment}=    This keyword sets the variable   using   these  args  # Comment

        ${assignment}=    This keyword sets the variable   using   these     args
        ...    here   are   some    more    args      to      split            # Comment
        ...    with                irregular                       spacing
    END


If - else if - else clause
    IF    ${some variable with a very long name} == ${some other variable with a long name}
        ${assignment}=    This keyword sets the variable   using   these     args
        ...    here   are   some    more    args      to      split            # Comment
        ...    with                irregular                       spacing
    ELSE IF    ${random} > ${NUMBER_TO_PASS_ON}
        ${assignment}=    This keyword sets the variable   using   these     args
        ...    here   are   some    more    args      to      split            # Comment
        ...    with                irregular                       spacing
    ELSE
        ${assignment}=    This keyword sets the variable   using   these     args
        ...    here   are   some    more    args      to      split            # Comment
        ...    with                irregular                       spacing
    END
