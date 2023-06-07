create table bst(
n int,
p int);

insert into bst values(1,2);
insert into bst values(3,2);
insert into bst values(6,8);
insert into bst values(9,8);
insert into bst values(2,5);
insert into bst values(8,5);
insert into bst values(5,null);

select n,
	case when p is null then 'root'
		when n not in(select distinct p from bst where p is not null) then 'leaf'
        else 'inner' end as type
        from bst
        order by n;