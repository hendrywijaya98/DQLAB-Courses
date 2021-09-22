-- Table Customer
SELECT * FROM customer;

-- Table Product
SELECT * FROM product;

-- Table Subscription
SELECT * FROM subscription;

-- Table Invoice
SELECT * FROM Invoice;

-- Table Payment
SELECT * FROM payment;

-- HAVING digunakan untuk menggantikan WHERE ketika menggunakan Group BY yang datanya di aggregasi.
-- digunakan setelah melakukan GROUP BY
> SELECT nama_kolom
> FROM nama_table
> GROUP BY nama_kolom
> HAVING kondisi

-- Contoh penggunaan HAVING
-- mencari customer_id yang melakukan perpindahan subscription pada table subscription
> SELECT customer_id FROM Subscription GROUP BY customer_id HAVING COUNT(customer_id) > 1;

-- melengkapi query yang ada di code editor dengan menampilkan:
-- customer_id, product_id, subscription_date
SELECT 
	customer_id,
    product_id,
    subscription_date
FROM Subscription 
WHERE customer_id IN 
	(SELECT 
    	customer_id 
     FROM Subscription 
     GROUP BY customer_id 
     HAVING COUNT(customer_id) > 1
  	) 
ORDER BY customer_id ASC;

-- Menampilkan detail konsumen
-- menggunakan JOIN untuk mendapatkan data dari table customer
SELECT b.name,
	   b.address,
       b.phone, 
       a.product_id, 
       a.subscription_date 
FROM Subscription a 
JOIN customer b 
ON a.customer_id=b.id
WHERE b.id IN 
(
	SELECT 
    	customer_id 
        FROM Subscription 
    GROUP BY customer_id 
    HAVING COUNT(customer_id) > 1
) 
ORDER BY b.id ASC;

-- penggunaan fungsi seperti MAX, MIN dan AVG dalam penggunaan kondisi filter

-- Penggunaan Fungsi MAX pada Having
-- menggunakan MAX sebagai filter hasil dari aggregasi dari GROUP BY
SELECT product_id, MAX(total_price) AS total FROM invoice GROUP BY product_id;
SELECT product_id, MAX(total_price) AS total FROM invoice GROUP BY product_id HAVING MAX(total_price) > 100000;
SELECT product_id, MAX(pinalty) AS total FROM invoice GROUP BY product_id HAVING MAX(pinalty) > 30000;

-- Penggunaan Fungsi MIN pada Having
-- memfilter nilai minimum yang ada pada kolom yang ditentukan
SELECT product_id, MIN(total_price) AS total FROM invoice GROUP BY product_id;
SELECT product_id, MIN(total_price) AS total FROM invoice GROUP BY product_id HAVING MIN(total_price) < 500000;
SELECT product_id, MIN(pinalty) AS total FROM invoice GROUP BY product_id HAVING MIN(pinalty) < 50000;

-- Penggunaan Fungsi AVG di Having
-- memfilter nilai rata-rata dari kolom yang dicari
SELECT product_id, AVG(total_price) AS total FROM invoice GROUP BY product_id;
SELECT product_id, AVG(total_price) AS total FROM invoice GROUP BY product_id HAVING AVG(total_price) > 100000; 
SELECT product_id, AVG(pinalty) AS total FROM invoice GROUP BY product_id HAVING AVG(pinalty) > 30000; 

-- query untuk dapat mengeluarkan product_id, rata-rata nilai pinalty dan jumlah customer_id yang di group by berdasarkan product_id yang memiliki jumlah customer_id diatas nilai 20
SELECT product_id, AVG(pinalty), COUNT(customer_id) as total FROM Invoice GROUP BY product_id HAVING COUNT(customer_id) > 20;