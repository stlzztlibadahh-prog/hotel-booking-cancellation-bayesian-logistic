# hotel-booking-cancellation-bayesian-logistic
Statistical analysis of factors influencing hotel booking cancellations using Bayesian Logistic Regression.
# Analisis Faktor yang Memengaruhi Pembatalan Pemesanan Hotel Periode Februari 2015 Menggunakan Metode Bayesian Logistic Regression

![Language](https://img.shields.io/badge/Language-R-276DC3?logo=r&logoColor=white)
![Method](https://img.shields.io/badge/Method-Bayesian%20Logistic%20Regression-success)
![Analysis](https://img.shields.io/badge/Analysis-Hotel%20Booking%20Cancellation-orange)
![Data](https://img.shields.io/badge/Data-Hotel%20Booking%20Demand-blueviolet)

---

## 📖 Deskripsi Proyek

Repository ini memuat analisis faktor-faktor yang memengaruhi pembatalan pemesanan hotel periode Februari 2015 menggunakan metode **Bayesian Logistic Regression**.

Penelitian menggunakan data sekunder dari dataset **Hotel Booking Demand** yang diperoleh melalui platform Kaggle. Data yang dianalisis terdiri dari 842 pemesanan hotel dengan variabel respon berupa status pembatalan pemesanan (`is_canceled`) serta beberapa variabel prediktor, yaitu `lead_time`, `market_segment`, `customer_type`, `adr`, dan `total_of_special_requests`.

Analisis dilakukan untuk mengetahui karakteristik data pembatalan, mengidentifikasi faktor-faktor yang memengaruhi pembatalan pemesanan hotel, serta membentuk model Bayesian Logistic Regression.

---

## 📂 Struktur Repository

```text
hotel-booking-cancellation-bayesian-logistic/
├── README.md
├── hotel-cancellation-presentation.pptx
├── hotel-booking-data.xlsx
├── hotel-cancellation-report.pdf
└── hotel-cancellation-analysis.R
```
---
## 🔍 Tahapan Analisis

1. Pengumpulan data dari dataset Hotel Booking Demand
2. Pemilihan variabel penelitian
3. Preprocessing dan pemeriksaan data
4. Analisis statistika deskriptif
5. Visualisasi data
6. Pembentukan model Bayesian Logistic Regression
7. Estimasi parameter model
8. Perhitungan interval kredibel 95%
9. Evaluasi model menggunakan ROC dan AUC
10. Interpretasi hasil model

---
## 📌 Variabel Penelitian

### Variabel Respon

- `is_canceled` — Status pembatalan pemesanan hotel
  - `0` = Tidak dibatalkan
  - `1` = Dibatalkan

### Variabel Prediktor

- `lead_time` — Jarak waktu antara pemesanan dan tanggal kedatangan
- `market_segment` — Segmen pasar pelanggan
- `customer_type` — Jenis pelanggan
- `adr` — Average Daily Rate
- `total_of_special_requests` — Jumlah permintaan khusus pelanggan

---
## 📊 Hasil Utama

Dari 842 data pemesanan hotel, sebanyak **599 pemesanan (71,14%) tidak dibatalkan**, sedangkan **243 pemesanan (28,86%) dibatalkan**.

Hasil Bayesian Logistic Regression menunjukkan bahwa **lead time** dan **ADR** memiliki arah pengaruh positif terhadap peluang pembatalan, sedangkan **total of special requests** memiliki arah pengaruh negatif.

Pada variabel kategorik, beberapa kategori `market_segment` dan `customer_type` juga menunjukkan arah pengaruh yang berbeda terhadap peluang pembatalan.

---
## 📈 Interval Kredibel 95%

Berdasarkan interval kredibel 95%, beberapa variabel menunjukkan pengaruh terhadap pembatalan pemesanan hotel, yaitu:

- **Lead Time**
- **ADR**
- **Total of Special Requests**
- **Customer Type: Transient**
- **Customer Type: Transient-Party**

Variabel tersebut memiliki interval kredibel 95% yang tidak memuat nilai nol.

---

## 🎯 Evaluasi Model

Model Bayesian Logistic Regression dievaluasi menggunakan **Receiver Operating Characteristic (ROC)** dan nilai **Area Under the Curve (AUC)**.

**AUC = 0,7116**
Nilai AUC tersebut menunjukkan bahwa model memiliki kemampuan klasifikasi yang cukup baik dalam membedakan pemesanan hotel yang dibatalkan dan tidak dibatalkan.

---

## 🛠️ Tools

- R
- RStudio
- Microsoft Excel
- Kaggle

---

## 👩‍💻 Author

**Siti Lizatul Ibadah**

Program Studi Statistika  
Fakultas Matematika dan Ilmu Pengetahuan Alam  
Universitas Mataram
