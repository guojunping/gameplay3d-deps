cmake_minimum_required(VERSION 3.4.1)
project(mylib)
add_compile_options(
-Wno-multichar
-DLIBDIR=\"c\"
-DBUILDING_LIBICONV
-DIN_LIBRARY
)
include_directories(./)
include_directories(include)
include_directories(libcharset)
include_directories(lib)
include_directories(libcharset/include)
include_directories(srclib)
add_library( # Sets the name of the library.
iconv
# Sets the library as a static library.
STATIC
# Provides a relative path to your source file(s).
libcharset/lib/localcharset.c lib/iconv.c lib/relocatable.c
)

#set_target_properties( # Specifies the target library.
#iconv_lib
# Specifies the parameter you want to define.
#PROPERTIES IMPORTED_LOCATION
# Provides the path to the library you want to import.
#${PROJECT_SOURCE_DIR}/iconv/${ANDROID_ABI}/libiconv.so )
#target_link_libraries(TKAT PRIVATE iconv_lib)
#target_link_libraries(iconv_lib)