with recursive _hierarchy as (
    select
        a.activityid,
        a.parentid,
        a.activitytypeid,
        at.name as activityname,
        cast(at.name as varchar) as	path
    from activitytype as at, activity as a
    where a.parentid is null 
    	and at.activitytypeid = a.activitytypeid

    union

    select
        a.activityid,
        a.parentid,
        a.activitytypeid,
        at.name as activityname,
        concat(h.path, ' -> ', a.name) as path
    from activity as a
		join activitytype as at on at.activitytypeid = a.activitytypeid
		join _hierarchy as h on a.parentid = h.activityid
)
select * from _hierarchy order by (activityid);