# Codex CLI — ชุดติดตั้งสำหรับห้องเรียน

ชุดไฟล์นี้ช่วยให้นักเรียนติดตั้ง **OpenAI Codex CLI** ได้ด้วยตัวเอง รองรับทั้ง **Windows** และ **macOS**
มีทั้ง *สคริปต์ติดตั้งอัตโนมัติ* และ *คู่มือทำมือทีละขั้น*

> สร้างเพื่อใช้ประกอบการสอนเรื่องการเริ่มต้นใช้งาน AI ผ่าน Command Line

---

## ⚠️ ก่อนเริ่ม ต้องสมัครบัญชี OpenAI ChatGPT ก่อน (อย่างน้อยแบบฟรี)

**Codex CLI ใช้งานไม่ได้ถ้าไม่มีบัญชี ChatGPT** — ขั้นแรกสุดของทุกคนคือ:

1. ไปที่ **https://chatgpt.com** กด **Sign up** สมัครฟรี (ใช้อีเมลหรือ Google login ก็ได้ ไม่ต้องผูกบัตร)
2. จำอีเมล/รหัสไว้ เพราะตอนเปิด Codex ครั้งแรกจะให้ **"Sign in with ChatGPT"**

> แผนฟรีใช้ Codex ได้ (ช่วงนี้ OpenAI เปิดให้ชั่วคราว) แต่มีลิมิตการใช้เป็นรอบ
> ถ้าจะใช้หนักต่อเนื่อง ค่อยอัปเป็น ChatGPT Plus ($20/เดือน) ภายหลัง

---

## ในชุดนี้มีอะไรบ้าง

| ไฟล์ | ใช้ทำอะไร |
|------|-----------|
| `README.md` | ภาพรวม + ทางลัดเริ่มต้น (ไฟล์นี้) |
| `AI-PROMPT.md` | ⭐ ก๊อปทั้งไฟล์วางในแชท AI ตัวไหนก็ได้ ให้พาติดตั้งทีละขั้น (ใช้ได้แม้ AI เปิดเว็บไม่ได้) |
| `install-windows.ps1` | สคริปต์ติดตั้งอัตโนมัติบน Windows (PowerShell) |
| `install-mac.sh` | สคริปต์ติดตั้งอัตโนมัติบน macOS (Terminal) |
| `GUIDE-TH.md` | คู่มือทำมือทีละขั้น (อ่านเข้าใจง่าย เผื่อสคริปต์มีปัญหา) |
| `COWORK-START.md` | ไฟล์สำหรับ "ลากเข้า Cowork" ให้ AI พาทำทีละขั้นจนเสร็จ |
| `PUSH-TO-GITHUB.md` | คำสั่งสำหรับอาจารย์ push ชุดนี้ขึ้น GitHub |

---

## สิ่งที่ต้องมีก่อน (Requirements)

- **บัญชี OpenAI ChatGPT** (ฟรีก็ได้) — ดูหัวข้อ ⚠️ ด้านบน **สำคัญที่สุด**
- **ระบบปฏิบัติการ:** Windows 10 (1809+) หรือ macOS 13 (Ventura) ขึ้นไป
- **Node.js เวอร์ชัน 18 ขึ้นไป** (สคริปต์จะติดตั้งให้)
- **อินเทอร์เน็ต**

> **ไม่จำเป็นต้องมี VS Code** — Codex CLI ทำงานบน Terminal โดยตรง

---

## เริ่มต้นแบบเร็ว (Quick Start)

> ทำขั้นสมัคร ChatGPT (หัวข้อ ⚠️) ให้เรียบร้อยก่อน

### Windows

1. กดปุ่ม Start พิมพ์ `PowerShell` → คลิกขวา → **Run as Administrator**
2. ไปที่โฟลเดอร์ที่ดาวน์โหลดไฟล์นี้มา (เช่น `cd $HOME\Downloads\codex-cli-setup`)
3. รันคำสั่ง:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
.\install-windows.ps1
```

4. ทำตามที่จอแนะนำจนเสร็จ แล้วพิมพ์ `codex` → เลือก **Sign in with ChatGPT**

### macOS

1. เปิด **Terminal** (กด `Cmd + Space` พิมพ์ Terminal)
2. ไปที่โฟลเดอร์ที่ดาวน์โหลดไฟล์นี้มา (เช่น `cd ~/Downloads/codex-cli-setup`)
3. รันคำสั่ง:

```bash
chmod +x install-mac.sh
./install-mac.sh
```

4. ทำตามที่จอแนะนำจนเสร็จ แล้วพิมพ์ `codex` → เลือก **Sign in with ChatGPT**

---

## ⚠️ เจอ error ตอน `npm install` บน Windows? (พบบ่อยสุด)

ถ้าขึ้นว่า **`npm.ps1 cannot be loaded because running scripts is disabled`** (PSSecurityException)
แปลว่า Windows บล็อกการรันสคริปต์ ให้รันคำสั่งนี้ใน PowerShell **ครั้งเดียว** แล้วลองใหม่:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
```

(ปลดล็อกถาวร ปลอดภัย ไม่ต้องเป็น admin — ทำให้ทั้ง `npm` และ `codex` รันได้)
ถ้าถามให้ยืนยันให้พิมพ์ `Y` แล้ว Enter

## ถ้าสคริปต์มีปัญหา

เปิด **`GUIDE-TH.md`** แล้วทำมือทีละขั้นตาม — มีอธิบายทุกบรรทัดและวิธีแก้ปัญหาที่พบบ่อย

## ให้ AI พาทำทีละขั้น (ใช้กับ AI ตัวไหนก็ได้) ⭐

เปิดไฟล์ **`AI-PROMPT.md`** → กดปุ่ม **Raw** → **Copy ทั้งหมด** → **วางในแชท AI** ที่ใช้ (ChatGPT / Codex / Claude / Cowork / Gemini) แล้วส่ง

ไฟล์นี้มีขั้นตอนครบในตัว **AI ไม่ต้องเปิดลิงก์เว็บเลย** จึงใช้ได้แม้กับ AI ที่เปิดเว็บไม่ได้ — มันจะถาม-พาทำทีละขั้นจนเสร็จ

> ทางเลือก: ถ้าใช้ **Claude Cowork** จะลากไฟล์ `COWORK-START.md` เข้าไปก็ได้
