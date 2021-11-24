-- Fungsi Scalar
-- mengembalikan nilai tunggal (single value) dari nilai input yang dimasukin

-- Fungsi Skalar Matematika
-- abs() 
-- mengembalikan nilai absolut
> SELECT ABS(<kolom>) FROM <tabel>;

-- ceiling()
-- mengembalikan nilai integer yang dibulatkan ke atas
> SELECT CEILING(<kolom>) FROM <tabel>; 

-- floor() 
-- mengembalikan nilai integer yang dibulatkan ke bawah
> SELECT FLOOR(<kolom>) FROM <tabel>; 

-- round()
-- mengembalikan nilai pembulatan nilai  pada desimal
> SELECT ROUND(<kolom nomor>, <kolom desimal>) FROM <tabel>; 

-- sqrt()
-- mengembalikan nilai akar kuadrat
> SELECT SQRT(<kolom>) FROM <tabel>; 

-- mod()
-- mengembalikan nilai sisa hasil pembagian
> SELECT MOD(<kolom1>, <kolom2>) FROM <tabel>; 
  kolom1 MOD kolom2 atau kolom1 % kolom2

-- exp()
-- mengembalikan nilai exponesial
> SELECT EXP(<kolom>) FROM <tabel>; 

-- Tugas Praktek
SELECT StudentID, FirstName, LastName,MOD(Semester1, 2) as Semester1, Semester2, EXP(MarkGrowth) FROM students;

-- Fungsi Text
-- CONCAT() 
-- menggabungkan semua argument/ nilai input, NULL diabaikan
> SELECT CONCAT(ColumnName1, ColumnName2, ColumnNameN) FROM <tabel>; 

-- SPLIT_PART()
-- membagi text string berdasarkan pemisah/ delimiter
-- kemudian mengembalikan value berdasarkan posisi string yang ditentukan
> SELECT CONCAT(ColumnName1, ColumnName2, ColumnNameN) FROM <tabel>; 

-- SUBSTRING_INDEX()
> SELECT SUBSTRING_INDEX(<kolom>, <delimiter>, <index to return>) FROM <tabel>; 
<kolom>, nama kolom yang akan dipecah text
<delimiter>, karakter atau gabungan beberapa karakter untuk pemecah text
<index to return>,  indeks dari pecahan text yang akan diambil

-- SUBSTR()
-- ekstract text string 
> SELECT SUBSTR(<kolom>, <index awal>, <string yang diextract>) FROM <tabel>; 
<kolom>, nama kolom yang akan dicari
<index awal>,  indeks dari text yang dimiliki (dimulai dari 1)
<string yang diextract>, jumlah karakter atau beberapa karakter yang akan diambil

-- LENGTH()
-- menghitung jumlah karakter dalam string
> SELECT LENGTH(<kolom>) FROM <tabel>; 

-- REPLACE()
-- mengganti karakter dalam string
> SELECT REPLACE(<kolom>, <string lama>, <string baru>) FROM <tabel>; 
<kolom>, nama kolom yang akan diganti
<string lama>, string/karakter untuk diganti
<string baru>, string/karakter baru

-- TRIM()
-- menghapus karakter dalam string
> SELECT CONCAT(ColumnName1, ColumnName2, ColumnNameN) FROM <tabel>; 

-- UPPER()
-- mengubah huruf kecil jadi huruf besar
> SELECT UPPER(<kolom>) FROM <tabel>; 

-- LOWER()
-- mengubah huruf besar jadi huruf kecil
> SELECT LOWER(<kolom>) FROM <tabel>; 

-- Fungsi Aggregation
-- melakukan perhitungan pada sekelompok nilai dan kemudian mengembalikan nilai tunggal

-- SUM()
-- menjumlahan sekelompok nilai baris dalam satu kolom
> SELECT SUM(<kolom>) FROM <tabel>; 
 
-- COUNT()
-- menghitung jumlah baris
> SELECT COUNT(<kolom>) FROM <tabel>; 

-- AVG()
-- menghitung nilai rata-rata
> SELECT AVG(<kolom>) FROM <tabel>; 

-- MIN()
-- menghitung nilai minimum
> SELECT MIN(<kolom>) FROM <tabel>; 

-- MAX()
-- menghitung nilai maximum
> SELECT MAX(<kolom>) FROM <tabel>; 

