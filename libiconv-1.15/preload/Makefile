# Makefile for libiconv/preload

#### Start of system configuration section. ####

# Directories used by "make":
srcdir = .

# Directories used by "make install":
prefix = /armeabi-v7a
local_prefix = /usr/local
exec_prefix = ${prefix}
libdir = ${exec_prefix}/lib

# Programs used by "make":
CC = /c/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64/bin/arm-linux-androideabi-gcc
CFLAGS = --pipe --sysroot=/c/msys64/android-make-toolchian/arm-27-toolchain/sysroot -D__ANDROID_API__=27 -D__GXX_EXPERIMENTAL_CXX0X__  -I/c/msys64/android-make-toolchian/arm-27-toolchain/sysroot/usr/include -I/c/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64/lib/gcc/arm-linux-androideabi/4.9.x/include-fixed -I/c/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64/lib/gcc/arm-linux-androideabi/4.9.x/include -I/c/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/sources/cxx-stl/gnu-libstdc++/4.9/include -I/c/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a/include -fvisibility=hidden
CPPFLAGS = --pipe --sysroot=/c/msys64/android-make-toolchian/arm-27-toolchain/sysroot -D__ANDROID_API__=27 -D__GXX_EXPERIMENTAL_CXX0X__  -I/c/msys64/android-make-toolchian/arm-27-toolchain/sysroot/usr/include -I/c/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64/lib/gcc/arm-linux-androideabi/4.9.x/include-fixed -I/c/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64/lib/gcc/arm-linux-androideabi/4.9.x/include -I/c/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/sources/cxx-stl/gnu-libstdc++/4.9/include -I/c/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a/include -std=c++11 -pthread -frtti -fexceptions
LDFLAGS = -L/c/msys64/android-make-toolchian/arm-27-toolchain/sysroot/usr/lib/ -L/c/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a -lgnustl_static -lgcc -lc -latomic
INCLUDES = -I../lib -I$(srcdir)/../lib -I../include -I$(srcdir)/../include -I.. -I$(srcdir)/..
# -DBUILDING_LIBICONV: Change expansion of LIBICONV_DLL_EXPORTED macro.
# -DBUILDING_DLL: Change expansion of RELOCATABLE_DLL_EXPORTED macro.
DEFS = -DLIBDIR=\"$(libdir)\" -DBUILDING_LIBICONV -DBUILDING_DLL \
-DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"$(libdir)\" -DNO_XMALLOC \
-Dset_relocation_prefix=libiconv_set_relocation_prefix \
-Drelocate=libiconv_relocate -DPACKAGE_NAME=\"libiconv\" -DPACKAGE_TARNAME=\"libiconv\" -DPACKAGE_VERSION=\"0\" -DPACKAGE_STRING=\"libiconv\ 0\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -DINSTALLPREFIX=\"/armeabi-v7a\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -D__EXTENSIONS__=1 -D_ALL_SOURCE=1 -D_DARWIN_C_SOURCE=1 -D_GNU_SOURCE=1 -D_POSIX_PTHREAD_SEMANTICS=1 -D__STDC_WANT_IEC_60559_ATTRIBS_EXT__=1 -D__STDC_WANT_IEC_60559_BFP_EXT__=1 -D__STDC_WANT_IEC_60559_DFP_EXT__=1 -D__STDC_WANT_IEC_60559_FUNCS_EXT__=1 -D__STDC_WANT_IEC_60559_TYPES_EXT__=1 -D__STDC_WANT_LIB_EXT2__=1 -D__STDC_WANT_MATH_SPEC_FUNCS__=1 -D_TANDEM_SOURCE=1 -DHAVE_DLFCN_H=1 -DLT_OBJDIR=\".libs/\" -DHAVE_VISIBILITY=1
LIBTOOL = /bin/sh $(top_builddir)/libtool
LIBTOOL_COMPILE = $(LIBTOOL) --mode=compile
LIBTOOL_LINK = $(LIBTOOL) --mode=link
LN_S = cp -pR
RM = rm -f

# Programs used by "make install":
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644
mkinstalldirs = $(SHELL) ./build-aux/mkinstalldirs

#### End of system configuration section. ####

SHELL = /bin/sh

# Needed by $(LIBTOOL).
top_builddir = .

SOURCES = $(srcdir)/../lib/iconv.c $(srcdir)/../libcharset/lib/localcharset.c $(srcdir)/../lib/relocatable.c

all : preloadable_libiconv.so

preloadable_libiconv.so : $(SOURCES)
	$(RM) -r objects
	mkdir objects && \
	for f in $(SOURCES); do \
	  $(LIBTOOL_COMPILE) $(CC) $(INCLUDES) $(CPPFLAGS) $(CFLAGS) $(DEFS) -DLIBICONV_PLUG -c $$f -o objects/`basename $$f | sed -e 's,\.c$$,.o,'` || exit 1; \
	done && \
	$(LIBTOOL_LINK) $(CC) $(LDFLAGS) $(CFLAGS) -o libiconv.la -rpath $(libdir) -no-undefined objects/*.lo && \
	$(RM) -r objects
	cp .libs/libiconv.so preloadable_libiconv.so

install : all force
	if [ ! -d $(DESTDIR)$(libdir) ] ; then $(mkinstalldirs) $(DESTDIR)$(libdir) ; fi
	if test -n "preloadable_libiconv.so"; then $(INSTALL_DATA) preloadable_libiconv.so $(DESTDIR)$(libdir)/preloadable_libiconv.so.new && mv $(DESTDIR)$(libdir)/preloadable_libiconv.so.new $(DESTDIR)$(libdir)/preloadable_libiconv.so ; fi

install-strip : install

installdirs : force
	if [ ! -d $(DESTDIR)$(libdir) ] ; then $(mkinstalldirs) $(DESTDIR)$(libdir) ; fi

uninstall : force
	if test -n "preloadable_libiconv.so"; then $(RM) $(DESTDIR)$(libdir)/preloadable_libiconv.so ; fi

check : all

mostlyclean : clean

clean : force
	$(RM) *.o *.lo *.a *.la preloadable_libiconv* core *.stackdump so_locations
	$(RM) -r .libs _libs objects

distclean : clean
	$(RM) config.status config.log config.cache Makefile libtool

maintainer-clean : distclean

# List of source files.
SOURCE_FILES = \
  configure.ac Makefile.in Makefile.devel
# List of distributed files imported from other packages.
IMPORTED_FILES =
# List of distributed files generated by autotools or Makefile.devel.
GENERATED_FILES = \
  aclocal.m4 configure
# List of distributed files generated by "make".
DISTRIBUTED_BUILT_FILES =
# List of distributed files.
DISTFILES = $(SOURCE_FILES) $(IMPORTED_FILES) $(GENERATED_FILES) $(DISTRIBUTED_BUILT_FILES)

distdir : $(DISTFILES)
	for file in $(DISTFILES); do \
	  if test -f $$file; then dir='.'; else dir='$(srcdir)'; fi; \
	  cp -p "$$dir/$$file" '$(distdir)'/$$file || exit 1; \
	done

force :

