package main

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello Cloud Architecture from Go API!")
}

// เตรียม Endpoint สำหรับให้ Kubernetes/Prometheus เข้ามาเช็กสถานะในอนาคต
func healthzHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("OK"))
}

func main() {
	http.HandleFunc("/", helloHandler)
	http.HandleFunc("/healthz", healthzHandler) 
	
	fmt.Println("Server is running on port 8080...")
	http.ListenAndServe(":8080", nil)
}