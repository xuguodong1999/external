/* src/config.h.in.  Generated from configure.in by autoheader.  */

/* Where the data files are located */
#define BABEL_DATADIR "@BABEL_DATADIR@"

/* The version of Open Babel */
#define BABEL_VERSION "@BABEL_VERSION@"

/* Version check macro
   Can be used like #if (OB_VERSION >= OB_VERSION_CHECK(2, 2, 99)) */
#define OB_VERSION_CHECK(major, minor, patch) ((major<<16)|(minor<<8)|(patch))

/* OB_VERSION is (major << 16) + (minor << 8) + patch */
#define OB_VERSION OB_VERSION_CHECK(@BABEL_MAJ_VER@, @BABEL_MIN_VER@, @BABEL_PATCH_VER@)

/* The file extension used for shared modules */
#define MODULE_EXTENSION "@MODULE_EXTENSION@"

#include <openbabel_export.hpp>
// If we are using a recent GCC version with visibility support use it
#ifndef OB_EXPORT
#define OB_EXPORT OPENBABEL_EXPORT
#endif

 #ifndef OB_EXTERN
  #define OB_EXTERN   OB_EXPORT extern
 #endif
 #ifndef OBAPI
  #define OBAPI    OB_EXPORT
 #endif
 #ifndef OBCOMMON
  #define OBCOMMON OB_EXPORT
 #endif
 #ifndef OBCONV
  #define OBCONV   OB_EXPORT
 #endif
 #ifndef OBERROR
  #define OBERROR  OB_EXPORT
 #endif
 #ifndef OBFPRT
  #define OBFPRT   OB_EXPORT
 #endif
 #ifndef OBFPTR
  #define OBFPTR   OB_EXPORT
 #endif
 #ifndef OBMCDL
  #define OBMCDL   OB_EXPORT
 #endif
 #ifndef OBDEPICT
  #define OBDEPICT OB_EXPORT
 #endif

#ifdef _MSC_VER
 // Suppress warning on deprecated functions
 #pragma warning(disable : 4996)
 // Suppress warning that compiler is ignoring C++ exception specification
 #pragma warning( disable : 4290 )
 // Suppress warning on signed/unsigned comparison with < or > (harmless, but maybe should be fixed)
 #pragma warning( disable : 4018 )
 // Suppress warning on forcing int etc. value to bool 'true' or 'false' (performance warning)
 #pragma warning( disable : 4800 )
 //
 #pragma warning( disable : 4251 )


 #include <algorithm>  // std::min and std::max were moved here in C++11
 #include <crtdbg.h>

 #ifdef _DEBUG
 #define DEBUG_NEW new(_NORMAL_BLOCK, THIS_FILE, __LINE__)
 #else
  #define DEBUG_NEW new
 #endif
#endif  // _MSC_VER
/* have <conio.h> */
#cmakedefine HAVE_CONIO_H 1

/* have <sys/time.h> */
#cmakedefine HAVE_SYS_TIME_H 1

/* have <time.h> */
#cmakedefine HAVE_TIME_H 1

/* have <sstream> */
#cmakedefine HAVE_SSTREAM 1

/* have symbol clock_t */
#cmakedefine HAVE_CLOCK_T 1

/* have symbol rint */
#cmakedefine HAVE_RINT 1

/* have symbol snprintf */
#cmakedefine HAVE_SNPRINTF 1

/* have symbol sranddev */
#cmakedefine HAVE_SRANDDEV 1

/* have symbol strcasecmp */
#cmakedefine HAVE_STRCASECMP 1

/* have symbol strncasecmp */
#cmakedefine HAVE_STRNCASECMP 1

/* have struct clock_t */
#cmakedefine HAVE_CLOCK_T 1

#cmakedefine HAVE_REGEX_H 1

#cmakedefine HAVE_SHARED_POINTER 1

#cmakedefine HAVE_EIGEN 1

#cmakedefine HAVE_EIGEN3 1

#cmakedefine HAVE_STATIC_INCHI 1

#cmakedefine HAVE_LIBZ 1

#cmakedefine HAVE_STATIC_LIBXML 1

#cmakedefine HAVE_RPC_XDR_H 1

/* shared pointer implementation to be used */
#cmakedefine OB_SHARED_PTR_IMPLEMENTATION @OB_SHARED_PTR_IMPLEMENTATION@

/* header to be included for shared pointers */
#cmakedefine OB_SHARED_PTR_HEADER <@OB_SHARED_PTR_HEADER@>

#if defined(WIN32)
 #ifndef HAVE_SNPRINTF
  #define snprintf _snprintf
  #define HAVE_SNPRINTF 1
 #endif

 #ifndef HAVE_STRCASECMP
  #define strcasecmp _stricmp
  #define HAVE_STRCASECMP 1
 #endif

 #ifndef HAVE_STRNCASECMP
  #define strncasecmp _strnicmp
  #define HAVE_STRNCASECMP 1
 #endif
#endif  // WIN32

#cmakedefine SCANDIR_NEEDS_CONST 1
#ifdef SCANDIR_NEEDS_CONST
 #define SCANDIR_CONST const
#else
 #define SCANDIR_CONST
#endif

#define OB_MODULE_PATH "@OB_MODULE_PATH@"

#ifndef TIME_WITH_SYS_TIME
  #ifdef HAVE_SYS_TIME
    #ifdef HAVE_TIME
      #define TIME_WITH_SYS_TIME 1
    #else
      #define TIME_WITH_SYS_TIME 0
    #endif
  #else
    #define TIME_WITH_SYS_TIME 0
  #endif
#endif