-- FIRST()
-- mengembalikan nilai pada baris pertama
> SELECT FIRST(<kolom>) FROM <tabel>; 

-- LAST()
-- mengembalikan nilai pada baris terakhir
> SELECT LAST(<kolom>) FROM <tabel>; 

-- Aggregate dengan DISTINCT
-- COUNT(DISTINCT <kolom>)
> SELECT COUNT(DISTINCT <kolom>) FROM <tabel>; 


-- GROUP BY
-- mengelompokkan data yang bernilai sama ke dalam satu group
-- dengan menggunakan fungsi aggregate seperti (COUNT, MAX, MIN, SUM, AVG) kita bisa melakukan agregasi untuk untuk setiap group atau kelompok

SELECT <kolom_digroup> 
FROM <tabel> 
WHERE <kondisi> 
GROUP BY <kolom_digroup> 
ORDER BY <kolom_diurutkan>; 

-- GROUP BY digunakan dengan SELECT
-- kolom yang digunakan di GROUP BY statement, juga perlu ditempatkan di SELECT

-- GROUP BY ditempatkan setelah WHERE
-- jika tidak menggunakan WHERE maka langsung ditempatkan setelah FROM

-- Jika menggunakan ORDER BY, GROUP BY ditempatkan sebelum ORDER BY

-- Group by Single Column
-- data dikelompokkan menggunakan kriteria dari satu kolom
> SELECT province, COUNT(DISTINCT order_id) as total_order, SUM(item_price) as total_price 
> FROM sales_retail_2019 
> GROUP BY province;

-- Group by Multiple Column
-- data dikelompokkan menggunakan kriteria dari dua kolom
-- contoh:
> SELECT province, brand, COUNT(DISTINCT order_id) as total_order, SUM(item_price) as total_price  
> FROM sales_retail_2019 
> GROUP BY province, brand;

-- GROUP BY dengan AGGREGATE
-- menghitung total penjualan dari setiap provinsi di tahun 2019
> SELECT province, COUNT(DISTINCT order_id) AS total_unique_order, SUM(item_price) AS revenue 
> FROM sales_retail_2019 
> GROUP BY province;	

-- Penggunaan CASE … WHEN….
SELECT <kolom1>, <kolom2>,  
CASE  
    WHEN <kondisi_1> THEN <hasil_1> 
    WHEN <kondisi_2> THEN <hasil_2>    
    WHEN <kondisi_n> THEN <hasil_n>  
    ELSE <hasil>  
END as <kolom_hasil_kondisi>  
FROM <tabel>; 

-- CASE-statement 
-- mengevaluasi kondisi yang sudah ditentukan, dimulai dari condition1, dan akan mengembalikan hasil (result1)
-- contoh :
SELECT MONTH(order_date) AS order_month, SUM(item_price) AS total_price, 
CASE  
    WHEN SUM(item_price) >= 30000000000 THEN "Target Achieved"
    WHEN SUM(item_price) <= 25000000000 THEN "Less performed"
    ELSE "Follow Up"
END as remark
FROM sales_retail_2019
GROUP BY MONTH(order_date);

-- Mini Projek 1
-- 1. Total jumlah seluruh penjualan (total/revenue).
SELECT SUM(total) as total 
FROM tr_penjualan;

-- 2. Total quantity seluruh produk yang terjual.
SELECT SUM(qty) as qty 
FROM tr_penjualan;

-- 3. Total quantity dan total revenue untuk setiap kode produk.
SELECT kode_produk, SUM(qty) as qty, SUM(total) as total 
FROM tr_penjualan
GROUP BY kode_produk;

-- Mini Projek 2
-- 4. Rata - Rata total belanja per kode pelanggan.
SELECT kode_pelanggan, AVG(total) as avg_total 
FROM tr_penjualan
GROUP BY kode_pelanggan;

--  5. Selain itu,  jangan lupa untuk menambahkan kolom baru 
-- dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 
-- 3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K. */
SELECT kode_transaksi,kode_pelanggan,no_urut,kode_produk, nama_produk, qty, total,
CASE  
    WHEN total > 300000 THEN 'High'
    WHEN total < 100000 THEN 'Low'   
    ELSE 'Medium'  
END as kategori 
FROM tr_penjualan;