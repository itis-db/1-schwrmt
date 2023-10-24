create table if not exists activitytype (
	activitytypeid  integer primary key,
	name            text    not null,
	sysname         text    not null
);

create table if not exists area (
	areaid          integer primary key,
	name            text    not null
);

create table if not exists activity (
	activityid      integer primary key,
	activitytypeid  integer not null    references activitytype(activitytypeid),
	code            text    not null,
	name            text    not null,
	parentid        integer             references activity(activityid)
);

create table if not exists subprogram (
	subprogramid    integer primary key references activity(activityid),
	indexnum        integer
);

create table if not exists project (
	projectid       integer primary key references activity(activityid),
	targetdescr     text
);

create table if not exists program (
	programid       integer primary key references activity(activityid),
	indexnum        integer,
	yearstart       integer,
	yearfinish      integer
);

create table if not exists contract (
	contractid      integer primary key references activity(activityid),
	areaid          integer             references area(areaid)
);

create table if not exists point (
	pointid         integer primary key references activity(activityid),
	plandate        date    not null,
	factdate        date
)