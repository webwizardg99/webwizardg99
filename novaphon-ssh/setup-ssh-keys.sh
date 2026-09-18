#!/bin/bash
# =============================================================
# NOX Lab SSH Key Setup - Novaphon (DaRemote)
# =============================================================
# Futtasd a telefonon (Termux) VAGY a NOX szerveren,
# majd masold at a kulcsot a telefonra.
# =============================================================

set -e

KEY_NAME="noxlab_ed25519"
KEY_PATH="$HOME/.ssh/$KEY_NAME"
SERVERS=("192.168.1.100" "192.168.1.102" "192.168.1.129" "192.168.1.101" "192.168.1.103" "192.168.1.134")
USERS=("audit" "nox" "assistant" "crew" "attack" "victim")
NAMES=("AUDIT" "NOX" "ASSISTANT" "CREW" "ATTACK" "VICTIM")

echo "======================================"
echo "  NOX Lab SSH Key Setup"
echo "======================================"
echo ""

# --- 1. SSH kulcs generalas ---
if [ -f "$KEY_PATH" ]; then
    echo "[*] SSH kulcs mar letezik: $KEY_PATH"
    echo "    Uj kulcs generalasahoz toroldd elobb: rm $KEY_PATH $KEY_PATH.pub"
else
    echo "[+] Uj ED25519 SSH kulcs generalasa..."
    ssh-keygen -t ed25519 -f "$KEY_PATH" -C "novaphon-daremote@noxlab" -N ""
    echo "[OK] Kulcs generalva: $KEY_PATH"
fi

echo ""
echo "======================================"
echo "  Publikus kulcs masolasa szerverekre"
echo "======================================"
echo ""

for i in "${!SERVERS[@]}"; do
    echo "--- [${NAMES[$i]}] ${USERS[$i]}@${SERVERS[$i]} ---"
    echo "    Probalkozas ssh-copy-id..."

    if ssh-copy-id -i "$KEY_PATH.pub" "${USERS[$i]}@${SERVERS[$i]}" 2>/dev/null; then
        echo "    [OK] Kulcs telepitve: ${NAMES[$i]}"
    else
        echo "    [!] ssh-copy-id sikertelen. Manualis telepites:"
        echo ""
        echo "    Futtasd a szerveren (${NAMES[$i]}):"
        echo "    mkdir -p ~/.ssh && chmod 700 ~/.ssh"
        echo "    echo '$(cat "$KEY_PATH.pub" 2>/dev/null || echo "<PUBLIKUS_KULCS>")' >> ~/.ssh/authorized_keys"
        echo "    chmod 600 ~/.ssh/authorized_keys"
    fi
    echo ""
done

echo "======================================"
echo "  Teszteles"
echo "======================================"
echo ""

for i in "${!SERVERS[@]}"; do
    echo -n "[${NAMES[$i]}] Kapcsolat teszt ${USERS[$i]}@${SERVERS[$i]}... "
    if ssh -i "$KEY_PATH" -o ConnectTimeout=5 -o StrictHostKeyChecking=no \
        "${USERS[$i]}@${SERVERS[$i]}" "echo OK" 2>/dev/null; then
        echo "[SIKERES]"
    else
        echo "[SIKERTELEN] - Ellenorizd: IP, port, user, sshd fut-e"
    fi
done

echo ""
echo "======================================"
echo "  DaRemote Beallitas"
echo "======================================"
echo ""
echo "A DaRemote appban minden szerverhez:"
echo "  1. Host: <szerver IP>"
echo "  2. Port: 22"
echo "  3. User: <user nev>"
echo "  4. Auth: Private Key"
echo "  5. Key fajl: $KEY_PATH"
echo ""
echo "Ha Termuxban futtattad, a kulcs itt van:"
echo "  $KEY_PATH"
echo ""
echo "Keszz!"
