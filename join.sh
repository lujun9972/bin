join() { { local indelimiter; indelimiter="${1- }" ; local outdelimiter;
           outdelimiter="${2-.}" ; }
         local car
         local cdr
         local IFS
         IFS="${indelimiter}"
         read -t 1 car cdr || return
         test "${cdr}" || { echo "${car}" ; return ; }
         echo "${car}${outdelimiter}${cdr}" | ${FUNCNAME} "${indelimiter}"
         "${outdelimiter}"
       }
