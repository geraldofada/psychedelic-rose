@echo off

REM referencia dos switchs do cl
REM  -nologo, remove o logo do msvc
REM      -Zi, cria o arquivo .pdb para debug (caso der algum problema olhar o -Z7)
REM      -W4, nivel de erro alto próximo ao Wall
REM      -WX, tratar avisos como erro
REM      -MT, linkar estaticamente o arquivo .lib de thread (evita problemas de compatibilidade)
REM      -FC, na hora de compilar mostra o caminho absoluto dos arquivos
REM    /link, passa opções pro linker
REM -opt:ref, tenta remover o máximo opções não utilizadas nos arquivos map e debug


if not exist "build/debug/x64" mkdir "build/debug/x64"

pushd "build/debug/x64"
cl -nologo -Zi -W4 -WX -MT -FC ../../../main.cc /link -opt:ref "../../../vendor/sdl2/lib/SDL2.lib"
popd
