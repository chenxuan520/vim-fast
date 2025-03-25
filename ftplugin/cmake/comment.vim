" set preparecode in buffernew
func! VimFastSetPreCode()
	let s:version=system("cmake --version| grep version|awk '{print $3}'")
	let s:version = substitute(s:version, '[\r\n]', '', '')
	call append(line(".")-1,"# cmake version")
	call append(line(".")-1,"cmake_minimum_required(VERSION " . s:version .")")
	call append(line(".")-1,"# project name")
	call append(line(".")-1,"project(" . split(expand('%:p'),'/')[-2] . ")")
	call append(line(".")-1,"")
	call append(line(".")-1,"# set c++ version")
	call append(line(".")-1,"set(CMAKE_CXX_STANDARD 17)")
	call append(line(".")-1,"")
	call append(line(".")-1,"# include dir add,split by<space>")
	call append(line(".")-1,"# include_directories()")
	call append(line(".")-1,"")
	call append(line(".")-1,"# link dir add")
	call append(line(".")-1,"# link_directories()")
	call append(line(".")-1,"# link_libraries(-lpthread)")
	call append(line(".")-1,"")
	call append(line(".")-1,"# add source")
	call append(line(".")-1,"aux_source_directory(./src DIR_SRCS)")
	call append(line(".")-1,"add_executable(" . split(expand('%:p'),'/')[-2] . " ${DIR_SRCS})")
endfunc
" set iab for cmake
iab <buffer> define add_definitions(
iab <buffer> sflag set( CMAKE_CXX_FLAGS
iab <buffer> stype set( CMAKE_BUILD_TYPE
iab <buffer> spath set( EXECUTABLE_OUTPUT_PATH 
iab <buffer> sub add_subdirectory(
iab <buffer> link link_directories(
iab <buffer> exe add_executable(
