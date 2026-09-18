#!/bin/bash
# =============================================================
# NOX Lab - Szerver Elokezites DaRemote-hoz
# =============================================================
# Futtasd MINDEN szerveren (AUDIT, NOX, ASSISTANT, CREW, ATTACK, VICTIM) root-kent
# hogy az SSH elerheto legyen a telefonrol.
# =============================================================

set -e

echo "======================================"
echo "  NOX Lab - SSH Szerver Elokezites"
echo "======================================"
echo ""

# --- 1. SSH szerver telepites es inditasa ---
echo "[1/5] SSH szerver ellenorzese..."
if command -v sshd &>/dev/null || command -v ssh &>/dev/null; then
    echo "  [OK] OpenSSH telepitve"
else
    echo "  [+] OpenSSH telepitese..."
    if command -v apt-get &>/dev/null; then
        apt-get update && apt-get install -y openssh-server
    elif command -v dnf &>/dev/null; then
        dnf install -y openssh-server
    elif command -v pacman &>/dev/null; then
        pacman -S --noconfirm openssh
    fi
fi

echo "[2/5] SSHD inditasa es engedelyezese..."
systemctl enable sshd 2>/dev/null || systemctl enable ssh 2>/dev/null || true
systemctl start sshd 2>/dev/null || systemctl start ssh 2>/dev/null || true
echo "  [OK] SSHD fut"

# --- 2. SSH config beallitasa ---
echo "[3/5] SSH konfig beallitasa..."
SSHD_CONFIG="/etc/ssh/sshd_config"

backup_and_set() {
    local key="$1"
    local value="$2"
    if grep -q "^#*${key}" "$SSHD_CONFIG" 2>/dev/null; then
        sed -i "s/^#*${key}.*/${key} ${value}/" "$SSHD_CONFIG"
    else
        echo "${key} ${value}" >> "$SSHD_CONFIG"
    fi
}

cp "$SSHD_CONFIG" "${SSHD_CONFIG}.bak.$(date +%Y%m%d)" 2>/dev/null || true

backup_and_set "PubkeyAuthentication" "yes"
backup_and_set "PasswordAuthentication" "yes"
backup_and_set "PermitRootLogin" "prohibit-password"
backup_and_set "ChallengeResponseAuthentication" "no"
backup_and_set "UsePAM" "yes"
backup_and_set "ClientAliveInterval" "60"
backup_and_set "ClientAliveCountMax" "3"

systemctl restart sshd 2>/dev/null || systemctl restart ssh 2>/dev/null || true
echo "  [OK] SSH konfig frissitve es ujrainditva"

# --- 3. Firewall ---
echo "[4/5] Firewall beallitas (port 22)..."
if command -v ufw &>/dev/null; then
    ufw allow 22/tcp
    echo "  [OK] UFW: port 22 engedelyezve"
elif command -v firewall-cmd &>/dev/null; then
    firewall-cmd --permanent --add-service=ssh
    firewall-cmd --reload
    echo "  [OK] firewalld: SSH engedelyezve"
else
    echo "  [i] Nincs ismert firewall - manualis ellenorzes kell"
fi

# --- 4. User ellenorzes ---
echo "[5/5] User informaciok..."
CURRENT_USER=$(whoami)
IP_ADDR=$(ip -4 addr show | grep -oP '(?<=inet\s)192\.168\.\d+\.\d+' | head -1)
TS_IP=$(tailscale ip -4 2>/dev/null || echo "N/A")
HOSTNAME=$(hostname)

echo ""
echo "======================================"
echo "  DaRemote Beallitasok ehhez a gephez"
echo "======================================"
echo ""
echo "  Nev:       $HOSTNAME"
echo "  LAN IP:    ${IP_ADDR:-ismeretlen}"
echo "  TS IP:     $TS_IP"
echo "  User:      $CURRENT_USER"
echo "  Port:      22"
echo "  Auth:      Password VAGY SSH Key"
echo ""
echo "  DaRemote-ban:"
echo "    Host:     ${IP_ADDR:-$TS_IP}"
echo "    Port:     22"
echo "    Username: $CURRENT_USER"
echo ""
echo "  Teszteld a telefonrol (Termux):"
echo "    ssh $CURRENT_USER@${IP_ADDR:-$TS_IP}"
echo ""
echo "======================================"
echo "  KESZZ!"
echo "======================================"
