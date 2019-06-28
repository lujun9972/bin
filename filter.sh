filter() { { local function_name ; function_name="${1}" ; }
           local car
           local cdr
           local IFS
           IFS="${indelimiter- }"
           read -t 1 car cdr || return
           test "$( declare -f ${function_name} )" || return
           test "${car}" || { true ; return ; }
           ${function_name} "${car}" || echo -n "${car} "
           echo "${cdr}" | ${FUNCNAME} "${function_name}"
}
