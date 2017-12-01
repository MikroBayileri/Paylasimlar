--Harici sorgularda iki tarih Arasını sormasını sağlar

SELECT     SIPARISLER.sip_tarih, SIPARISLER.sip_teslim_tarih, SIPARISLER.sip_evrakno_seri, SIPARISLER.sip_evrakno_sira, SIPARISLER.sip_satici_kod, 
                      SIPARISLER.sip_musteri_kod, CARI_HESAPLAR.cari_unvan1, SIPARISLER.sip_stok_kod, STOKLAR.sto_isim, SIPARISLER.sip_b_fiyat, SIPARISLER.sip_miktar, 
                      SIPARISLER.sip_teslim_miktar, SIPARISLER.sip_tutar
FROM         SIPARISLER INNER JOIN
                      CARI_HESAPLAR ON SIPARISLER.sip_musteri_kod = CARI_HESAPLAR.cari_kod INNER JOIN
                      STOKLAR ON SIPARISLER.sip_stok_kod = STOKLAR.sto_kod
WHERE     (SIPARISLER.sip_teslim_miktar <> SIPARISLER.sip_miktar) AND (sip_tarih  >= ?T1) AND (sip_tarih  <= ?T2)
