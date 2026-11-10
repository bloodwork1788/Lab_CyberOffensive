# Module A — Durcissement statique du PE

## Responsable
Module A (moi)

## Objectif
- Falsification du TimeDateStamp PE
- Renommage de la section shellcode

## Prérequis
- Phase 0 validée (voir demo/phase0/)
- loader.exe fourni par Module B
- Python 3 + pefile

## Utilisation
    python3 pe_harden.py -i loader.exe -o loader_hardened.exe

## Statut
- [ ] Squelette créé
- [ ] fake_timestamp() implémenté
- [ ] rename_section() implémenté
- [ ] Testé sur PE 32 bits neutre
- [ ] Testé sur loader.exe de Module B
- [ ] Scores VT comparés dans results_A.md
