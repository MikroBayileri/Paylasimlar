SELECT  top 100 percent CARI_HESAPLAR.cari_kod AS CARİ_KOD, CARI_HESAPLAR.cari_unvan1 AS CARİ_ÜNVAN, dbo.fn_CariHesapAnaDovizBakiye('', 0, CARI_HESAPLAR.cari_kod, '', '', 
0, NULL, NULL, 0) AS CARİ_BAKİYE1, 
dbo.fn_CariHesapAnaDovizBakiye('', 1, CARI_HESAPLAR.cari_kod, '', '', 
0, NULL, NULL, 0) AS [CARİ_BAKİYE2], 
MUHASEBE_HESAP_PLANI.muh_hesap_kod AS MUHASEBE_KOD, 
MUHASEBE_HESAP_PLANI.muh_hesap_isim1 AS HESAP_İSMİ, 
dbo.fn_muhbakiye(MUHASEBE_HESAP_PLANI.muh_hesap_kod, dbo.fn_GetAktifFirma(), dbo.fn_GetAktifMaliYil(), 0) AS MUHASEBE_BAKİYESİ,
dbo.fn_muhbakiye(MUHASEBE_HESAP_PLANI.muh_hesap_kod, dbo.fn_GetAktifFirma(), dbo.fn_GetAktifMaliYil(), 
0) - dbo.fn_CariHesapAnaDovizBakiye('', 0, CARI_HESAPLAR.cari_kod, '', '', 0, NULL, NULL, 0)+dbo.fn_CariHesapAnaDovizBakiye('', 1, CARI_HESAPLAR.cari_kod, '', '', 
0, NULL, NULL, 0)+
dbo.fn_CariHesapAnaDovizBakiye('', 2, CARI_HESAPLAR.cari_kod, '', '', 
0, NULL, NULL, 0) AS FARK, CASE WHEN UPPER(LEFT(cari_unvan1, 40)) 
<> UPPER(muh_hesap_isim1) OR
muh_hesap_isim1 IS NULL THEN 'İSİMLER UYUŞMUYOR' ELSE 'İSİMLER UYUMLU' END AS 'İSİM UYUMLU MU?'
FROM CARI_HESAPLAR LEFT OUTER JOIN
MUHASEBE_HESAP_PLANI ON CARI_HESAPLAR.cari_muh_kod = MUHASEBE_HESAP_PLANI.muh_hesap_kod
 
order by cari_kod
