include(CheckCSourceCompiles)
# The begin of the sources (macros and includes)
set(_source_epilogue "#undef inline")

macro(add_header_include check header)
  if(${check})
    set(_source_epilogue "${_source_epilogue}\n#include <${header}>")
  endif(${check})
endmacro(add_header_include)

set(signature_call_conv)
if(HAVE_WINDOWS_H)
  add_header_include(HAVE_WINDOWS_H "windows.h")
  add_header_include(HAVE_WINSOCK2_H "winsock2.h")
  add_header_include(HAVE_WINSOCK_H "winsock.h")
  set(_source_epilogue
      "${_source_epilogue}\n#ifndef WIN32_LEAN_AND_MEAN\n#define WIN32_LEAN_AND_MEAN\n#endif")
  set(signature_call_conv "PASCAL")
  if(HAVE_LIBWS2_32)
    set(CMAKE_REQUIRED_LIBRARIES ws2_32)
  endif()
else(HAVE_WINDOWS_H)
  add_header_include(HAVE_SYS_TYPES_H "sys/types.h")
  add_header_include(HAVE_SYS_SOCKET_H "sys/socket.h")
endif(HAVE_WINDOWS_H)

check_c_source_compiles("${_source_epilogue}
int main(void) {
    recv(0, 0, 0, 0);
    return 0;
}" curl_cv_recv)
if(curl_cv_recv)
  if(NOT DEFINED curl_cv_func_recv_args OR "${curl_cv_func_recv_args}" STREQUAL "unknown")
    foreach(recv_retv "int" "ssize_t" )
      foreach(recv_arg1 "int" "ssize_t" "SOCKET")
        foreach(recv_arg2 "void *" "char *")
          foreach(recv_arg3 "size_t" "int" "socklen_t" "unsigned int")
            foreach(recv_arg4 "int" "unsigned int")
              if(NOT curl_cv_func_recv_done)
                unset(curl_cv_func_recv_test CACHE)
                check_c_source_compiles("
                  ${_source_epilogue}
                  extern ${recv_retv} ${signature_call_conv}
                  recv(${recv_arg1}, ${recv_arg2}, ${recv_arg3}, ${recv_arg4});
                  int main(void) {
                    ${recv_arg1} s=0;
                    ${recv_arg2} buf=0;
                    ${recv_arg3} len=0;
                    ${recv_arg4} flags=0;
                    ${recv_retv} res = recv(s, buf, len, flags);
                    (void) res;
                    return 0;
                  }"
                  curl_cv_func_recv_test)
                message(STATUS
                  "Tested: ${recv_retv} recv(${recv_arg1}, ${recv_arg2}, ${recv_arg3}, ${recv_arg4})")
                if(curl_cv_func_recv_test)
                  set(curl_cv_func_recv_args
                    "${recv_arg1},${recv_arg2},${recv_arg3},${recv_arg4},${recv_retv}")
                  set(RECV_TYPE_ARG1 "${recv_arg1}")
                  set(RECV_TYPE_ARG2 "${recv_arg2}")
                  set(RECV_TYPE_ARG3 "${recv_arg3}")
                  set(RECV_TYPE_ARG4 "${recv_arg4}")
                  set(RECV_TYPE_RETV "${recv_retv}")
                  set(HAVE_RECV 1)
                  set(curl_cv_func_recv_done 1)
                endif(curl_cv_func_recv_test)
              endif(NOT curl_cv_func_recv_done)
            endforeach(recv_arg4)
          endforeach(recv_arg3)
        endforeach(recv_arg2)
      endforeach(recv_arg1)
    endforeach(recv_retv)
  else()
    string(REGEX REPLACE "^([^,]*),[^,]*,[^,]*,[^,]*,[^,]*$" "\\1" RECV_TYPE_ARG1 "${curl_cv_func_recv_args}")
    string(REGEX REPLACE "^[^,]*,([^,]*),[^,]*,[^,]*,[^,]*$" "\\1" RECV_TYPE_ARG2 "${curl_cv_func_recv_args}")
    string(REGEX REPLACE "^[^,]*,[^,]*,([^,]*),[^,]*,[^,]*$" "\\1" RECV_TYPE_ARG3 "${curl_cv_func_recv_args}")
    string(REGEX REPLACE "^[^,]*,[^,]*,[^,]*,([^,]*),[^,]*$" "\\1" RECV_TYPE_ARG4 "${curl_cv_func_recv_args}")
    string(REGEX REPLACE "^[^,]*,[^,]*,[^,]*,[^,]*,([^,]*)$" "\\1" RECV_TYPE_RETV "${curl_cv_func_recv_args}")
  endif()

  if("${curl_cv_func_recv_args}" STREQUAL "unknown")
    message(FATAL_ERROR "Cannot find proper types to use for recv args")
  endif("${curl_cv_func_recv_args}" STREQUAL "unknown")
else(curl_cv_recv)
  message(FATAL_ERROR "Unable to link function recv")
endif(curl_cv_recv)
set(curl_cv_func_recv_args "${curl_cv_func_recv_args}" CACHE INTERNAL "Arguments for recv")
set(HAVE_RECV 1)

check_c_source_compiles("${_source_epilogue}
int main(void) {
    send(0, 0, 0, 0);
    return 0;
}" curl_cv_send)
if(curl_cv_send)
  if(NOT DEFINED curl_cv_func_send_args OR "${curl_cv_func_send_args}" STREQUAL "unknown")
    foreach(send_retv "int" "ssize_t" )
      foreach(send_arg1 "int" "ssize_t" "SOCKET")
        foreach(send_arg2 "const void *" "void *" "char *" "const char *")
          foreach(send_arg3 "size_t" "int" "socklen_t" "unsigned int")
            foreach(send_arg4 "int" "unsigned int")
              if(NOT curl_cv_func_send_done)
                unset(curl_cv_func_send_test CACHE)
                check_c_source_compiles("
                  ${_source_epilogue}
                  extern ${send_retv} ${signature_call_conv}
                  send(${send_arg1}, ${send_arg2}, ${send_arg3}, ${send_arg4});
                  int main(void) {
                    ${send_arg1} s=0;
                    ${send_arg2} buf=0;
                    ${send_arg3} len=0;
                    ${send_arg4} flags=0;
                    ${send_retv} res = send(s, buf, len, flags);
                    (void) res;
                    return 0;
                  }"
                  curl_cv_func_send_test)
                message(STATUS
                  "Tested: ${send_retv} send(${send_arg1}, ${send_arg2}, ${send_arg3}, ${send_arg4})")
                if(curl_cv_func_send_test)
                  string(REGEX REPLACE "(const) .*" "\\1" send_qual_arg2 "${send_arg2}")
                  string(REGEX REPLACE "const (.*)" "\\1" send_arg2 "${send_arg2}")
                  set(curl_cv_func_send_args
                    "${send_arg1},${send_arg2},${send_arg3},${send_arg4},${send_retv},${send_qual_arg2}")
                  set(SEND_TYPE_ARG1 "${send_arg1}")
                  set(SEND_TYPE_ARG2 "${send_arg2}")
                  set(SEND_TYPE_ARG3 "${send_arg3}")
                  set(SEND_TYPE_ARG4 "${send_arg4}")
                  set(SEND_TYPE_RETV "${send_retv}")
                  set(HAVE_SEND 1)
                  set(curl_cv_func_send_done 1)
                endif(curl_cv_func_send_test)
              endif(NOT curl_cv_func_send_done)
            endforeach(send_arg4)
          endforeach(send_arg3)
        endforeach(send_arg2)
      endforeach(send_arg1)
    endforeach(send_retv)
  else()
    string(REGEX REPLACE "^([^,]*),[^,]*,[^,]*,[^,]*,[^,]*,[^,]*$" "\\1" SEND_TYPE_ARG1 "${curl_cv_func_send_args}")
    string(REGEX REPLACE "^[^,]*,([^,]*),[^,]*,[^,]*,[^,]*,[^,]*$" "\\1" SEND_TYPE_ARG2 "${curl_cv_func_send_args}")
    string(REGEX REPLACE "^[^,]*,[^,]*,([^,]*),[^,]*,[^,]*,[^,]*$" "\\1" SEND_TYPE_ARG3 "${curl_cv_func_send_args}")
    string(REGEX REPLACE "^[^,]*,[^,]*,[^,]*,([^,]*),[^,]*,[^,]*$" "\\1" SEND_TYPE_ARG4 "${curl_cv_func_send_args}")
    string(REGEX REPLACE "^[^,]*,[^,]*,[^,]*,[^,]*,([^,]*),[^,]*$" "\\1" SEND_TYPE_RETV "${curl_cv_func_send_args}")
    string(REGEX REPLACE "^[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,([^,]*)$" "\\1" SEND_QUAL_ARG2 "${curl_cv_func_send_args}")
  endif()

  if("${curl_cv_func_send_args}" STREQUAL "unknown")
    message(FATAL_ERROR "Cannot find proper types to use for send args")
  endif("${curl_cv_func_send_args}" STREQUAL "unknown")
  set(SEND_QUAL_ARG2 "const")
else(curl_cv_send)
  message(FATAL_ERROR "Unable to link function send")
endif(curl_cv_send)
set(curl_cv_func_send_args "${curl_cv_func_send_args}" CACHE INTERNAL "Arguments for send")
set(HAVE_SEND 1)

check_c_source_compiles("${_source_epilogue}
  int main(void) {
    int flag = MSG_NOSIGNAL;
    (void)flag;
    return 0;
  }" HAVE_MSG_NOSIGNAL)

if(NOT HAVE_WINDOWS_H)
  add_header_include(HAVE_SYS_TIME_H "sys/time.h")
  add_header_include(TIME_WITH_SYS_TIME "time.h")
  add_header_include(HAVE_TIME_H "time.h")
endif()
check_c_source_compiles("${_source_epilogue}
int main(void) {
  struct timeval ts;
  ts.tv_sec  = 0;
  ts.tv_usec = 0;
  (void)ts;
  return 0;
}" HAVE_STRUCT_TIMEVAL)


include(CheckCSourceRuns)
set(CMAKE_REQUIRED_FLAGS)
if(HAVE_SYS_POLL_H)
  set(CMAKE_REQUIRED_FLAGS "-DHAVE_SYS_POLL_H")
endif(HAVE_SYS_POLL_H)
set(HAVE_POLL_FINE 1)

set(HAVE_SIG_ATOMIC_T 1)
set(CMAKE_REQUIRED_FLAGS)
if(HAVE_SIGNAL_H)
  set(CMAKE_REQUIRED_FLAGS "-DHAVE_SIGNAL_H")
  set(CMAKE_EXTRA_INCLUDE_FILES "signal.h")
endif(HAVE_SIGNAL_H)
check_type_size("sig_atomic_t" SIZEOF_SIG_ATOMIC_T)
if(HAVE_SIZEOF_SIG_ATOMIC_T)
  check_c_source_compiles("
    #ifdef HAVE_SIGNAL_H
    #  include <signal.h>
    #endif
    int main(void) {
      static volatile sig_atomic_t dummy = 0;
      (void)dummy;
      return 0;
    }" HAVE_SIG_ATOMIC_T_NOT_VOLATILE)
  if(NOT HAVE_SIG_ATOMIC_T_NOT_VOLATILE)
    set(HAVE_SIG_ATOMIC_T_VOLATILE 1)
  endif(NOT HAVE_SIG_ATOMIC_T_NOT_VOLATILE)
endif(HAVE_SIZEOF_SIG_ATOMIC_T)

if(HAVE_WINDOWS_H)
  set(CMAKE_EXTRA_INCLUDE_FILES winsock2.h)
else()
  set(CMAKE_EXTRA_INCLUDE_FILES)
  if(HAVE_SYS_SOCKET_H)
    set(CMAKE_EXTRA_INCLUDE_FILES sys/socket.h)
  endif(HAVE_SYS_SOCKET_H)
endif()

check_type_size("struct sockaddr_storage" SIZEOF_STRUCT_SOCKADDR_STORAGE)
if(HAVE_SIZEOF_STRUCT_SOCKADDR_STORAGE)
  set(HAVE_STRUCT_SOCKADDR_STORAGE 1)
endif(HAVE_SIZEOF_STRUCT_SOCKADDR_STORAGE)

