@echo off

if exist src\fscanner.l goto dir_okay
echo !!!! Must run this batch file from the main source directory!
exit

:dir_okay

echo ---- Start by patching the ylwrap script to avoid problems
echo      with "ln -s":

patch -p0 -i packages/MSDOS/ylwrap.pat

echo ---- Now configure and make it.
echo -- NOTE --: this assumes you have pdcurses installed!
echo -- NOTE --: Will be using '-f' mode of flex, for faster scanning
bash configure
make CURSES_LIBS=-lpdcurses LFLAGS="-f8B"

echo ---- You may now call "make install", if desired.
echo -- DONE --
