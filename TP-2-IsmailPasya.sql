Jawaban TP2-Ismail Pasya-2502098462 :

1. CREATE DATABASE AplikasiKaryawanTerbaik;

2. Berikut command untuk membuat Tabel Kriteria, Tabel Level, Tabel Karyawan,  Tabel Penilaian (Secara berurutan) :
CREATE TABLE kriteria(
    id_kriteria INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    nama_kriteria varchar(50) NOT NULL, 
    bobot FLOAT, 
    keterangan varchar(100), 
    jenis varchar(50)
); 

CREATE TABLE level(
    id_level INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    nama_level varchar(50) NOT NULL, 
    keterangan varchar(100)
);

CREATE TABLE karyawan(
    id_karyawan INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    nama_karyawan varchar(100) NOT NULL, 
    nik varchar(100), 
    alamat varchar(100), 
    no_hp varchar(100), 
    pendidikan varchar(50), 
    status varchar(25), 
    username varchar(100), 
    password varchar(100), 
    id_level INT NOT NULL, 
    proses  INT,
    FOREIGN KEY (id_level) REFERENCES level(id_level)
); 

CREATE TABLE penilaian(
    id_penilaian INT NOT NULL AUTO_INCREMENT, 
    id_kriteria INT, 
    id_karyawan INT, 
    nilai  INT, 
    penilai varchar(100),
    FOREIGN KEY (id_kriteria) REFERENCES kriteria(id_kriteria),
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan),
    PRIMARY KEY (id_penilaian)
); 
ALTER TABLE penilaian AUTO_INCREMENT = 13;

3. Berikut command untuk insert setiap data sesuai soal,
    a. Tabel kriteria
        INSERT INTO kriteria (nama_kriteria,  bobot, keterangan, jenis)
        VALUES 
        ("karakter", "0.2", "karakter yang dimiliki oleh pramuniaga","benefit"), 
        ("kedisiplinan", "0.25", "kedisiplinan  pramuniaga dalam bekerja","benefit"), 
        ("tanggung jawab", "0.25", "tanggung jawab pramuniaga dengan pekerjaannya","benefit"), 
        ("etika", "0.3", "etika dan perilaku pramuniaga","benefit");
    b. Tabel level
        INSERT INTO level (nama_level,  keterangan)
        VALUES 
        ("admin", "pengelola sistem"), 
        ("store manager", "melihat hasil penilaian"), 
        ("supervisor", "kepala pramuniaga dan pemberi nilai pramuniaga"), 
        ("pramuniaga", "pelayan toko buku gramedia");
        INSERT INTO level
        VALUES 
        (8, "testing", "testing data"), 
    c. Tabel karyawan
        INSERT INTO karyawan (nama_karyawan,  nik, alamat, no_hp, pendidikan, status, username, password, id_level, proses)
        VALUES 
        ("Is Suryani", "1-01-2017", "semarang","081326632236", "Strata 1", "Tetap", "admin", "admin", "1", "1"),
        ("Elizabeth Drimierda Primasari", "08-08-1998", "semarang","0812345678", "Strata 2", "Tetap", "manager", "manager", "2", "0"),
        ("Sigit Yulianto", "09-09-1998", "semarang","0812345679", "Strata 1", "Tetap", "supervisor", "supervisor", "3", "0"),
        ("Bernadus Adi Dewanto", "09-09-1998", "semarang","08123456710", "Strata 1", "Tetap", "supervisor2", "supervisor2", "3", "0"),
        ("Bambang Broto", "09-09-1998", "semarang","08123456711", "Strata 1", "Tetap", "supervisor3", "supervisor3", "3", "0"),
        ("Ismedi Yuliarso", "09-09-1998", "semarang","08123456712", "Strata 1", "Tetap", "supervisor4", "supervisor4", "3", "0"),
        ("Henox Claudian", "10-10-1995", "semarang","082345678911", "SMA", "Kontrak", NULL, NULL, "4", "1"),
        ("Sumanto", "10-10-1995", "semarang","082345678912", "SMK", "Kontrak", NULL, NULL, "4", "1"),
        ("Triyanti", "10-10-1995", "semarang","082345678913", "SMA", "Outsource", NULL, NULL, "4", "1"),
        ("Pasiran", "10-10-1995", "semarang","082345678914", "SMK", "Kontrak", NULL, NULL, "4", "1"),
        ("Elda Yunita Sari", "10-10-1995", "semarang","082345678915", "SMK", "Kontrak", NULL, NULL, "4", "1");
        INSERT INTO karyawan
        VALUES 
        (14, "test", "10-10-1995", "palembang","081326632236", "SMA", "Outsource", NULL, NULL, "4", "0"),
        (15, "rian", "08-08-1998", "semarang","086554688", "SMA", "Outsource", NULL, NULL, "4", "0");
    d. Tabel penilaian
        INSERT INTO penilaian (id_kriteria, id_karyawan, nilai, penilai)
        VALUES 
        ("1", "10", "50", "Bernadus Adi Dewanto"),
        ("2", "10", "60", "Bernadus Adi Dewanto"),
        ("3", "10", "70", "Bernadus Adi Dewanto"),
        ("4", "10", "80", "Bernadus Adi Dewanto"),
        ("1", "11", "80", "Bambang Broto"),
        ("2", "11", "80", "Bambang Broto"),
        ("3", "11", "85", "Bambang Broto"),
        ("4", "11", "85", "Bambang Broto");
        
4. SELECT nama_karyawan FROM karyawan WHERE id_level IN (SELECT  id_level FROM  level  WHERE nama_level='supervisor');

5. UPDATE karyawan SET status='kontrak' WHERE nama_karyawan='Triyanti';

6. UPDATE karyawan SET status='Tetap' WHERE nama_karyawan LIKE '%Henox%'OR nama_karyawan LIKE  '%Elda%';

7. UPDATE karyawan SET id_level='2',username='manager2', password='manager2'WHERE nama_karyawan='Sigit Yulianto';
