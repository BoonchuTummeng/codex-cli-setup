# วิธี Push ชุดนี้ขึ้น GitHub (สำหรับอาจารย์)

ทำครั้งเดียว แล้วนักเรียนกดดาวน์โหลดจากลิงก์ GitHub ได้เลย

---

## ขั้นที่ 1 — สร้าง repo เปล่าบน GitHub
1. เข้า https://github.com → กดปุ่ม **+** มุมขวาบน → **New repository**
2. ตั้งชื่อ เช่น `codex-cli-setup`
3. เลือก **Public** (เพื่อให้นักเรียนเข้าถึงได้)
4. **อย่า** ติ๊ก "Add a README" (เพราะเรามีไฟล์อยู่แล้ว)
5. กด **Create repository** แล้วจดลิงก์ไว้ เช่น
   `https://github.com/<ชื่อคุณ>/codex-cli-setup.git`

## ขั้นที่ 2 — เปิด Terminal/PowerShell ที่โฟลเดอร์นี้
```bash
cd path/to/codex-cli-setup
```

## ขั้นที่ 3 — รันคำสั่ง git ทีละบรรทัด
แทนที่ `<URL>` ด้วยลิงก์ repo ของคุณจากขั้นที่ 1

```bash
git init
git add .
git commit -m "Add Codex CLI setup kit for students"
git branch -M main
git remote add origin <URL>
git push -u origin main
```

> ครั้งแรก GitHub อาจให้ login — ทำตามที่หน้าจอบอก
> (แนะนำใช้ GitHub CLI `gh auth login` หรือ Personal Access Token หากใช้ HTTPS)

## ขั้นที่ 4 — ตรวจผล
เปิดลิงก์ repo ในเบราว์เซอร์ ควรเห็นไฟล์ทั้งหมดและ README แสดงผลด้านล่าง

## ขั้นที่ 5 — แชร์ให้นักเรียน
ส่งลิงก์ repo ให้นักเรียน แล้วบอกให้:
- **สมัครบัญชี ChatGPT ฟรีก่อน** ที่ https://chatgpt.com
- กด **Code → Download ZIP** เพื่อโหลดทั้งชุด หรือเปิด `COWORK-START.md` แล้วลากเข้า Cowork

---

### อยากแก้ไฟล์แล้วอัปเดตซ้ำในอนาคต
```bash
git add .
git commit -m "อธิบายว่าแก้อะไร"
git push
```
