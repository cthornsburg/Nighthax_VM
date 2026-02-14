#!/usr/bin/env bash
set -euo pipefail

# Configure Firefox default homepage/policies and provide a local "Start Here" page.
#
# Rationale: avoid desktop clutter; provide onboarding in the browser.

PROFILE="${1:-ctf-standard}"
TARGET_USER="${NIGHHAX_TARGET_USER:-${SUDO_USER:-nico}}"
TARGET_HOME="$(getent passwd "$TARGET_USER" | cut -d: -f6 || true)"

if [[ -z "$TARGET_HOME" || ! -d "$TARGET_HOME" ]]; then
  echo "[nighthax] browser_setup: could not resolve home for user: $TARGET_USER" >&2
  exit 1
fi

# Firefox policies (system-wide)
#
# We use a hosted HTTPS start page to avoid snap confinement / file:// access issues.
START_URL="https://nighthax.com"

POLICY_JSON=$(cat <<JSON
{
  "policies": {
    "Homepage": {
      "StartPage": "homepage",
      "URL": "${START_URL}"
    },
    "OverrideFirstRunPage": "${START_URL}",
    "DisableTelemetry": true,
    "DisplayBookmarksToolbar": true,
    "Bookmarks": [
      {
        "Title": "NighHax",
        "URL": "https://nighthax.com/",
        "Folder": "Start Here",
        "Placement": "toolbar"
      },
      {
        "Title": "NLC Cyber Hub",
        "URL": "https://cthornsburg.github.io/nlc_cyber/",
        "Folder": "Start Here",
        "Placement": "toolbar"
      },
      {
        "Title": "CTFtime",
        "URL": "https://ctftime.org/",
        "Folder": "Start Here",
        "Placement": "toolbar"
      },

      {"Title":"OSINT Framework","URL":"https://osintframework.com/","Folder":"NCL · OSINT","Placement":"toolbar"},
      {"Title":"Awesome OSINT","URL":"https://github.com/jivoi/awesome-osint","Folder":"NCL · OSINT","Placement":"toolbar"},
      {"Title":"TinEye","URL":"https://tineye.com/","Folder":"NCL · OSINT","Placement":"toolbar"},
      {"Title":"Overpass Turbo","URL":"https://overpass-turbo.eu/","Folder":"NCL · OSINT","Placement":"toolbar"},
      {"Title":"crt.sh (Certificate Transparency)","URL":"https://crt.sh/","Folder":"NCL · OSINT","Placement":"toolbar"},
      {"Title":"ICANN WHOIS","URL":"https://lookup.icann.org/","Folder":"NCL · OSINT","Placement":"toolbar"},

      {"Title":"Nmap Reference Guide","URL":"https://nmap.org/book/man.html","Folder":"NCL · Scanning + Enumeration","Placement":"toolbar"},
      {"Title":"Shodan","URL":"https://www.shodan.io/","Folder":"NCL · Scanning + Enumeration","Placement":"toolbar"},
      {"Title":"GTFOBins","URL":"https://gtfobins.github.io/","Folder":"NCL · Scanning + Enumeration","Placement":"toolbar"},
      {"Title":"LOLBAS","URL":"https://lolbas-project.github.io/","Folder":"NCL · Scanning + Enumeration","Placement":"toolbar"},
      {"Title":"Exploit-DB","URL":"https://www.exploit-db.com/","Folder":"NCL · Scanning + Enumeration","Placement":"toolbar"},
      {"Title":"PayloadsAllTheThings","URL":"https://github.com/swisskyrepo/PayloadsAllTheThings","Folder":"NCL · Scanning + Enumeration","Placement":"toolbar"},

      {"Title":"CyberChef","URL":"https://gchq.github.io/CyberChef/","Folder":"NCL · Cryptography","Placement":"toolbar"},
      {"Title":"dCode","URL":"https://www.dcode.fr/en","Folder":"NCL · Cryptography","Placement":"toolbar"},
      {"Title":"Rumkin Cipher Tools","URL":"https://rumkin.com/tools/cipher/","Folder":"NCL · Cryptography","Placement":"toolbar"},
      {"Title":"QuipQiup","URL":"https://quipqiup.com/","Folder":"NCL · Cryptography","Placement":"toolbar"},
      {"Title":"Cryptii","URL":"https://cryptii.com/","Folder":"NCL · Cryptography","Placement":"toolbar"},
      {"Title":"Dogbolt (Decompiler Explorer)","URL":"https://dogbolt.org/","Folder":"NCL · Cryptography","Placement":"toolbar"},

      {"Title":"Name-That-Hash","URL":"https://nth.skerritt.blog/","Folder":"NCL · Password Cracking","Placement":"toolbar"},
      {"Title":"CrackStation (hash lookup)","URL":"https://crackstation.net/","Folder":"NCL · Password Cracking","Placement":"toolbar"},
      {"Title":"Hashes.com (hash database)","URL":"https://hashes.com/en/decrypt/hash","Folder":"NCL · Password Cracking","Placement":"toolbar"},
      {"Title":"md5decrypt.net","URL":"https://md5decrypt.net/en/","Folder":"NCL · Password Cracking","Placement":"toolbar"},
      {"Title":"pdf2john (online)","URL":"https://hashes.com/en/johntheripper/pdf2john","Folder":"NCL · Password Cracking","Placement":"toolbar"},
      {"Title":"zip2john (online)","URL":"https://hashes.com/en/johntheripper/zip2john","Folder":"NCL · Password Cracking","Placement":"toolbar"},
      {"Title":"7z2john (online)","URL":"https://hashes.com/en/johntheripper/7z2john","Folder":"NCL · Password Cracking","Placement":"toolbar"},
      {"Title":"office2john (online)","URL":"https://hashes.com/en/johntheripper/office2john","Folder":"NCL · Password Cracking","Placement":"toolbar"},
      {"Title":"CyberChef","URL":"https://gchq.github.io/CyberChef/","Folder":"NCL · Password Cracking","Placement":"toolbar"},
      {"Title":"Hashcat Wiki (reference)","URL":"https://hashcat.net/wiki/","Folder":"NCL · Password Cracking","Placement":"toolbar"},
      {"Title":"John the Ripper (reference)","URL":"https://github.com/openwall/john","Folder":"NCL · Password Cracking","Placement":"toolbar"},

      {"Title":"Wireshark Display Filters","URL":"https://www.wireshark.org/docs/dfref/","Folder":"NCL · Traffic + Wireless","Placement":"toolbar"},
      {"Title":"Malware Traffic Analysis (PCAPs)","URL":"https://www.malware-traffic-analysis.net/","Folder":"NCL · Traffic + Wireless","Placement":"toolbar"},
      {"Title":"Zeek Docs","URL":"https://docs.zeek.org/en/current/","Folder":"NCL · Traffic + Wireless","Placement":"toolbar"},

      {"Title":"Splunk SPL Search Reference","URL":"https://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Search","Folder":"NCL · Log Analysis","Placement":"toolbar"},
      {"Title":"Elastic Security Labs","URL":"https://www.elastic.co/security-labs","Folder":"NCL · Log Analysis","Placement":"toolbar"},

      {"Title":"Autopsy","URL":"https://www.autopsy.com/","Folder":"NCL · Forensics","Placement":"toolbar"},
      {"Title":"Volatility Foundation","URL":"https://www.volatilityfoundation.org/","Folder":"NCL · Forensics","Placement":"toolbar"},
      {"Title":"DFIR.training","URL":"https://dfir.training/","Folder":"NCL · Forensics","Placement":"toolbar"},

      {"Title":"PortSwigger Web Security Academy","URL":"https://portswigger.net/web-security","Folder":"NCL · Web Application Security","Placement":"toolbar"},
      {"Title":"OWASP Cheat Sheet Series","URL":"https://cheatsheetseries.owasp.org/","Folder":"NCL · Web Application Security","Placement":"toolbar"},
      {"Title":"Wappalyzer","URL":"https://www.wappalyzer.com/","Folder":"NCL · Web Application Security","Placement":"toolbar"},
      {"Title":"Regex101","URL":"https://regex101.com/","Folder":"NCL · Web Application Security","Placement":"toolbar"},

      {"Title":"Aircrack-ng","URL":"https://www.aircrack-ng.org/","Folder":"NCL · Traffic + Wireless","Placement":"toolbar"},
      {"Title":"WiGLE","URL":"https://wigle.net/","Folder":"NCL · Traffic + Wireless","Placement":"toolbar"}
    ]
  }
}
JSON
)

install -d /etc/firefox/policies
printf '%s\n' "$POLICY_JSON" >/etc/firefox/policies/policies.json

# Also attempt snap policy location (best-effort; may not exist)
if [[ -d /var/snap/firefox/common ]]; then
  install -d /var/snap/firefox/common/policies/managed
  printf '%s\n' "$POLICY_JSON" >/var/snap/firefox/common/policies/managed/policies.json
fi
