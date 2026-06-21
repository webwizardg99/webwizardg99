<div align="center">

```
███╗   ██╗ ██████╗ ██╗  ██╗    ██╗      █████╗ ██████╗ 
████╗  ██║██╔═══██╗╚██╗██╔╝    ██║     ██╔══██╗██╔══██╗
██╔██╗ ██║██║   ██║ ╚███╔╝     ██║     ███████║██████╔╝
██║╚██╗██║██║   ██║ ██╔██╗     ██║     ██╔══██║██╔══██╗
██║ ╚████║╚██████╔╝██╔╝ ██╗    ███████╗██║  ██║██████╔╝
╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝╚═════╝ 
```

[![Typing SVG](https://readme-typing-svg.demolab.com?font=Fira+Code&size=22&duration=3000&pause=1000&color=00D4FF&center=true&vCenter=true&width=700&lines=Security+Researcher+%26+Python+Engineer;Building+NOX+Lab+—+5-node+cybersecurity+homelab;AI+%7C+Honeypots+%7C+C2+%7C+OSINT+%7C+Threat+Intel;Founder+of+ShadowBridge+Security+Platform)](https://shadowbridge.store)

[![Profile Views](https://komarev.com/ghpvc/?username=webwizardg99&color=00d4ff&style=flat-square&label=PROFILE+VIEWS)](https://github.com/webwizardg99)
[![GitHub followers](https://img.shields.io/github/followers/webwizardg99?color=00d4ff&style=flat-square&logo=github&label=Followers)](https://github.com/webwizardg99?tab=followers)
[![Stars](https://img.shields.io/github/stars/webwizardg99?color=00d4ff&style=flat-square&logo=github&label=Total+Stars)](https://github.com/webwizardg99)
[![Website](https://img.shields.io/badge/shadowbridge.store-LIVE-00d4ff?style=flat-square&logo=google-chrome)](https://shadowbridge.store)

</div>

---

```python
class WizardG:
    def __init__(self):
        self.name     = "Gabriel Szabados"
        self.alias    = "wizardg / NOX"
        self.location = "Dunaszerdahely, Slovakia 🇸🇰"
        self.role     = "Security Researcher & Python Engineer"
        self.founded  = "ShadowBridge — Cybersecurity Monitoring Platform"
        self.exp      = "10+ years building security infrastructure"

    @property
    def stack(self):
        return {
            "languages":  ["Python", "JavaScript", "TypeScript", "Bash"],
            "backend":    ["FastAPI", "aiohttp", "Node.js"],
            "security":   ["Cowrie", "Suricata", "Wazuh", "MITRE ATT&CK", "Metasploit"],
            "ai":         ["Ollama", "OpenAI", "Claude", "LangChain", "LLM fine-tuning"],
            "infra":      ["Docker", "Kali Linux", "PostgreSQL", "Redis", "Tailscale"],
            "currently":  ["NOX Lab v2", "ShadowBridge SaaS", "HoneyAI Phase 3"],
        }

me = WizardG()
print(f"[{me.alias}@NOX ~]$ ./build_the_future.sh 🚀")
```

---

## 🔥 Featured Projects

<table>
<tr>
<td width="50%">

### 🛡️ [ShadowBridge](https://shadowbridge.store)
**Full-stack cybersecurity monitoring platform**
- 12 integrated security modules
- Real-time threat dashboards & AI analysis
- Honeypot aggregation + MITRE ATT&CK tracking
- Built for SOC teams and solo operators

[![Stars](https://img.shields.io/github/stars/webwizardg99/shadowbridge-web?style=flat-square&color=00d4ff)](https://github.com/webwizardg99/shadowbridge-web)
[![Live](https://img.shields.io/badge/🌐_Live-shadowbridge.store-00d4ff?style=flat-square)](https://shadowbridge.store)

</td>
<td width="50%">

### 🍯 [HoneyAI](https://github.com/webwizardg99/honeyai)
**AI-powered SSH Honeypot**
- LLM generates realistic shell output per attacker command
- Real-time TTP detection & MITRE ATT&CK classification
- Cowrie LLM backend compatible (drop-in replacement)
- SENTINEL + ATLAS integration

[![Stars](https://img.shields.io/github/stars/webwizardg99/honeyai?style=flat-square&color=00d4ff)](https://github.com/webwizardg99/honeyai)
[![Issues welcome](https://img.shields.io/badge/PRs-welcome-00d4ff?style=flat-square)](https://github.com/webwizardg99/honeyai/issues)

</td>
</tr>
<tr>
<td width="50%">

### 🗺️ [ATLAS](https://github.com/webwizardg99/atlas)
**Purple Team ATT&CK Tracker**
- Full MITRE ATT&CK matrix (14 tactics, 200+ techniques)
- Red / Blue / Purple TTP status tracking
- REST API — integrates with any SOC dashboard
- Lightweight, self-hosted, no cloud dependency

[![Stars](https://img.shields.io/github/stars/webwizardg99/atlas?style=flat-square&color=00d4ff)](https://github.com/webwizardg99/atlas)

</td>
<td width="50%">

### 🔔 [SENTINEL](https://github.com/webwizardg99/sentinel)
**Multi-Source Honeypot Aggregator**
- Cowrie SSH + HTTP honeypot + Canary tokens unified
- AbuseIPDB IP reputation enrichment
- Real-time threat timeline & alerts
- JSON API for dashboards and SIEMs

[![Stars](https://img.shields.io/github/stars/webwizardg99/sentinel?style=flat-square&color=00d4ff)](https://github.com/webwizardg99/sentinel)

</td>
</tr>
</table>

---

## 🏗️ NOX Lab Infrastructure

> A 5-node cybersecurity homelab I've been building since 2016 — everything runs here.

```
┌─────────────────────────────────────────────────────────────────┐
│                        NOX LAB NETWORK                           │
│                                                                  │
│  [NOX Server / Orchestrator]  192.168.1.102                      │
│   ├── ShadowBridge Dashboard     :8888  ← control plane          │
│   ├── SENTINEL (SSH/HTTP/Canary) :8181/8282                      │
│   ├── HoneyAI SSH Honeypot       :8191  ← LLM-powered            │
│   ├── ATLAS ATT&CK Tracker       :8686                           │
│   ├── VAULT Credential Hub       :8585  ← John/Hashcat           │
│   ├── NOX-COMMAND Kill Chain     :8787                           │
│   └── NOX-BRAIN AI Layer         :8484  ← Ollama                 │
│                                                                  │
│  [Assistant]  192.168.1.129 — LLMs (LM Studio, Ollama)          │
│  [Monitoring] Tailscale — passive sniffing, Suricata IDS         │
│  [Attack]     Tailscale — Metasploit, C2 (Villain), tools        │
│  [Victim]     192.168.1.134 — i686 Kali, intentionally vuln      │
└─────────────────────────────────────────────────────────────────┘
```

---

## ⚡ Tech Arsenal

<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Kali Linux](https://img.shields.io/badge/Kali_Linux-557C94?style=for-the-badge&logo=kali-linux&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=node.js&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Redis](https://img.shields.io/badge/Redis-DC382D?style=for-the-badge&logo=redis&logoColor=white)
![OpenAI](https://img.shields.io/badge/Ollama_/_OpenAI-412991?style=for-the-badge&logo=openai&logoColor=white)
![Metasploit](https://img.shields.io/badge/Metasploit-E32929?style=for-the-badge&logo=metasploit&logoColor=white)
![Suricata](https://img.shields.io/badge/Suricata_IDS-EF7D00?style=for-the-badge&logo=suricata&logoColor=white)
![Wazuh](https://img.shields.io/badge/Wazuh_SIEM-005571?style=for-the-badge&logo=wazuh&logoColor=white)

</div>

---

## 📊 GitHub Stats

<div align="center">
<img src="https://github-readme-stats.vercel.app/api?username=webwizardg99&show_icons=true&theme=radical&bg_color=0d1117&border_color=00d4ff&icon_color=00d4ff&title_color=00d4ff&text_color=e2e8f0&rank_icon=github&include_all_commits=true&count_private=true" width="48%" />
<img src="https://github-readme-streak-stats.herokuapp.com/?user=webwizardg99&theme=radical&background=0d1117&border=00d4ff&ring=00d4ff&fire=ff3b5c&currStreakLabel=00d4ff" width="48%" />
</div>

<div align="center">
<img src="https://github-readme-stats.vercel.app/api/top-langs/?username=webwizardg99&layout=compact&theme=radical&bg_color=0d1117&border_color=00d4ff&title_color=00d4ff&text_color=e2e8f0&langs_count=8" width="40%" />
</div>

---

## 🤝 Collaborate / Support

**Looking for:**
- 🔬 Security researchers to test and contribute to HoneyAI, SENTINEL, ATLAS
- 💡 Feature ideas and bug reports — [open an issue](https://github.com/webwizardg99/honeyai/issues)
- 🌍 Translations, docs, and integration PRs

**Support the NOX Lab:**

[![ko-fi](https://img.shields.io/badge/Ko--fi-Support_the_Lab-FF5E5B?style=for-the-badge&logo=ko-fi&logoColor=white)](https://ko-fi.com/wizardg)
[![Freelancer](https://img.shields.io/badge/Hire_Me-Freelancer-29B2FE?style=for-the-badge&logo=freelancer&logoColor=white)](https://www.freelancer.com/u/wizardg99)
[![Fiverr](https://img.shields.io/badge/Hire_Me-Fiverr-1DBF73?style=for-the-badge&logo=fiverr&logoColor=white)](https://www.fiverr.com/webwizardg86)

---

## 📫 Find Me

<div align="center">

[![Website](https://img.shields.io/badge/shadowbridge.store-00D4FF?style=for-the-badge&logo=google-chrome&logoColor=black)](https://shadowbridge.store)
[![Email](https://img.shields.io/badge/hello@shadowbridge.store-EA4335?style=for-the-badge&logo=gmail&logoColor=white)](mailto:hello@shadowbridge.store)
[![Freelancer](https://img.shields.io/badge/Freelancer-wizardg99-29B2FE?style=for-the-badge&logo=freelancer)](https://www.freelancer.com/u/wizardg99)
[![Fiverr](https://img.shields.io/badge/Fiverr-webwizardg86-1DBF73?style=for-the-badge&logo=fiverr)](https://www.fiverr.com/webwizardg86)

</div>

<div align="center">

```
[NOX@shadowbridge ~]$ echo "10 years building. Still going."
10 years building. Still going.
[NOX@shadowbridge ~]$ _
```

</div>
