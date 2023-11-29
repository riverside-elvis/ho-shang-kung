# Pre-process markdown to insert latex before generating the PDF.
BOOK=0
BLOCKS=0
LAOZI=0
HSG=0
ERKES=0
while IFS= read -r line; do

    # Chapter titles reset processing of LAOZI and ERKES blocks.
    if [[ "$line" =~ ^#[[:space:]]Ch.* ]]; then
        BOOK=1
        LAOZI=0
        HSG=0
        ERKES=0
        BLOCKS=0
        echo "$line"
        continue
    fi

    # Appendix stops processing.
    if [[ "$line" =~ ^#[[:space:]]Appendix.* ]]; then
        BOOK=0
        echo "$line"
        continue
    fi

    # Just print the line if not processing.
    if [[ $BOOK -eq 0 ]]; then
        echo "$line"
        continue
    fi

    # Empty lines end LAOZI, HSG and ERKES blocks.
    if [[ "$line" = "" ]]; then
        if [[ $BLOCKS -ne 1 ]]; then
            echo "$line"
            continue
        fi
        if [[ $LAOZI -eq 1 ]]; then
            LAOZI=0
            echo -n "$line"
            echo '\normalsize'
            echo
            continue
        elif [[ $HSG -eq 1 ]]; then
            HSG=0
            echo "$line"
            continue
        elif [[ $ERKES -eq 1 ]]; then
            ERKES=0
            echo -n "$line"
            echo '\normalsize'
            echo
            continue
        fi
    fi

    # > starts HSG blocks.
    if [[ "$line" =~ ^\>[[:space:]] ]]; then
        HSG=1
        echo "$line"
        continue
    fi

    # >> starts ERKES blocks.
    if [[ "$line" =~ ^\>\>[[:space:]] ]]; then
        ERKES=1
        echo '\small'
        echo "$line"
        continue
    fi

    # Non-empty lines that aren't in HSG or ERKES start LAOZI blocks.
    if [[ $LAOZI -eq 0 ]] && [[ $HSG -eq 0 ]] && [[ $ERKES -eq 0 ]]; then
        LAOZI=1
        if [[ $BLOCKS -eq 1 ]]; then
            echo '\bigskip'
        fi
        BLOCKS=1
        echo '\large'
        echo "$line"
        continue
    fi

    echo "$line"

done < "$1"
