
# Öğrenci Başarı Tahmin Sistemi

## Proje Hakkında

Bu proje, öğrencilerin akademik başarı durumlarını makine öğrenmesi kullanarak tahmin etmek amacıyla geliştirilmiştir.

Sistem, öğrencilere ait çalışma süresi, devam oranı ve önceki not bilgilerini PostgreSQL veritabanından okuyarak başarı tahmini gerçekleştirir.

## Kullanılan Teknolojiler

- Python 3.13
- PostgreSQL 17
- Docker
- Pandas
- Scikit-learn
- pg8000
- Git ve GitHub

## Proje Mimarisi

1. Öğrenci verileri PostgreSQL veritabanında saklanır.
2. Python, verileri doğrudan PostgreSQL üzerinden okur.
3. Pandas ile veriler işlenir.
4. Veriler eğitim ve test kümelerine ayrılır.
5. Decision Tree algoritması kullanılarak model eğitilir.
6. Accuracy, Precision, Recall ve F1-score metrikleri hesaplanır.
7. Yeni bir öğrenci için başarı tahmini yapılır.
8. Tahmin sonucu PostgreSQL veritabanındaki predictions tablosuna kaydedilir.

## Veritabanı

Projede iki temel tablo kullanılmaktadır:

- students: Öğrencilerin çalışma süresi, devam oranı, önceki notu ve başarı durumunu saklar.
- predictions: Model tarafından üretilen tahmin sonuçlarını saklar.

## Makine Öğrenmesi Modeli

Model: DecisionTreeClassifier

Veri bölme oranları:
- Eğitim: %80
- Test: %20

Örnek bir çalıştırmada elde edilen sonuçlar:

| Performans Metriği | Değer |
|---|---|
| Accuracy | 0.8333 |
| Precision | 0.8261 |
| Recall | 0.8636 |
| F1-score | 0.8444 |

Bu sonuçlar, ağırlıklı olarak sentetik veriler kullanılarak elde edilmiştir. Gerçek öğrenci verileri üzerinde aynı performans garanti edilmez.

## Docker ile Kurulum ve Çalıştırma

İlk kurulum için Docker Desktop çalışıyor olmalıdır.

### 1. Projeyi indirin

```powershell
git clone https://github.com/alialkhaled11/StudentSuccessPrediction.git
cd StudentSuccessPrediction
```

### 2. Veritabanı parolasını belirleyin

```powershell
$env:DB_PASSWORD = Read-Host "PostgreSQL password"
```

### 3. Docker ağını oluşturun

```powershell
docker network create student-network
```

### 4. PostgreSQL konteynerini oluşturun

```powershell
docker run -d --name student-postgres --network student-network -e POSTGRES_USER=student -e POSTGRES_PASSWORD="$env:DB_PASSWORD" -e POSTGRES_DB=student_db -v student-data:/var/lib/postgresql/data postgres:17
```

### 5. Veritabanının hazır olduğunu kontrol edin

```powershell
docker exec student-postgres pg_isready -U student -d student_db
```

Accepting connections mesajı görünene kadar bekleyin.

### 6. Veritabanını içe aktarın

```powershell
docker cp database.sql student-postgres:/tmp/database.sql
docker exec student-postgres psql -U student -d student_db -v ON_ERROR_STOP=1 -f /tmp/database.sql
```

Bu işlem yalnızca boş bir veritabanında yapılmalıdır.

### 7. Docker imajını oluşturun

```powershell
docker build -t student-ai .
```

### 8. Uygulamayı çalıştırın

```powershell
docker run --rm --network student-network -e DB_PASSWORD student-ai
```

### 9. Tahmin sonuçlarını kontrol edin

```powershell
docker exec student-postgres psql -U student -d student_db -c "SELECT * FROM predictions;"
```

### 10. Parola ortam değişkenini temizleyin

```powershell
Remove-Item Env:DB_PASSWORD
```

Sonraki çalıştırmalarda mevcut konteyneri başlatmak için `docker start student-postgres` komutunu kullanın. DB_PASSWORD ortam değişkenini yeniden tanımlayın ve uygulamayı çalıştırın.

## Proje Dosyaları

- main.py: Makine öğrenmesi uygulaması ve veritabanı işlemleri.
- Dockerfile: Docker imajının oluşturulması.
- .dockerignore: Docker imajına dahil edilmeyecek dosyalar.
- .gitignore: Git tarafından takip edilmeyecek dosyalar.
- mimari_diyagram.md: Proje mimarisinin Mermaid gösterimi.
- mimari_diyagram.png: Proje mimarisi görseli.
- database.sql: PostgreSQL tablo yapilari ve 210 ogrenciye ait ornek veri seti.

