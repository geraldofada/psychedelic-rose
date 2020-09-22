@echo off

REM cl switchs references
REM  -nologo, remove the msvc logo
REM      -Zi, creates a .pdb file used by the debbuger (if any error occurs look the -Z7)
REM      -W4, high error level close to Wall
REM      -WX, warnings are erros
REM      -MT, static link the thread lib to avoid compatibility issues (default is -MD)
REM      -FC, show the absolute path when compiling
REM    /link, give the linker options
REM -opt:ref, eliminates functions and data that are never referenced


if not exist "build/debug/x64" mkdir "build/debug/x64"

pushd "build/debug/x64"
cl -nologo -Zi -W4 -WX -MT -FC ../../../main.cc /link -opt:ref "../../../vendor/sdl2/lib/SDL2.lib"
popd
