Echo off

cls
color 1f
title Kit de manutenção de Imagem.

:menu
Time /t
Date /t
echo               Desenvolvido pelo D0wr1k
echo .         
echo **************************************
echo *                                    *
echo *       Seleciona a opcao desejada:  *
echo *                                    *
echo *        1) ScanNow                  *
echo *        2) RestoreHealth            *
echo *        3) ScanHealth               *
echo *        4) Desativar Firewall       *
echo *        5) Rede                     *
echo *        6) Lista de Processos       *
echo *        7) Sair                     *
echo *                                    *
echo **************************************
echo.

set /p op= Digite sua opcao ?
if %op% equ 1 goto 1
if %op% equ 2 goto 2
if %op% equ 3 goto 3
if %op% equ 4 goto 4
if %op% equ 5 goto 5
if %op% equ 6 goto 6
if %op% equ 7 goto 7


:1
 CLS
sfc/scannow
 PAUSE
 CLS
goto menu

:2
 CLS
 DISM /Online /Cleanup-Image /RestoreHealth
 PAUSE
 CLS
goto menu

:3
 CLS
 DISM /Online /Cleanup-Image /ScanHealth
 PAUSE
 CLS
goto menu

:4
 CLS
 netsh advfirewall set allprofiles state off
 PAUSE
 CLS
goto menu


:5
Time /t
Date /t
 CLS
echo submenu
echo **************************************
echo *                                    *
echo *       Seleciona a opcao desejada:  *
echo *                                    *
echo *        1) IP_Release               *
echo *        2) IP_New                   *
echo *        3) IP_Flushdns              *
echo *        4) IP_All                   *
echo *        5) DHCP                     *
echo *        6) Gpupdate                 *
echo *        7) Reiniciar Agora          *
echo *        9) voltar                   *
echo *                                    *
echo **************************************

set /p opcao= Escolha uma opção: 
echo ------------------------------
if %opcao% equ 1 goto opcao1b
if %opcao% equ 2 goto opcao2b
if %opcao% equ 3 goto opcao3b
if %opcao% equ 4 goto opcao4b
if %opcao% equ 5 goto opcao5b
if %opcao% equ 6 goto opcao6b
if %opcao% equ 7 goto opcao7b
if %opcao% equ 9 goto opcao9b

: opcao1b
 CLS
 ipconfig/release
goto menu

:opcao2b
 ipconfig/renew
goto menu

:opcao3b
 CLS
 ipconfig/flushdns
goto menu

:opcao4b
 CLS
 ipconfig/all
goto menu

:opcao5b
 CLS
netsh interface ip set address "Ethernet" dhcp
netsh interface ip set dns "Ethernet" dhcp
goto menu

:opcao6b
 CLS
 gpupdate/force
goto menu

:opcao7b
 CLS
shutdown -r -f -t 00
goto menu

:opcao9b
PAUSE
CLS
goto menu

:6
 CLS
tasklist
 PAUSE
 CLS
goto menu


:7
           Exit