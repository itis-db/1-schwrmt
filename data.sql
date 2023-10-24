    insert into activitytype(
            activitytypeid
            ,name
            ,sysname
    )
    select d.*
    from (
    	values(1,'Программа','Program')
        ,(2,'Подпрограмма','SubProgram')
        ,(3,'Проект','Project')
        ,(4,'Контракт','Contract')
        ,(5,'КТ','Point')
    ) d(activitytypeid, name, sysname)
    where not exists(
    	select 1 from activitytype t
        where t.activitytypeid = d.activitytypeid
    );

    insert into area(
            areaid,
            name
    )
    select d.*
    from (
        values(1,'Russia')
        ,(2, 'USA')
        ,(3, 'China')
        ,(4, 'UK')
    )   d(areaid, name)
    where not exists(
        select 1 from area t
        where t.areaid = d.areaid
    );

    insert into activity(
        activityid
        ,activitytypeid
        ,code
        ,name
        ,parentid
    )
    select d.*
    from (
        values (1, 1, 'Prog1', 'Program One', null)
        ,(2, 1, 'Prog2', 'Program Two', null)
        ,(3, 1, 'Prog3', 'Program Three', null)
        ,(4, 2, 'SubProg1.1', 'SubProgram One-One', 1)
        ,(5, 2, 'SubProg1.2', 'SubProgram One-Two', 1)
        ,(6, 2, 'SubProg2.1', 'SubProgram Two-One', 2)
        ,(7, 3, 'Proj1.1.1', 'Project One-One-One', 4)
        ,(8, 3, 'Proj1.1.2', 'Project One-One-Two', 4)
        ,(9, 4, 'Cont1.1.1.1', 'Contract One-One-One-One', 7)
        ,(10, 5, 'Point1.1.1.1', 'Point for Contract One-One-One-One', 9)
        ,(11, 5, 'Pont1.1.2', 'Point for Project One-One-Two', 8)
    )   d(activityid, activitytypeid, code, name, parentid)
    where not exists(
        select 1 from activity t
        where t.activityid = d.activityid
    );

    insert into program(
            programid,
            indexnum,
            yearstart,
            yearfinish
    )
    select d.*
    from (
        values(1, 1, 2020, 2023)
        ,(2, 2, 2015, 2016)
        ,(3, null, null, null)
    )   d(programid, indexnum, yearstart, yearfinish)
    where not exists(
        select 1 from program t
        where t.programid = d.programid
    );

    insert into subprogram(
            subprogramid,
            indexnum
    )
    select d.*
    from (
        values(4, 10)
            ,(5, 1337)
            ,(6, null)
    )   d(subprogramid, indexnum)
    where not exists(
        select 1 from subprogram t
        where t.subprogramid = d.subprogramid
    );

    insert into project(
            projectid,
            targetdescr
    )
    select d.*
    from (
        values(7, 'fckmdd')
            ,(8, null)
    )   d(projectid, targetdescr)
    where not exists(
        select 1 from project t
        where t.projectid = d.projectid
    );

    insert into contract(
            contractid,
            areaid
    )
    select d.*
    from (
        values(9, 1)
    )   d(contractid, areaid)
    where not exists(
        select 1 from contract t
        where t.contractid = d.contractid
    );

    insert into point(
            pointid,
            plandate,
            factdate
    )
    select *
    from (
        values(10, date '2003-12-07', date '2007-11-06')
            ,(11, date '2023-10-24', null)
    )   d(pointid, plandate, factdate)
    where not exists(
        select 1 from point as t
        where t.pointid = d.pointid
    );