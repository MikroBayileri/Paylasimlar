--Hiç adres kaydı olmayan carileri listeyen sorgu.
SELECT * FROM CARI_HESAP_ADRESLERI WHERE adr_cari_kod not in (select cari_kod from CARI_HESAPLAR)
