-- JOIN
-- beberapa tabel bisa digabungkan satu sama lain

-- Hal pertama sebelum menggabungkan kedua tabel
-- mengidentifikasi kolom mana dari kedua tabel yang memiliki kecocokan atau memiliki informasi yang sama 

-- Key Columns
-- Kedua kolom ini untuk selanjutnya disebut sebagai kolom kunci atau key columns

-- menggabungkan
SELECT * FROM <tabel1>, <tabel2> WHERE <kolom_key1> = <kolom_key2>;

-- hasil penggabungan cuma namplin baris data yang isi datanya ada di kedua key columns
-- yang ga ada bakal di exclude

-- INNER JOIN
-- isi dari key column kedua tabel harus cocok

-- Menggunakan Prefix Nama Tabel
-- menambahkan alamat tabel dibelakang kolom dengan titik, bisa nentuin urutan kolom yang muncul dluan
> SELECT <tabel1>.<kolom1>, <tabel2>.<kolom2> FROM <tabel2>, <tabel1> 
> WHERE <kolom_key1> = <kolom_key2>;

-- urutan tabel1 yang diprefik dluan bakal muncul sebelum yang kanan

-- Memilih Satu Kolom Untuk Ditampilkan
SELECT <kolom> 
FROM <tabel1> INNER JOIN <tabel2>
ON <tabel1>.<kolom_key> = <tabel2>.<kolom_key>;

/*
- penggunaan prefik pada pada <tabel1>.<kolom_key> dan <tabel2>.<kolom_key> untuk memperjelas pada acuan INNER JOIN
- proses INNER JOIN ekivalen dengan INTERSECTION (IRISAN) antara dua himpunan
- memiliki konsep penggabungan untuk records pada kedua tabel yang bernilai sama
- maka kedua kolom dari tabel berbeda, nilainya harus ada 
- kolom yang nilainya tidak ada di salah satu, maka tidak ditampilkan
*/

Memilih Beberapa Kolom Untuk Ditampilkan
SELECT <tabel1>.<kolom1>, <tabel1>.<kolom2>, <tabel2>.<kolom1>, <tabel2>.<kolom2>
FROM <tabel1> INNER JOIN <tabel2>
ON <tabel1>.<kolom_key> = <tabel2>.<kolom_key>;

--- pada SELECT menggunakan prefik sesuai alamat tabelnya
--- pada ON, key kolom harus sama 

-- Tugas Praktek
SELECT tr_penjualan.kode_transaksi, tr_penjualan.kode_pelanggan, tr_penjualan.kode_produk, ms_produk.nama_produk, ms_produk.harga, tr_penjualan.qty, tr_penjualan.qty*ms_produk.harga AS total	
FROM tr_penjualan INNER JOIN ms_produk			
ON tr_penjualan.kode_produk = ms_produk.kode_produk;	

/*
CROSS JOIN
Penggabungan Tanpa Kondisi 
dapat dilakukan dengan metode koma dan tanpa menggunakan kondisi relasi antar kolom
namun tiap baris data pada kedua tabel akan tetap dihubungkan walaupun tanpa key
*/

/*
UNION 
untuk menggabungkan hasil dari 2 atau lebih SELECT - statement secara “Vertikal”
jumlah kolom, tipe data sama sama, urutan posisi sama semua
*/

SELECT <kolom1>, <kolom2> FROM <tabel1>
UNION
SELECT <kolom1>, <kolom2> FROM <tabel2>;

-- UNION pake WHERE

SELECT <kolom1>, <kolom2> FROM <tabel1>
WHERE <kolom_target> = 'value_target'
UNION
SELECT <kolom1>, <kolom2> FROM <tabel2>;
WHERE <kolom_target> = 'value_target';

-- Menyelaraskan (Conforming) Kolom
-- kalau posisi kolom dari kedua tabelnya beda, maka disamain pake SELECT
SELECT kolom1, kolom2, kolom3, kolom4
FROM tabel1
UNION 
SELECT kolom1, kolom2, kolom3, kolom4
FROM tabel1;

-- kalau misalnya kolom yang di SELECT pertama ama kedua beda, yang dipake nama kolom dari SELECT pertama secara defaultnya

/*
Perbedaan antara UNION dan JOIN
- JOIN 
  menggabungkan tabel antar kolom (secara horizontal)
  hasil join akan menampilkan kolom dari kedua atau lebih yang digabungkan
  penggabungan berdasarkan kolom key dengan ON */
  SELECT * FROM <tabel1>
  JOIN
  SELECT * FROM <tabel2>
  ON <tabel1>.<kolom1> = <tabel2>.<kolom1>;
/*
- UNION
  menggabungkan tabel baris/row dari dua tabel atau lebih (secara vertikal)
  ga perlu pake kolom key
  jumlah kolom, urutan posisi kolom dan tipe data harus sama */
  SELECT * FROM <tabel1>
  UNION
  SELECT * FROM <tabel2>;

SELECT DISTINCT ms_pelanggan.kode_pelanggan, ms_pelanggan.nama_customer, ms_pelanggan.alamat, tr_penjualan.nama_produk, tr_penjualan.qty
FROM ms_pelanggan 
INNER JOIN tr_penjualan
ON ms_pelanggan.kode_pelanggan = tr_penjualan.kode_pelanggan
WHERE tr_penjualan.nama_produk = 'Kotak Pensil DQLab' OR tr_penjualan.nama_produk = 'Flashdisk DQLab 32 GB' OR tr_penjualan.nama_produk = 'Sticky Notes DQLab 500 sheets' ;

SELECT DISTINCT ms_pelanggan.kode_pelanggan, ms_pelanggan.nama_customer, ms_pelanggan.alamat
FROM ms_pelanggan
INNER JOIN tr_penjualan
ON ms_pelanggan.kode_pelanggan = tr_penjualan.kode_pelanggan
WHERE tr_penjualan.nama_produk = 'Kotak Pensil DQLab' OR tr_penjualan.nama_produk = 'Flashdisk DQLab 32 GB' OR tr_penjualan.nama_produk = 'Sticky Notes DQLab 500 sheets'

tabel ms_pelanggan yang berisi data - data pelanggan 
tr_penjualan yang berisi data transaksi pembelian
