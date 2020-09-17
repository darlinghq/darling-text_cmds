project(text_cmds)

if(COMMAND cmake_policy)
	cmake_policy(SET CMP0003 NEW)
endif(COMMAND cmake_policy)

# add_definitions(-DSUPPORT_UTMPX)

add_definitions(
	-DSORT_VERSION="text_cmds-101.40.1"
	-DWITHOUT_NLS
	-D__FBSDID=__RCSID
	-DSORT_THREADS
)


#set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -U_POSIX_C_SOURCE -D__DARWIN_UNIX03 -nostdinc -fblocks -fPIC -ggdb -O0")

#add_definitions(-DHAVE_INTTYPES_H -DHAVE_STDINT_H -DHAVE_SYS_PARAM_H -DHAVE_SYS_TIME_H)

include(InstallSymlink)
set(BINARY_PACKAGING_MODE ON)

add_darling_executable(banner banner/banner.c)
add_darling_executable(cat cat/cat.c)
add_darling_executable(col col/col.c)
add_darling_executable(colrm colrm/colrm.c)
add_darling_executable(column column/column.c)
add_darling_executable(comm comm/comm.c)
add_darling_executable(csplit csplit/csplit.c)
add_darling_executable(cut cut/cut.c)
add_darling_executable(ed ed/buf.c ed/cbc.c ed/glbl.c ed/io.c ed/main.c ed/re.c ed/sub.c ed/undo.c)
add_darling_executable(expand expand/expand.c)
add_darling_executable(fmt fmt/fmt.c)
add_darling_executable(fold fold/fold.c)
add_darling_executable(head head/head.c)
add_darling_executable(join join/join.c)
add_darling_executable(lam lam/lam.c)
add_darling_executable(look look/look.c)
add_darling_executable(md5 md5/md5.c md5/commoncrypto.c)
add_darling_executable(nl nl/nl.c)
add_darling_executable(paste paste/paste.c)
add_darling_executable(pr pr/egetopt.c pr/pr.c)
add_darling_executable(rev rev/rev.c)
add_darling_executable(rs rs/rs.c)
add_darling_executable(sed sed/compile.c sed/main.c sed/misc.c sed/process.c)

add_darling_executable(sort
	sort/bwstring.c
	sort/coll.c
	sort/commoncrypto.c
	sort/file.c
	sort/mem.c
	sort/radixsort.c
	sort/sort.c
	sort/vsort.c
)

set_target_properties(sort PROPERTIES COMPILE_FLAGS "-Wno-unknown-pragmas -Wno-tautological-compare")
set_target_properties(sort PROPERTIES COMPILE_DEFINITIONS "HAVE_CONFIG_H")
# Without the BEFORE it picks up a different config.h before searching this directory
target_include_directories(sort BEFORE PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/sort")

add_darling_executable(split split/split.c)
add_darling_executable(tail tail/tail.c tail/forward.c tail/reverse.c tail/misc.c tail/read.c)
add_darling_executable(tr tr/cmap.c  tr/cset.c  tr/str.c  tr/tr.c)
add_darling_executable(ul ul/ul.c)
target_link_libraries(ul ncurses)
add_darling_executable(unexpand unexpand/unexpand.c)
add_darling_executable(uniq uniq/uniq.c)
add_darling_executable(unvis unvis/unvis.c)
add_darling_executable(vis vis/vis.c vis/foldit.c)
add_darling_executable(wc wc/wc.c)

target_link_libraries(tr ncurses)

install(TARGETS cat ed
	DESTINATION libexec/darling/bin)
install(TARGETS banner col colrm column comm
	cut csplit expand fold fmt head
	join lam look md5 nl paste pr rev rs
	sed sort split tail tr ul unexpand
	uniq unvis vis wc
	DESTINATION libexec/darling/usr/bin)

set(man1
	cat/cat.1
	col/col.1
	colrm/colrm.1
	column/column.1
	comm/comm.1
	csplit/csplit.1
	cut/cut.1
	ed/ed.1
	ed/red.1
	expand/expand.1
	fmt/fmt.1
	fold/fold.1
	head/head.1
	join/join.1
	lam/lam.1
	look/look.1
	md5/md5.1
	nl/nl.1
	paste/paste.1
	pr/pr.1
	rev/rev.1
	rs/rs.1
	sed/sed.1
	sort/gen/sort.1
	split/split.1
	tail/tail.1
	tr/tr.1
	ul/ul.1
	uniq/uniq.1
	unvis/unvis.1
	vis/vis.1
	wc/wc.1
)

install(FILES ${man1} DESTINATION libexec/darling/usr/share/man/man1)

install(FILES banner/banner.6 DESTINATION libexec/darling/usr/share/man/man6)
