BEGIN
  DECLARE @json_construct VARCHAR(MAX) = '{"type": ''TabularTranslator'', ''mappings'': {X}}';
  DECLARE @json VARCHAR(MAX);
  Select DISTINCT
  		REPLACE(@json_construct, '{X}',
	(
		Select * from 
			(
			Select 'id' AS 'source.name','id' AS 'sink.name'  union all 
			Select 'ename' AS 'source.name','ename' AS 'sink.name' union all 
			Select 'sal' AS 'source.name','sal' AS 'sink.name' 
			) src 
		
		
        FOR JSON PATH
	) ) as func_mapping


FROM [metadata].[entity] where entityId = 1

END