--Sorumluluk merkezinin boş kaydetmesini engelleyen trigger.

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


CREATE TRIGGER [dbo].[sormerkez_kontrol_char] ON [dbo].[CARI_HESAP_HAREKETLERI]
FOR INSERT, UPDATE
AS
 DECLARE @csor NVARCHAR(25)
 declare @ksor NVARCHAR(25)
set @csor =''
SET @ksor = ''


 SELECT @csor = cha_srmrkkodu,
 @ksor = cha_karsisrmrkkodu
 FROM inserted 
 IF @csor='' AND @ksor=''
 BEGIN
 RAISERROR('sorumluluk merkezi secmelisiniz', 16, 1)
 ROLLBACK
 RETURN
 END


----------------------------------

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


create TRIGGER [dbo].[sormerkez_kontrol] ON [dbo].[STOK_HAREKETLERI]
FOR INSERT, UPDATE
AS
 DECLARE @csor NVARCHAR(25)
declare @ssor NVARCHAR(25)
set @csor =''
set @ssor =''

 SELECT @csor = sth_cari_srm_merkezi,
@ssor =sth_stok_srm_merkezi
 FROM inserted
 IF @csor='' and @ssor=''
 BEGIN
 RAISERROR('sorumluluk merkezi secmelisiniz', 16, 1)
 ROLLBACK
 RETURN
 END

-------------------------------------

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


CREATE TRIGGER [dbo].[sormerkez_kontrol_sip] ON [dbo].[SIPARISLER]
FOR INSERT, UPDATE
AS
 DECLARE @csor NVARCHAR(25)
 declare @ssor NVARCHAR(25)
set @csor =''
SET @ssor = ''


 SELECT @csor = sip_cari_sormerk,
 @ssor = sip_stok_sormerk
 FROM inserted 
 IF @csor='' AND @ssor=''
 BEGIN
 RAISERROR('sorumluluk merkezi secmelisiniz', 16, 1)
 ROLLBACK
 RETURN
 END
