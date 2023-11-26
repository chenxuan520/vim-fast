@echo off

REM echo info
echo System version：%OS%
echo Home path is %USERPROFILE%
echo.

REM check for bin
where git >nul 2>nul
if %errorlevel% equ 0 (
    echo git is installed on this computer.
	where git
) else (
    color 0C
    echo git is not installed on this computer.
	echo get it from https://pc.qq.com/detail/13/detail_22693.html
	pause
	return
)
where vim >nul 2>nul
if %errorlevel% equ 0 (
    echo vim is installed on this computer.
	where vim
) else (
	color 0C
    echo vim is not installed on this computer.
	echo get it from https://github.com/vim/vim-win32-installer/releases
	pause
	exit
)
where node >nul 2>nul
if %errorlevel% equ 0 (
    echo nodejs is installed on this computer.
	where node
) else (
	color 0C
    echo nodejs is not installed on this computer.
	echo get it from https://nodejs.org/en/download
	pause
	exit
)

REM ask for if continue
set /p choice=it will delete you old vim config,do you want to continue? (y/n)
if /i "%choice%"=="n" (
    echo Exiting the script...
	pause
    exit
)

REM remove old config
rmdir /s /q "%USERPROFILE%\vimfiles"

REM check vimfiles path
if not exist "%USERPROFILE%\vimfiles" mkdir "%USERPROFILE%\vimfiles"

REM link the vimfiles
copy .\.vimrc %USERPROFILE%\_vimrc
mklink /J %USERPROFILE%\vimfiles\autoload .\autoload
mklink /J %USERPROFILE%\vimfiles\ftplugin .\ftplugin
mklink /J %USERPROFILE%\vimfiles\colors   .\colors

REM check vim-plug path
if not exist "%USERPROFILE%\.vim\plugged" mkdir "%USERPROFILE%\.vim\plugged"

REM coc install
IF NOT EXIST "%USERPROFILE%\.vim\plugged\coc.nvim" (
  git clone -b release https://gitee.com/zgpio/coc.nvim.git "%USERPROFILE%\.vim\plugged\coc.nvim"
  cd "%USERPROFILE%\.vim\plugged"
  git reset --hard v0.0.81	
)

REM install other plug,TODO
REM cd "%USERPROFILE%\.vim"
REM del ./vim.tar.gz
REM curl https://gitee.com/mirrorvim/vim-fast/releases/download/v1.0.12/vim.tar.gz -o vim.tar.gz
REM tar -zxvf ./vim.tar.gz
vim -c "PlugInstall" -c "q" -c "q"

echo vim-fast install ok,have a good time
pause
