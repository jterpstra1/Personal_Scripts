#JT
DECLARE @sPrimary varchar(30) 
SELECT @sPrimary = primary_replica from sys.dm_hadr_availability_group_states
IF upper(@sPrimary) <> upper(@@servername)
BEGIN
       DECLARE @errormsg varchar(100) = "This is the secundary node: "+ upper(@@servername) +", "+ @sPrimary +" is primary, don't execute code."
    RAISERROR(@errormsg,16, -1, @@servername )
END