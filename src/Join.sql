
join : �ϳ��� ��ɹ��� ���� ���� ���̺� ����� �����͸� �ѹ��� ��ȸ�� �� �ִ� ���.

create table tb1 (name varchar2(10char), age number(3));
insert into tb1 values ('����',30);
insert into tb1 values ('�ں��',35);
insert into tb1 values ('�ֺ��',40);
insert into tb1 values ('�����',40);

create table tb2 (name varchar2(10char), age number(3));
insert into tb2 values ('����',30);
insert into tb2 values ('�����',50);
insert into tb2 values ('�̺��',55);

--cross join : ������ ���� ���� �� ���̺� ���� ������ ��� ����� ��ȸ (��� ����� ��) ��ǻ� �Ⱦ�;
select * from tb1, tb2;
select * from tb1 cross join tb2;

--inner join : ���ǿ� �ش��ϴ� ���� ����.
--select * from tb1 inner join tb2 on tb1.name = tb2.name;
select * from tb1 , tb2  where tb1.name = tb2.name;   --equi ����	: ���� ũ�ν� ���ο� ������ ���� ���ǿ��´°�ã�°� ** �̰ŷοܿ���;;
--select * from tb1 join tb2 using (name);			--equi ����2	: 
--select * from tb1 natural join tb2;					--�ڿ����� 	: ������ ���� ���ʿ� ���� �̸��� ���� ������ �÷����� ��ȸ

--outer join : ������ �� ���̺��� �����Ͱ� ��� ��ȸ���ǰ� ��� ���̺��� �����Ͱ� �ִ°�� �ش� �÷��� ���� �������� ���ؼ����
--			1. left outer join : ���� ���̺� ���� ���� �� ������ ���̺��� ���ǿ� ���� �ʾƵ�(null)���� ����.
select * from tb1 left outer join tb2 on tb1.name = tb2.name;
--select * from tb1 , tb2 where tb1.name = tb2.name(+);
--select * from tb1 a, tb2 b where a.name = b. name(+);  --����� ������� �ؼ� �԰���.
--			2. right outer join : ������ ���̺� ���� ���� �� ���� ���̺��� ���ǿ� ���� �ʾƵ�(null)���� ����. ����Ʈ�� �ַ� ����� �̰� �߾Ⱦ�.
--select * from tb1 right outer join tb2 on tb1.name = tb2.name;
--select * from tb1,tb2 where tb1.name(+) = tb2.name;

--			3. full outer join : ���� ���̺� ���� ���� �� , �ٸ��� ���̺��� ������ ���� �ʾƵ� ������ ����
select * from tb1 full outer join tb2 on tb1.name = tb2.name;

--self join ** �򰥸� : �ϳ��� ���̺� ���� �ִ� �÷����� �����ϴ� ������ �ʿ��� ���. 
-- ���� ���� .
-- �� ������Ʈ�� ȸ���� 5���� �ְ�, �����ڰ� 2���� �ִ�. 
-- ȸ���� �̸��� ���� ȸ�� 1~ 5, �������� �̸��� ������1,2 �̴�.
-- ȸ���� ���̵�� ���� member 1~5 , �������� ���̵�� manager1,2 �̴�.
-- ȸ�� 1~3�������� ������ 1�� �����ϰ� / �������� ������ 2�� �����Ѵ�.
create table member(
m_id varchar2(10 char) primary key,
m_name varchar2(10 char) not null,
m_manager varchar2(10char)
);

insert into member values('member1', 'ȸ��1','manager1');
insert into member values('member2', 'ȸ��2','manager1');
insert into member values('member3', 'ȸ��3','manager1');
insert into member values('member4', 'ȸ��4','manager2');
insert into member values('member5', 'ȸ��5','manager2');
insert into member values('manager1', '�ٴ�',null);
insert into member values('manager2', '����',null);

--�� �����ڰ� � ȸ���� �����ϰ� �ִ��� ������ �ۼ��ض�..�������� �ΰ����ñ䰡��; ;
select a.m_name, b.m_name as manager from member a left outer join member b on b.m_id = a.m_manager order by a.m_name asc;
