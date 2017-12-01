--Cari kartlardaki vergi no alanının boşluklarını kaldırır.
UPDATE CARI_HESAPLAR SET cari_vdaire_no=replace(cari_vdaire_no,' ','')
