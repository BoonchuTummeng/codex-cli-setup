# คู่มือติดตั้ง OpenAI Codex CLI แบบทำมือ (ทีละขั้น)

ใช้คู่มือนี้ถ้าสคริปต์อัตโนมัติมีปัญหา หรืออยากเข้าใจทุกขั้นตอน

---

## ⚠️ ขั้นที่ 0 (ทุกคนต้องทำก่อน) — สมัครบัญชี OpenAI ChatGPT

**Codex ใช้ไม่ได้ถ้าไม่มีบัญชี ChatGPT**

1. เข้า **https://chatgpt.com** กด **Sign up**
2. สมัครฟรีด้วยอีเมลหรือ Google login (ไม่ต้องผูกบัตร)
3. เสร็จแล้วจำอีเมล/รหัสไว้ ใช้ตอน Codex ถาม "Sign in with ChatGPT"

> แผนฟรีใช้ Codex ได้ในช่วงนี้ (มีลิมิตเป็นรอบ) ใช้หนักค่อยอัปเป็น Plus $20/เดือน

จากนั้นเลือกทำตามระบบของตัวเอง: **[Windows](#windows)** หรือ **[macOS](#macos)**

---

## Windows

### ขั้นที่ 1 — เปิด PowerShell แบบผู้ดูแล
กดปุ่ม **Start** พิมพ์ `PowerShell` → คลิกขวา → **Run as administrator**

### ขั้นที่ 2 — ตรวจว่ามี winget ไหม
```powershell
winget --version
```
ถ้าไม่มี ให้เปิด Microsoft Store ค้นหา **App Installer** แล้วกดอัปเดต

### ขั้นที่ 3 — ติดตั้ง Node.js
```powershell
winget install -e --id OpenJS.NodeJS.LTS
```
> Node.js คือสภาพแวดล้อมที่ Codex ต้องใช้ (ต้องเวอร์ชัน 18 ขึ้นไป)

### ขั้นที่ 4 — ติดตั้ง Git (แนะนำ)
```powershell
winget install -e --id Git.Git
```

### ขั้นที่ 5 — ปิดแล้วเปิด PowerShell ใหม่
สำคัญ! เพื่อให้ Windows มองเห็นคำสั่งใหม่ที่เพิ่งติดตั้ง

### ขั้นที่ 6 — ตรวจว่าติดตั้งสำเร็จ
```powershell
node --version
npm --version
git --version
```

### ขั้นที่ 7 — ติดตั้ง Codex CLI
```powershell
npm install -g @openai/codex
```
> ⚠️ ต้องเป็น `@openai/codex` เท่านั้น — ถ้าพิมพ์ `codex` เปล่าๆ จะได้คนละโปรแกรม

### ขั้นที่ 8 — เริ่มใช้งาน + login
```powershell
codex
```
เลือก **Sign in with ChatGPT** → เบราว์เซอร์จะเด้งให้ login ด้วยบัญชี ChatGPT (จากขั้นที่ 0)

---

## macOS

### ขั้นที่ 1 — เปิด Terminal
กด `Cmd + Space` พิมพ์ **Terminal** กด Enter

### ขั้นที่ 2 — ติดตั้ง Homebrew (ถ้ายังไม่มี)
```bash
brew --version
```
ถ้าไม่มี ให้ติดตั้ง:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
> ตอนติดตั้งเสร็จ มันอาจบอกให้รัน 2-3 บรรทัดเพิ่มเพื่อเพิ่ม brew เข้า PATH — ก๊อปตามที่มันบอก

### ขั้นที่ 3 — ติดตั้ง Node.js
```bash
brew install node
```

### ขั้นที่ 4 — ติดตั้ง Git (แนะนำ)
```bash
brew install git
```

### ขั้นที่ 5 — ตรวจว่าติดตั้งสำเร็จ
```bash
node --version
npm --version
git --version
```

### ขั้นที่ 6 — ติดตั้ง Codex CLI
```bash
npm install -g @openai/codex
```
> ⚠️ ต้องเป็น `@openai/codex` เท่านั้น — `codex` เปล่าๆ เป็นคนละโปรแกรม

### ขั้นที่ 7 — เริ่มใช้งาน + login
```bash
codex
```
เลือก **Sign in with ChatGPT** → เบราว์เซอร์จะเด้งให้ login ด้วยบัญชี ChatGPT (จากขั้นที่ 0)

---

## แก้ปัญหาที่พบบ่อย (Troubleshooting)

| อาการ | สาเหตุ / วิธีแก้ |
|-------|------------------|
| พิมพ์ `codex` แล้วขึ้น "command not found" | ปิดแล้วเปิด Terminal/PowerShell ใหม่ ให้ระบบโหลด PATH ใหม่ |
| ติดตั้งแล้วได้โปรแกรมแปลกๆ ไม่ใช่ Codex | ติดตั้งผิดแพ็กเกจ ต้องเป็น `@openai/codex` ไม่ใช่ `codex` |
| `npm: command not found` | Node.js ยังติดตั้งไม่สมบูรณ์ หรือยังไม่เปิดหน้าต่างใหม่ |
| Windows รันสคริปต์ .ps1 ไม่ได้ | รัน `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force` ก่อน |
| login ไม่ได้ / ใช้ Codex ไม่ได้ | ตรวจว่าสมัคร ChatGPT แล้ว (ขั้นที่ 0) และลองใหม่ในเบราว์เซอร์ |
| ใช้ไปสักพักแล้วโดนจำกัด | แผนฟรีมีลิมิตเป็นรอบ (rolling 5 ชม.) รอรอบใหม่ หรืออัปเป็น Plus |

## ข้อควรระวังด้านความปลอดภัย
- Codex เข้าถึงไฟล์และรันคำสั่งบนเครื่องได้จริง — อ่านคำสั่งให้เข้าใจก่อนกดยืนยันเสมอ
- อย่าวางข้อมูลลับ/ข้อมูลส่วนตัวลงไปโดยไม่จำเป็น
- ใช้ Git เก็บเวอร์ชันไฟล์ไว้ เผื่อต้องย้อนกลับ
