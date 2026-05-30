#!/usr/bin/env bash
# =====================================================================
#  OpenAI Codex CLI - Auto Installer (macOS)
#  ติดตั้ง: Homebrew (ถ้ายังไม่มี), Node.js, Git, และ Codex CLI (@openai/codex)
#  วิธีใช้: เปิด Terminal แล้วรัน
#     chmod +x install-mac.sh
#     ./install-mac.sh
# =====================================================================

set -e

cyan="\033[0;36m"; green="\033[0;32m"; yellow="\033[1;33m"; magenta="\033[0;35m"; reset="\033[0m"
step() { printf "\n${cyan}==> %s${reset}\n" "$1"; }
ok()   { printf "    ${green}[OK] %s${reset}\n" "$1"; }
warn() { printf "    ${yellow}[!] %s${reset}\n" "$1"; }

printf "${magenta}============================================${reset}\n"
printf "${magenta}  OpenAI Codex CLI - ตัวติดตั้งสำหรับ macOS${reset}\n"
printf "${magenta}============================================${reset}\n"

# --- รีมายด์เรื่องบัญชี ChatGPT ก่อนเริ่ม ---
printf "\n${yellow}[!] ก่อนใช้งาน Codex คุณต้องมีบัญชี OpenAI ChatGPT (สมัครฟรีได้)${reset}\n"
printf "${yellow}    ยังไม่มี? สมัครที่ https://chatgpt.com ก่อน แล้วค่อยมา login ตอนเปิด codex${reset}\n"
read -p "    พิมพ์ Y เพื่อไปต่อ (หรือ N เพื่อหยุดไปสมัครก่อน): " go
case "$go" in
    [Yy]*) ;;
    *) echo "    หยุดไว้ก่อน — ไปสมัคร ChatGPT แล้วรันสคริปต์ใหม่นะ"; exit 0 ;;
esac

# --- 1) ติดตั้ง Homebrew ถ้ายังไม่มี ---
step "ตรวจสอบ Homebrew"
if ! command -v brew >/dev/null 2>&1; then
    warn "ไม่พบ Homebrew — กำลังติดตั้ง (อาจถามรหัสผ่านเครื่อง)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ -d "/opt/homebrew/bin" ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi
    if [ -d "/usr/local/bin" ];   then eval "$(/usr/local/bin/brew shellenv)";   fi
    ok "ติดตั้ง Homebrew เสร็จ"
else
    ok "มี Homebrew อยู่แล้ว: $(brew --version | head -n1)"
fi

# --- 2) ติดตั้ง Node.js ---
step "ติดตั้ง Node.js"
if command -v node >/dev/null 2>&1; then
    ok "มี Node.js อยู่แล้ว: $(node --version)"
else
    brew install node
    ok "ติดตั้ง Node.js เสร็จ"
fi

# --- 3) ติดตั้ง Git ---
step "ติดตั้ง Git (ระบบเก็บเวอร์ชันไฟล์ - แนะนำให้มี)"
if command -v git >/dev/null 2>&1; then
    ok "มี Git อยู่แล้ว: $(git --version)"
else
    brew install git
    ok "ติดตั้ง Git เสร็จ"
fi

# --- 4) ติดตั้ง Codex CLI ผ่าน npm ---
step "ติดตั้ง OpenAI Codex CLI"
# หมายเหตุ: ต้องเป็นแพ็กเกจ @openai/codex เท่านั้น (codex เปล่าๆ เป็นคนละตัว)
npm install -g @openai/codex
ok "ติดตั้ง Codex CLI เสร็จ"

# --- 5) ตรวจสอบผลการติดตั้ง ---
step "ตรวจสอบผลการติดตั้ง"
echo "    Node.js : $(node --version)"
echo "    npm     : $(npm --version)"
if command -v codex >/dev/null 2>&1; then
    echo "    Codex   : $(codex --version)"
else
    warn "ยังเรียก codex ไม่ได้ในหน้าต่างนี้ — ปิดแล้วเปิด Terminal ใหม่"
fi

printf "\n${green}============================================${reset}\n"
printf "${green}  เสร็จเรียบร้อย!${reset}\n"
printf "${green}  ขั้นต่อไป:${reset}\n"
echo "   1) ปิดแล้วเปิด Terminal ใหม่ 1 ครั้ง"
echo "   2) พิมพ์  codex  แล้วกด Enter"
echo "   3) เลือก 'Sign in with ChatGPT' แล้ว login ด้วยบัญชี ChatGPT ของคุณ"
printf "${green}============================================${reset}\n"
