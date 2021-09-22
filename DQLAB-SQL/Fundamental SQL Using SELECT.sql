/*
SQL 
bahasa komputer standar untuk berinteraksi dengan sistem database atau lebih tepatnya sistem manajemen database relasional
user dapat menambahkan, mengubah, mengupdate, mencari dan menghapus data 

kategori dari interaksi SQL
Data Definition Language (DDL)
memanipulasi struktur database, seperti Membuat (CREATE), meubah (ALTER), dan menghapus (DROP) struktur penyimpanan data, yaitu database, table, kolom dan tipe data

Data Manipulation Language (DML)
Menyisipkan data (INSERT), Mengambil data atau query (SELECT), Meubah data (UPDATE) dan Menghapus data (DELETE). 
*/

-- contoh perintah SELECT SQL
> SELECT <kolom> FROM <tabel>;

/*
Relational Database Management System yang biasa disingkat dengan RDMBS
- program yang memungkinkan untuk Membuat, Memperbarui, dan Mengelola suatu basis data relasional (Relational Database)
- umumnya data-data disimpan dalam bentuk yang terstruktur berupa tabel (baris dan kolom) dan setiap tabel/ data yang terdapat dalam database memiliki relasi (relational) satu sama lain

Struktur Penyimpanan 
- Database, berisi beberapa tabel
- Tabel (table), terdiri dari beberapa kolom
- Kolom (column) atau Field, diisi data yang kemudian membentuk row (baris data) */

-- mengambil semua kolom
> SELECT * FROM <tabel>;

-- mengambil satu kolom
> SELECT <kolom> FROM <tabel>;

-- mengambil lebih dari satu kolom
> SELECT <kolom1>, <kolom2> FROM <tabel>;

-- membatasi jumlah kolom dengan menggunakan LIMIT
> SELECT <kolom> FROM <tabel> LIMIT <jumlah_baris>;

-- menghilangkan data duplikasi
-- mengambil unique variabel dari data
> SELECT DISTINCT <kolom> FROM <tabel>;

-- Prefix
-- menambahkan nama tabel di depan nama kolom
> SELECT <tabel>.<kolom> FROM <tabel>;

-- Alias 
-- memberikan alias atau nama lain untuk tabel maupun kolom
> SELECT <kolom> AS <kolom_alias> FROM <tabel>;

-- Tanpa Alias
> SELECT <kolom> <kolom_alias> FROM <tabel>;

-- Menggabungkan Prefix dan Alias
> SELECT <tabel>.<kolom> AS <kolom_alias> FROM <tabel>;

-- Menggunakan Alias pada Tabel
> SELECT <kolom> FROM <tabel> AS <tabel_alias>;
-- tanpa AS
> SELECT <kolom> FROM <tabel> <tabel_alias>;

-- Prefik dengan Alias Tabel
> SELECT <tabel>.<kolom> FROM <tabel> AS <tabel_alias>;
-- tanpa AS
> SELECT <tabel>.<kolom> FROM <tabel> <tabel_alias>;

/* WHERE
- filter dengan teks tertentu
- filter dengan angka tertentu
- filter dengan kondisi AND dan OR */
> SELECT <kolom> FROM <tabel> WHERE <kondisi>;

-- OR 
-- kondisi salah satu terpenuhi
> SELECT <kolom> FROM <tabel> WHERE <kondisi> OR <kondis2>;

-- AND 
-- kondisi semua terpenuhi
> SELECT <kolom> FROM <tabel> WHERE <kondisi> AND <kondis2>;

-- ORDER BY
-- ascending 
> SELECT <kolom> FROM <tabel> ORDER BY <kolom>  ASC;
descending
> SELECT <kolom> FROM <tabel> ORDER BY <kolom>  DESC;

-- Nambahin Kolom pake Perkalian
> SELECT <kolom1>, <kolom2>, (<kolom1> * <kolom2>) AS <kolom3> FROM <tabel>;

-- Nambahin Kolom pake Penjumlahan
> SELECT <kolom1>, <kolom2>, (<kolom1> + <kolom2>) AS <kolom3> FROM <tabel>;

-- Nambahin Kolom pake Pengurangan
> SELECT <kolom1>, <kolom2>, (<kolom1> - <kolom2>) AS <kolom3> FROM <tabel>;

-- Nambah


 Kolom pake Pembagian
> SELECT <kolom1>, <kolom2>, (<kolom1> / <kolom2>) AS <kolom3> FROM <tabel>;

-- soal latihan 
> SELECT <kolom1>, <kolom2>, <kolom3>, <kolom4>, (<kolom3>*<kolom4>) AS <kolom5> FROM <tabel> WHERE <kolom3>*<kolom4> <= [jumlah angka] ORDER BY <kolom5> DESC;