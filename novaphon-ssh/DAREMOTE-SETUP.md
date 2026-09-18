# DaRemote SSH Setup - Novaphon / NOX Lab

## Szerverek

| Nev | LAN IP | Tailscale | User | Port | Leiras |
|-----|--------|-----------|------|------|--------|
| **AUDIT** | `192.168.1.100` | `audit` | `audit` | 22 | Audit/logging szerver |
| **NOX** | `192.168.1.102` | `nox` | `nox` | 22 | Orchestrator, ShadowBridge |
| **ASSISTANT** | `192.168.1.129` | `assistant` | `assistant` | 22 | LLM (LM Studio, Ollama) |
| **CREW** | `192.168.1.101` | `crew` | `crew` | 22 | Crew szerver |
| **ATTACK** | `192.168.1.103` | `attack` | `attack` | 22 | Metasploit, C2, Villain |
| **VICTIM** | `192.168.1.134` | `victim` | `victim` | 22 | i686 Kali, intentionally vuln |

---

## Miert nem megy? - Ellenorzo lista

### 1. SSH szerver fut-e a celgepen?
```bash
# Minden szerveren futtasd:
sudo systemctl status sshd
# Ha nem fut:
sudo systemctl enable --now sshd
```

### 2. Helyes IP-t hasznalod?
```bash
# Szerveren nezd meg az aktualis IP-t:
ip addr show | grep "inet "
# Tailscale IP:
tailscale ip -4
```

### 3. Tuzhely (firewall) engedi az SSH-t?
```bash
# UFW (Ubuntu/Debian):
sudo ufw allow 22/tcp
sudo ufw status

# firewalld (Fedora/CentOS):
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --reload

# iptables:
sudo iptables -L INPUT -n | grep 22
```

### 4. SSH config engedi a jelszo/kulcs autentikaciot?
```bash
# /etc/ssh/sshd_config - ezeknek kell benne lenniuk:
PasswordAuthentication yes          # jelszohoz
PubkeyAuthentication yes            # kulcshoz
PermitRootLogin prohibit-password   # root csak kulccsal
```
Valtoztatas utan: `sudo systemctl restart sshd`

### 5. Telefon es szerver ugyanazon a halozaton van?
- WiFi-n a telefon es a szerver azonos subneten legyenek (192.168.1.x)
- Ha mas halozaton vagy: hasznalj Tailscale-t

---

## SSH kulcs beallitas (ajanlott)

### A) Termuxbol (telefon)
```bash
pkg install openssh
ssh-keygen -t ed25519 -f ~/.ssh/noxlab_ed25519 -C "novaphon@noxlab"

# Kulcs masolasa minden szerverre:
ssh-copy-id -i ~/.ssh/noxlab_ed25519.pub audit@192.168.1.100
ssh-copy-id -i ~/.ssh/noxlab_ed25519.pub nox@192.168.1.102
ssh-copy-id -i ~/.ssh/noxlab_ed25519.pub assistant@192.168.1.129
ssh-copy-id -i ~/.ssh/noxlab_ed25519.pub crew@192.168.1.101
ssh-copy-id -i ~/.ssh/noxlab_ed25519.pub attack@192.168.1.103
ssh-copy-id -i ~/.ssh/noxlab_ed25519.pub victim@192.168.1.134
```

### B) DaRemote sajat kulcs generalasa
1. DaRemote -> Settings -> SSH Keys -> Generate
2. Masold ki a publikus kulcsot
3. Minden szerveren futtasd:
```bash
echo "A_PUBLIKUS_KULCS_IDE" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

### C) Jelszavas bejelentkezes (gyors teszt)
Ha eloszor csak tesztelni akarod:
1. DaRemote -> Add Server
2. Host: `192.168.1.102`
3. Port: `22`
4. User: `nox` (vagy ami a usered)
5. Auth: Password
6. Password: a szerver jelszavad

---

## DaRemote szerver hozzaadas

Minden szerverhez:

1. **+** gomb (uj szerver)
2. **Name**: AUDIT / NOX / ASSISTANT
3. **Host**: az IP cim a tablazatbol
4. **Port**: 22
5. **Username**: a user nev a tablazatbol
6. **Authentication**: 
   - `Password` -> add meg a jelszot
   - VAGY `Private Key` -> valaszd ki a `noxlab_ed25519` fajlt
7. **Save**

---

## Gyors debug parancsok

```bash
# Telefon -> szerver kapcsolat tesztje (Termux):
ssh -v -i ~/.ssh/noxlab_ed25519 nox@192.168.1.102

# Ping teszt:
ping -c 3 192.168.1.102

# Port nyitva van-e:
nc -zv 192.168.1.102 22

# Szerveren - ki van bejelentkezve SSH-n:
who

# Szerveren - SSH log:
sudo journalctl -u sshd -f
```

---

## Tailscale (tavoli eleres)

Ha nem vagy otthon a WiFi-n:
1. Telepitsd a Tailscale-t a telefonra es minden szerverre
2. Hasznald a Tailscale hostname-ot vagy IP-t a DaRemote-ban
3. A Tailscale IP-t igy nezzed: `tailscale ip -4`

```
# Tailscale-lel a DaRemote-ban:
Host: 100.x.x.x   (Tailscale IP)
# VAGY
Host: nox           (Tailscale hostname)
```
