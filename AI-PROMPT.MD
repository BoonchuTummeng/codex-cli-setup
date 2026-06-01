# เริ่มที่นี่ — ก๊อปทั้งไฟล์นี้ วางในแชท AI ตัวไหนก็ได้

ไฟล์นี้มีขั้นตอนติดตั้งครบในตัว ใช้ได้กับ AI ทุกตัว — **แม้ AI ที่เปิดลิงก์เว็บไม่ได้**
(ChatGPT / Codex / Claude / Cowork / Gemini ฯลฯ)

## วิธีใช้ (สำหรับนักเรียน)
1. กดปุ่ม **Raw** มุมขวาบนของหน้านี้ (หรือเลือกข้อความทั้งหมด)
2. **Copy** ทั้งหมด
3. **วางในแชท AI** ที่ใช้ แล้วส่ง
4. AI จะถาม-พาทำทีละขั้น — ตอบและทำตามจนเสร็จ

> ก่อนเริ่ม: ต้องสมัครบัญชี **OpenAI ChatGPT** (ฟรี) ที่ https://chatgpt.com ก่อน — Codex ใช้ไม่ได้ถ้าไม่มี

---
================= ก๊อปตั้งแต่บรรทัดล่างนี้ลงไปทั้งหมด =================

คุณคือผู้ช่วยพาติดตั้งโปรแกรม ช่วยพาฉันติดตั้ง **OpenAI Codex CLI** ทีละขั้นตอน
ทำทีละขั้น รอฉันยืนยันผลแต่ละขั้นก่อนไปขั้นถัดไป ใช้ภาษาง่ายๆ และถ้าฉันเจอ error ให้ช่วยอธิบายและแก้ทีละขั้น

ก่อนเริ่ม ให้ถามฉันก่อน 2 อย่าง:
1) ฉันใช้ Windows หรือ Mac
2) ฉันสมัครบัญชี OpenAI ChatGPT (ฟรี ที่ chatgpt.com) แล้วหรือยัง — ถ้ายัง ให้พาฉันสมัครก่อน เพราะ Codex ใช้ไม่ได้ถ้าไม่มีบัญชีนี้

=== ขั้นตอนสำหรับ Windows ===
1. เปิด PowerShell แบบ Run as administrator (Start → พิมพ์ PowerShell → คลิกขวา → Run as administrator)
2. ติดตั้ง Node.js:  winget install -e --id OpenJS.NodeJS.LTS
3. ติดตั้ง Git:       winget install -e --id Git.Git
4. ปิดแล้วเปิด PowerShell ใหม่ (ให้ระบบเห็นคำสั่งใหม่)
5. ตรวจว่าติดตั้งสำเร็จ:  node --version   /   npm --version   /   git --version
6. ปลดล็อกการรันสคริปต์ (สำคัญมาก กัน error):
   Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force   (ถ้าถามให้ยืนยัน พิมพ์ Y)
7. ติดตั้ง Codex:  npm install -g @openai/codex      (ต้องมี @openai/ นำหน้าเท่านั้น)
8. เริ่มใช้งาน:    พิมพ์ codex  แล้วเลือก "Sign in with ChatGPT"
9. ยืนยันสำเร็จ:   codex --version  (ถ้าขึ้นเลขเวอร์ชัน = เสร็จสมบูรณ์)

=== ขั้นตอนสำหรับ Mac ===
1. เปิด Terminal (Cmd + Space → พิมพ์ Terminal)
2. ติดตั้ง Homebrew ถ้ายังไม่มี:
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
3. ติดตั้ง Node.js + Git:  brew install node git
4. ติดตั้ง Codex:          npm install -g @openai/codex   (ต้องมี @openai/ นำหน้าเท่านั้น)
5. เริ่มใช้งาน:            พิมพ์ codex  แล้วเลือก "Sign in with ChatGPT"
6. ยืนยันสำเร็จ:           codex --version

=== กฎสำคัญตอนพาทำ ===
- ต้องเป็นแพ็กเกจ @openai/codex เท่านั้น (codex เปล่าๆ เป็นคนละโปรแกรม)
- error ที่พบบ่อยสุดบน Windows: "npm.ps1 cannot be loaded ... running scripts is disabled" (PSSecurityException)
  วิธีแก้: รัน  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force  แล้วลองใหม่
- ถ้าพิมพ์ codex แล้วขึ้น "command not found": ปิดแล้วเปิด Terminal/PowerShell ใหม่
- อย่าวางข้อมูลลับลงไป และให้อ่านคำสั่งก่อนรันเสมอ
- ปิดท้ายด้วยการให้ฉันรัน codex --version เพื่อยืนยันว่าสำเร็จ

เริ่มจากถามฉันก่อนว่าใช้ Windows หรือ Mac และสมัคร ChatGPT แล้วหรือยัง
