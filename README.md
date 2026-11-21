
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

## Docker ile Çalıştırma

PostgreSQL veritabanı ve gerekli tablolar önceden oluşturulmuş, `student-postgres` konteyneri `student-network` ağına bağlanmış olmalıdır.

Docker imajını oluşturun:

```powershell
docker build -t student-ai .
```

Veritabanı parolasını ortam değişkeni olarak tanımlayın:

```powershell
$env:DB_PASSWORD = "VERITABANI_SIFRENIZ"
```

Uygulamayı çalıştırın:

```powershell
docker run --rm --network student-network -e DB_PASSWORD student-ai
```

İşlem tamamlandıktan sonra ortam değişkenini temizleyin:

```powershell
Remove-Item Env:DB_PASSWORD
```

## Proje Dosyaları

- main.py: Makine öğrenmesi uygulaması ve veritabanı işlemleri.
- Dockerfile: Docker imajının oluşturulması.
- .dockerignore: Docker imajına dahil edilmeyecek dosyalar.
- .gitignore: Git tarafından takip edilmeyecek dosyalar.
- mimari_diyagram.md: Proje mimarisinin Mermaid gösterimi.
- mimari_diyagram.png: Proje mimarisi görseli.

## Geliştirme Notu

Bu proje eğitim amacıyla geliştirilmiştir. Kullanılan veri kümesinin büyük bölümü sentetik olarak üretilmiştir.

## Geliştirici

Ali Alkhaled
