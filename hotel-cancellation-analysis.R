#========================================
# 1. PACKAGE
#========================================
library(readxl)
library(arm)
library(rstanarm)
library(pROC)

#========================================
# 2. IMPORT DATA
#========================================
data <- read_excel("D:/SEMESTER 4/ANKEP/DATA DEEMAND HOTEL VARIABEL TERPILIH.xlsx")
View(data)


#========================================
# 3. CEK DATA
#========================================
str(data)
summary(data)

#========================================
# 4. PREPROCESSING
#========================================
data$is_canceled <- as.factor(data$is_canceled)
data$market_segment <- as.factor(data$market_segment)
data$customer_type <- as.factor(data$customer_type)

#========================================
# 5. DESKRIPTIF
#========================================
table(data$is_canceled)
prop.table(table(data$is_canceled))

summary(data$lead_time)
summary(data$adr)

#========================================
# 6. VISUALISASI
#========================================

# Barplot cancel
barplot(table(data$is_canceled),
        main = "Distribusi Pembatalan Hotel",
        col = "lightblue",
        ylab = "Frekuensi")

# Histogram lead_time
hist(data$lead_time,
     main = "Distribusi Lead Time",
     xlab = "Lead Time",
     col = "gray")

par(mfrow = c(1,3))

# Lead Time
boxplot(lead_time ~ is_canceled,
        data = data,
        main = "Lead Time vs Cancel",
        xlab = "Cancel",
        ylab = "Lead Time",
        col = "lightgreen")

# ADR
boxplot(adr ~ is_canceled,
        data = data,
        main = "ADR vs Cancel",
        xlab = "Cancel",
        ylab = "ADR",
        col = "orange")

# Special Requests
boxplot(total_of_special_requests ~ is_canceled,
        data = data,
        main = "Special Requests vs Cancel",
        xlab = "Cancel",
        ylab = "Requests",
        col = "pink")

par(mfrow = c(1,2))

# Market Segment
barplot(table(data$market_segment, data$is_canceled),
        beside = TRUE,
        legend = TRUE,
        main = "Market Segment vs Cancel",
        col = c("skyblue","lightgreen"))

# Customer Type
barplot(table(data$customer_type, data$is_canceled),
        beside = TRUE,
        legend = TRUE,
        main = "Customer Type vs Cancel",
        col = c("skyblue","tomato"))

#========================================
# 7. MODEL BAYESIAN LOGISTIC
#========================================
model_bayes <- stan_glm(
  is_canceled ~ lead_time +
    market_segment +
    customer_type +
    adr +
    total_of_special_requests,
  
  data = data,
  family = binomial(),
  
  prior = normal(0, 2.5),
  prior_intercept = normal(0, 5),
  
  chains = 4,
  iter = 2000,
  seed = 123
)

#========================================
# 8. HASIL MODEL
#========================================
summary(model_bayes)

#========================================
# 9. KOEFISIEN
#========================================
coef(model_bayes)

#========================================
# 10. INTERVAL KREDIBEL (BAYESIAN)
#========================================
posterior_interval(model_bayes, prob = 0.95)

#========================================
# 11. VISUALISASI POSTERIOR
#========================================
plot(model_bayes)

#========================================
# 12. PREDIKSI
#========================================
prediksi <- predict(model_bayes, type = "response")
head(prediksi)

#========================================
# 13. EVALUASI MODEL (ROC)
#========================================
roc_curve <- roc(data$is_canceled, prediksi)
plot(roc_curve, main = "ROC Curve Model Bayesian")
auc(roc_curve)

