@echo off

REM IMPORTANT! This should be executed using the "x64 dev tools cmd" from MSVC

REM cl switches references
REM   -nologo, remove the msvc logo
REM       -Zi, creates a .pdb file used by the debbuger (if any error occurs look the -Z7)
REM       -W4, high error level close to Wall
REM       -WX, warnings are erros
REM       -MT, static link the thread lib to avoid compatibility issues (default is -MD)
REM       -FC, show the absolute path when compiling
REM        -I, additional directories to search include files
REM   -wd4100, ignore unused variables warning
REM     /link, give the linker options
REM  -opt:ref, eliminates functions and data that are never referenced
REM  -LIBPATH, additional directories to search lib files


if not exist "build/debug/x64" mkdir "build/debug/x64"
if not exist "build/debug/x64/SDL2.dll" copy "vendor\sdl2\lib\SDL2.dll" "build/debug/x64"

pushd "build/debug/x64"
cl -nologo -Zi -W4 -WX -MT -FC -wd4100 -I"../../../vendor/sdl2/include/" "../../../main.cc" /link -opt:ref -LIBPATH:"../../../vendor/sdl2/lib/" SDL2.lib
popd
