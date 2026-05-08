# เลือก Base Image เป็น Go สำหรับคอมไพล์โค้ด
FROM golang:1.25-alpine

# กำหนดโฟลเดอร์ทำงานภายใน Container
WORKDIR /app

# คัดลอกไฟล์ go.mod และโค้ด main.go เข้าไปใน Container
COPY main.go ./
COPY go.mod ./
# สั่ง Build โค้ด Go ให้เป็นไฟล์ที่รันได้ (Executable) ชื่อ main
RUN go build -o main .

# ระบุว่า Container นี้จะเปิดพอร์ต 8080
EXPOSE 8080

# คำสั่งสำหรับรันเซิร์ฟเวอร์เมื่อ Container เริ่มทำงาน
CMD ["/app/main"]