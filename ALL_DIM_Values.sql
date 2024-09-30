/* Display all the DIM values eith exists or not*/
with myevents as (
Select '202401' mnth,'GRP1' grp, 1 flag union all
Select '202401' mnth,'GRP1' grp,1 as flg union all
Select '202401' mnth,'GRP2' grp,1 as flg union all
Select '202401' mnth,'GRP3' grp,1 as flg union all
Select '202401' mnth,'GRP4' grp,1 as flg union all
Select '202401' mnth,'GRP5' grp,1 as flg union all
Select '202402' mnth,'GRP1' grp,1 as flg union all
Select '202402' mnth,'GRP1' grp,1 as flg union all
Select '202402' mnth,'GRP1' grp,1 as flg union all
Select '202402' mnth,'GRP1' grp,1 as flg union all
Select '202402' mnth,'GRP2' grp,1 as flg union all
Select '202402' mnth,'GRP3' grp,1 as flg union all
Select '202402' mnth,'GRP3' grp,1 as flg union all
Select '202402' mnth,'GRP4' grp,1 as flg union all
Select '202402' mnth,'GRP5' grp,1 as flg union all
Select '202403' mnth,'GRP1' grp,1 as flg union all
Select '202403' mnth,'GRP2' grp,1 as flg union all
Select '202403' mnth,'GRP3' grp,1 as flg union all
Select '202403' mnth,'GRP3' grp,1 as flg union all
Select '202403' mnth,'GRP4' grp,1 as flg union all
Select '202403' mnth,'GRP4' grp,1 as flg union all
Select '202403' mnth,'GRP4' grp,1 as flg union all
Select '202403' mnth,'GRP5' grp,1 as flg union all
Select '202410' mnth,'GRP1' grp,1 as flg 
), 
mnth as (
--Select '202401' mnth union all
--Select '202402' mnth union all
Select '202403' mnth union all
Select '202410'
),
groupings as (
Select 'GRP1' grp union all
Select 'GRP2' grp union all
Select 'GRP3' grp union all
Select 'GRP4' grp union all
Select 'GRP5' grp 
)
Select
	evt.mnth
	,dup.grp	
	,sum(CASE WHEN dup.grp = gp.grp THEN 1 ELSE 0 END) as newcnt
	,count(1) as cnt
	--,evt.grp , gp.grp 
from myevents evt 
inner join groupings gp on evt.grp = gp.grp
inner join mnth mn on evt.mnth = mn.mnth
right join groupings dup on 1=1 
GROUP BY evt.mnth,dup.grp 
order BY evt.mnth,dup.grp
