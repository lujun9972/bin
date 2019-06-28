reduce() { { local function_name ; function_name="${1}" ; }
        local first
        local second
        local cdr
        local IFS
        IFS="${indelimiter- }"
        read -t 1 first second cdr || return
        test "$( declare -f ${function_name} )" || return
        test -n "${second}" || { echo ${first} ; return ; }
        first=$(${function_name} ${first} ${second})
        echo "${first}${IFS}${cdr}" | ${FUNCNAME} "${function_name}"
      }
