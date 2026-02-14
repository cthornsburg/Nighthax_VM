# Installed tools (NighHax VM)

This is the **baseline toolset** installed by `nighthax-setup.sh`.

Notes:
- Exact availability can vary slightly by Ubuntu/Xubuntu version and apt repos.
- Some tools are CLI-only; others have GUI frontends.

## GUI tools

- **Firefox** — primary browser for research + web-based CTF helpers.
- **Wireshark** — GUI packet capture/analysis for PCAP challenges.
- **DB Browser for SQLite** (`sqlitebrowser`) — GUI for inspecting `.sqlite` databases (web app artifacts, browser history, etc.).

## CLI tools

### System / utility
- **git** — pull the setup repo + updates.
- **curl** / **wget** — fetch files, interact with HTTP endpoints.
- **unzip** / **p7zip** (`7z`) — extract archives.
- **tmux** — persistent terminal sessions.
- **ripgrep** (`rg`) — fast text search in files.
- **jq** — JSON parsing and transformation.
- **gron** — flatten JSON into greppable paths.

### Python tooling
- **python3** / **python3-venv** — scripting + virtual environments.
- **pipx** — install Python CLI tools in isolated environments.

### Network / scanning
- **nmap** — host/service discovery + enumeration.
- **tcpdump** — CLI packet capture.
- **tshark** — CLI Wireshark.
- **whois** — domain registration lookup.
- **dnsutils** — DNS utilities (notably `dig`, `nslookup`).

### Passwords / hashes
- **John the Ripper** (`john`) — CPU password cracking (when feasible).

### Forensics / file carving
- **exiftool** — metadata inspection.
- **binwalk** — identify/extract embedded data in binaries/files.
- **foremost** — file carving.
- **bulk-extractor** — bulk extraction of artifacts (emails/URLs/CCNs) from disk images and files.
- **ssdeep** — fuzzy hashing / similarity.

### Memory forensics
- **volatility3** — memory analysis framework.

### Debugging / reversing basics
- **gdb** — debugger.

## Package groups installed by setup

The canonical list is in:
- `tasks/00_system_prep.sh`
- `tasks/20_ctf_tooling.sh`
