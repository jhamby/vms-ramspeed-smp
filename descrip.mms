! MMS/MMK build file
! Use MMS/EXT if you build with MMS.

CRTL_INIT = vms_crtl_init.obj, vms_crtl_values.obj

.ifdef MMSALPHA
CFLAGS = $(CFLAGS)/ARCH=HOST
.endif

CFLAGS = $(CFLAGS)/MAIN=POSIX_EXIT/DEFINE=(_USE_STD_STAT,_POSIX_EXIT,-
         __UNIX_PUTC,_XOPEN_SOURCE_EXTENDED)/FL=IEEE/IEEE=DENORM-
         /OPT=(LEV=5)/POI=LONG

ramsmp.exe : ramsmp.obj, intmem.obj, intmark.obj, fltmem.obj, fltmark.obj
        $(LINK) $(LINKFLAGS) $(MMS$SOURCE_LIST)

! Clean build artifacts
clean :
	del/log *.exe;*,*.obj;*
