# My Cloud API (SUT Cloud Architectures Project)

This is a simple Go API project demonstrating a full CI/CD pipeline using Jenkins, Docker, Terraform, Ansible, Kubernetes, and Prometheus/Grafana.

## Setup Instructions (Local Development)

1. **Clone the repository:**
   ```bash
   git clone <ใส่ลิงก์_GitHub_ของคุณที่นี่>
   cd my-cloud-api
Build the Docker Image:

Bash
docker build -t my-cloud-api .
Run the Application:

Bash
docker run -d -p 8080:8080 my-cloud-api

Test the API:
Open a browser or use curl to access http://localhost:8080


*(อย่าลืมแก้ `<ใส่ลิงก์_GitHub_ของคุณที่นี่>` เป็นลิงก์โปรเจกต์คุณจริงๆ นะครับ)*

**2. อัปเดตไฟล์ขึ้น GitHub และสร้าง Branch `dev`**
หลังจากเซฟไฟล์ `README.md` แล้ว ให้รันคำสั่งเหล่านี้ทีละบรรทัดเพื่อดันไฟล์ขึ้นไป และจำลองการใช้ Branching Strategy ครับ:

```bash
# อัปเดตไฟล์ README.md เข้าไปใน Branch main
git add README.md
git commit -m "docs: Add README.md with setup instructions"
git push origin main

# สร้างและสลับไปที่ Branch ใหม่ชื่อ 'dev'
git checkout -b dev

# ดัน Branch 'dev' ขึ้นไปเก็บบน GitHub
git push -u origin dev