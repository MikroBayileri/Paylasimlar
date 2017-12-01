--Geçmiş stok hareketlerini cari kartta tanımlı plasiyer kodları ile günceller.

UPDATE STOK_HAREKETLERI
SET sth_plasiyer_kodu = (SELECT TOP 1 cari_temsilci_kodu FROM CARI_HESAPLAR 
WHERE dbo.CARI_HESAPLAR.cari_kod = sth_cari_kodu)
SELECT 'STH HAREKETLERI PLASIYER KODLARI,CARI KODLARINDAKI TEMSILCI KODLARINA GORE GUNCELLENDI'
