# =====================================================================
#  OpenAI Codex CLI - Auto Installer (Windows)
#  ติดตั้ง: Node.js LTS, Git, และ Codex CLI (@openai/codex)
#  วิธีใช้: เปิด PowerShell แบบ Run as Administrator แล้วรัน
#     Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
#     .\install-windows.ps1
# =====================================================================

$ErrorActionPreference = "Stop"

function Write-Step($msg)  { Write-Host "`n==> $msg" -ForegroundColor Cyan }
function Write-Ok($msg)    { Write-Host "    [OK] $msg" -ForegroundColor Green }
function Write-Warn($msg)  { Write-Host "    [!] $msg" -ForegroundColor Yellow }

Write-Host "============================================" -ForegroundColor Magenta
Write-Host "  OpenAI Codex CLI - ตัวติดตั้งสำหรับ Windows" -ForegroundColor Magenta
Write-Host "============================================" -ForegroundColor Magenta

# --- รีมายด์เรื่องบัญชี ChatGPT ก่อนเริ่ม ---
Write-Host "`n[!] ก่อนใช้งาน Codex คุณต้องมีบัญชี OpenAI ChatGPT (สมัครฟรีได้)" -ForegroundColor Yellow
Write-Host "    ยังไม่มี? สมัครที่ https://chatgpt.com ก่อน แล้วค่อยมา login ตอนเปิด codex" -ForegroundColor Yellow
$go = Read-Host "    พิมพ์ Y เพื่อไปต่อ (หรือ N เพื่อหยุดไปสมัครก่อน)"
if ($go -notmatch '^[Yy]') { Write-Host "    หยุดไว้ก่อน — ไปสมัคร ChatGPT แล้วรันสคริปต์ใหม่นะ"; exit 0 }

# --- 0) ตรวจว่ามี winget หรือไม่ ---
Write-Step "ตรวจสอบ winget (ตัวจัดการการติดตั้งของ Windows)"
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Warn "ไม่พบ winget — กรุณาอัปเดต 'App Installer' จาก Microsoft Store ก่อน แล้วรันสคริปต์ใหม่"
    exit 1
}
Write-Ok "พบ winget แล้ว"

# --- 0.5) ปลดล็อกการรันสคริปต์แบบถาวร (กัน error npm.ps1 cannot be loaded) ---
Write-Step "ตั้งค่าให้รันสคริปต์ได้ (ExecutionPolicy)"
try {
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
    Write-Ok "ตั้งค่า RemoteSigned (CurrentUser) เรียบร้อย — npm/codex จะรันได้ทั้งตอนนี้และครั้งต่อไป"
} catch {
    Write-Warn "ตั้งค่า ExecutionPolicy ไม่สำเร็จ ($($_.Exception.Message)) — ถ้าเจอ error เรื่องสคริปต์ ให้รันเองว่า: Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force"
}

# --- 1) ติดตั้ง Node.js LTS ---
Write-Step "ติดตั้ง Node.js (เวอร์ชัน LTS)"
if (Get-Command node -ErrorAction SilentlyContinue) {
    Write-Ok "มี Node.js อยู่แล้ว: $(node --version)"
} else {
    winget install -e --id OpenJS.NodeJS.LTS --accept-source-agreements --accept-package-agreements
    Write-Ok "ติดตั้ง Node.js เสร็จ"
}

# --- 2) ติดตั้ง Git ---
Write-Step "ติดตั้ง Git (ระบบเก็บเวอร์ชันไฟล์ - แนะนำให้มี)"
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Ok "มี Git อยู่แล้ว: $(git --version)"
} else {
    winget install -e --id Git.Git --accept-source-agreements --accept-package-agreements
    Write-Ok "ติดตั้ง Git เสร็จ"
}

# --- รีเฟรช PATH ให้ session ปัจจุบันมองเห็นคำสั่งใหม่ ---
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + `
            [System.Environment]::GetEnvironmentVariable("Path","User")

# --- 3) ติดตั้ง Codex CLI ผ่าน npm ---
Write-Step "ติดตั้ง OpenAI Codex CLI"
if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Warn "ยังมองไม่เห็นคำสั่ง npm — กรุณาปิดแล้วเปิด PowerShell ใหม่ แล้วรันสคริปต์อีกครั้ง"
    exit 1
}
# หมายเหตุ: ต้องเป็นแพ็กเกจ @openai/codex เท่านั้น (codex เปล่าๆ เป็นคนละตัว)
npm install -g @openai/codex
Write-Ok "ติดตั้ง Codex CLI เสร็จ"

# --- 4) ตรวจสอบผลการติดตั้ง ---
Write-Step "ตรวจสอบผลการติดตั้ง"
Write-Host "    Node.js : $(node --version)"
Write-Host "    npm     : $(npm --version)"
try   { Write-Host "    Codex   : $(codex --version)" }
catch { Write-Warn "ยังเรียก codex ไม่ได้ในหน้าต่างนี้ — ปิดแล้วเปิด PowerShell ใหม่" }

Write-Host "`n============================================" -ForegroundColor Green
Write-Host "  เสร็จเรียบร้อย!" -ForegroundColor Green
Write-Host "  ขั้นต่อไป:" -ForegroundColor Green
Write-Host "   1) ปิดแล้วเปิด PowerShell ใหม่ 1 ครั้ง"
Write-Host "   2) พิมพ์  codex  แล้วกด Enter"
Write-Host "   3) เลือก 'Sign in with ChatGPT' แล้ว login ด้วยบัญชี ChatGPT ของคุณ"
Write-Host "============================================" -ForegroundColor Green
