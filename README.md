# Lab CyberOffensive — Injection Meterpreter + évasion antivirus

## Objectif
Injecter un payload Meterpreter reverse TCP dans un binaire Windows et minimiser son score VirusTotal par empilement de techniques d'obfuscation statique et dynamique.

## Périmètre
- Kali Linux 192.168.56.104 et Windows XP SP3 **32 bits** 192.168.56.103
- Réseau Host-only VirtualBox isolé, XP sans Internet
- Score évalué via VirusTotal uniquement
- Aucune diffusion hors du lab

## Structure
    .
    ├── demo/phase0/        # Validation chaîne de base (binaire brut, 52/70)
    ├── module_a/           # Durcissement statique PE
    ├── module_b/           # Loader C + XOR
    └── final/              # Assemblage final

## Workflow
1. **Phase 0** ✅ — Payload brut, 52/70 VT
2. **Phase 1** (en cours) — Modules A et B en parallèle
3. **Phase 2** — Assemblage, comparaison des 3 scores VT

## Score de référence
| Version | Score VT |
|---------|----------|
| Phase 0 — brut | 52/70 |
| Module B — loader C | TBD |
| Module A+B — final | TBD |

## Avertissement
Cadre pédagogique, VMs isolées uniquement.
