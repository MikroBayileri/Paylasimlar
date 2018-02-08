--------------------------------------------------------------
create Procedure RRDepo
as 
BEGIN
	DECLARE @cols AS NVARCHAR(MAX)
	DECLARE @query AS NVARCHAR(MAX)
	DECLARE @colNames as NVARCHAR(MAX)

	SET @cols = STUFF((SELECT ',' + QUOTENAME(dep_adi) 
				FROM dbo.DEPOLAR
				order by dep_adi
				FOR XML PATH(''), TYPE
				).value('.', 'NVARCHAR(MAX)') 
			,1,1,'')
	        
	SET @colNames = STUFF((SELECT ',isnull(' + QUOTENAME(dep_adi) +',0) as ' + QUOTENAME(dep_adi) 
				FROM dbo.DEPOLAR
				order by dep_adi
				FOR XML PATH(''), TYPE
				).value('.', 'NVARCHAR(MAX)') 
			,1,1,'')     
	        
	set @query = 'SELECT KOD, ISIM , PARTI ,LOT , ' + @colNames + ' from 
				(
					SELECT msg_S_0001 AS KOD,msg_S_0002 AS ISIM ,msg_S_0342 AS PARTI,msg_S_0222 AS LOT 
					,[msg_S_0159] AS merkez ,[msg_S_2020\T] AS MIKTAR
					FROM dbo.fn_DepolardakiPartiLotStokDurumu('''',0,NULL,'''',0)
			   ) x
				pivot 
				(
					 max(MIKTAR)
					for merkez in (' + @cols + ')
				) p '
	execute(@query)
END
---------------------------------------------------------------------
--ha bunuda sorguya at 
---------------------------------------------------------------------
exec RRDepo
