select * from user_sequences;
drop sequence aug30_snack_seq;
drop sequence ceo_seq;
drop sequence menu_seq;
drop sequence snack_seq;
drop sequence store_seq;

select * from store; 
drop table aug30_snack cascade constraint purge;
drop table cafe cascade constraint purge;
drop table ceo cascade constraint purge;
drop table maker cascade constraint purge;
drop table drink cascade constraint purge;
drop table member cascade constraint purge;
drop table menu cascade constraint purge;
drop table snack cascade constraint purge;
drop table store cascade constraint purge;

--2000 �� ������ ������ �ּҰ����� ������
select min(s_price) from snack1 where s_price <= 2000;
--��� ������ ��հ���
select avg(s_price) from snack1;
--������ �̸��� ������ 30% ���ε� �ݾ�
select s_name , s_price*0.7 from snack1;
--3500���� ������ ������ �?
select count(s_name) from snack1 where s_price = 3500;
--3000�� ������ ������ �̸�,ȸ���̸�
select s_name, s_maker from snack1 where s_price <=3000;
--��� ���� �̸�, ����, ������� ��ȸ
select s_name,s_price,s_date from snack1;
--��� ���� �̸�, ����, �ΰ��� ��ȸ 10%
select s_name , s_price, s_price*0.1 from snack1;
--��� ���� �̸�, ����, �ǸŰ� ��ȸ 20%����
select s_name, s_price, s_price*0.8 from snack1;
--3000�� ���� ū �ݾ��� ���ڵ��� ��հ� ��ȸ
select avg(s_price) from snack1 where s_price >3000;
--�ְ�,������,�� ���� ���� ������� ��ȸ
select max(s_price), min(s_price),count(s_name) from snack1 
--3000�� �̻��� ������ ��ü ���� ��ȸ
select * from snack1 where s_price >=3000;
--3000�� �̸��� ������ �̸�, ����, �ǸŰ� ��ȸ 20% ����
select s_name , s_price , s_price*0.8 from snack1 where s_price < 3000;
--��Ϲ���Ĩ�� ���� ��ȸ
select s_price from snack1 where s_name like'%����%';
--ũ��� ȸ���� ���� ���� ���� ��ȸ
select sum(s_price) from snack1 where s_maker = 'ũ���';
--9�� ������ �Ծ�� �ϴ� ���� �̸�, ����, ������� ��ȸ
select s_name, s_price , s_date from snack1 where s_date < to_date('20221001','YYYYMMDD');
--'��'�� ���� ȸ�翡�� ���� ������ �̸� ��ȸ
select s_name from snack1 where s_maker like'%��%';
--'��' ������ ���ڵ� ��հ� ��ȸ
select avg(s_price) from snack1 where s_name like '%��%';
--ũ�����ڰų�,����~�ΰ� �̸�,����ȸ��,���� ��ȸ
select s_name , s_maker , s_price from snack1 where s_maker in 'ũ���' or s_name like '%����%';
--������ �̸��� '���޴���'���� �����ϰų� '��' �� ������ ������ �̸�,������ ,���� ��ȸ 
--���� ������ �߿��� ȸ�簡 ũ����̰� ������ 1000�� �����̰ų� 3000�� �̻��� ���� ��ü���� ��ȸ
select * from snack1 where s_maker in 'ũ���' and (s_price <=1000 or s_price>=3000);
--�Ե� �Ǵ� ���� ȸ���� ���� ��� ������ 1800 �� �̻��� �� �� ȸ���� ��� ���� ������ �� ����
select avg(s_price) from snack1 where s_maker in ('�Ե�','����') and s_price >= (select avg(s_price)from snack1)order by avg(s_price);
--ȸ�纰�� �׷��� ��� ���� ��հ���, �ּҰ���, �ְ��� �� �˰������
select avg(s_price), min(s_price), max(s_price) from snack1 group by s_maker;
--ȸ�� �̸�, ȸ�纰 ���� �� ���� �հ�� ��� ���ڵ��� �հ�
select decode(s_maker,null,'�հ�',s_maker) maker, sum(s_price) ,count(s_name) from snack1 group by rollup(s_maker);
--ȸ�纰�� ���� ��� ������ 2000�� �̻��� ȸ���� �̸��� ���� ��� ������ ��ȸ.
select avg(s_price), s_maker from snack1 group by s_maker having avg(s_price) >= 2000;


create table snack1 (
s_no number(5) primary key,
s_name varchar(10 char) not null,
s_maker varchar(10 char) not null,
s_price number(10)not null,
s_date date not null
);

create sequence snack1_seq;

insert into snack1 values(snack1_seq.nextval,'����Ŀ��','������',2000,sysdate);
insert into snack1 values(snack1_seq.nextval,'������','�Ե�',2500,sysdate);
insert into snack1 values(snack1_seq.nextval,'������','��ī�ݶ�',500,sysdate);
insert into snack1 values(snack1_seq.nextval,'��ĵ��','�Ե�',3500,sysdate);
insert into snack1 values(snack1_seq.nextval,'�����','������',1500,sysdate);
insert into snack1 values(snack1_seq.nextval,'��������','����',1500,sysdate);
insert into snack1 values(snack1_seq.nextval,'��¡���','ũ���',2000,sysdate);
insert into snack1 values(snack1_seq.nextval,'��Ŭ����','ũ���',4000,sysdate);
insert into snack1 values(snack1_seq.nextval,'���޴���','ũ���',3000,sysdate);
insert into snack1 values(snack1_seq.nextval,'����','����',1000,sysdate);
insert into snack1 values(snack1_seq.nextval,'�ٰ�Ʈ','ũ���',1000,sysdate);
insert into snack1 values(snack1_seq.nextval,'Ŀ�ǻ���','����',5000,sysdate);
insert into snack1 values(snack1_seq.nextval,'ġ������ũ','������',4500,sysdate);
insert into snack1 values(snack1_seq.nextval,'����','����',2500,sysdate);
insert into snack1 values(snack1_seq.nextval,'�Ұ�����','�Ե�',3000,sysdate);


------------------------------------------------------------------------------------------


1.���������� ����...snack ���̺� �̿��Ͽ� �������� �ۼ�

--���ڵ� �� �ְ�
select max(s_price) from snack;
--���Ϻ�� �����̸�,������,����
select s_name , s_maker , s_price from snack where s_price = (select max(s_price)from snack);
--���� �� ���ڴ� ��𿡼� ���峪��
select s_maker from snack where s_price =(select min(s_price) from snack);
--��հ����� ��� ���ڴ� �� ����?
select count(s_name) from snack where s_price > (select avg(s_price)from snack);
--��������� ���� �������� ������ ��ü����.
select *from snack where s_date =(select max(s_date)from snack);

create table snack (
s_no number(5) primary key,
s_name varchar(10 char) not null,
s_maker varchar(10 char) not null,
s_price number(10)not null,
s_date date not null
);

create sequence snack_seq;

insert into snack values(snack_seq.nextval,'����Ŀ��','������',2000,sysdate);
insert into snack values(snack_seq.nextval,'������','�Ե�',2500,sysdate);
insert into snack values(snack_seq.nextval,'������','��ī�ݶ�',500,sysdate);
insert into snack values(snack_seq.nextval,'��ĵ��','�Ե�',3500,sysdate);
insert into snack values(snack_seq.nextval,'�����','������',1500,sysdate);
insert into snack values(snack_seq.nextval,'��������','����',1500,sysdate);
insert into snack values(snack_seq.nextval,'��¡���','ũ���',1500,sysdate);
insert into snack values(snack_seq.nextval,'��Ŭ����','ũ���',1500,sysdate);
insert into snack values(snack_seq.nextval,'���޴���','ũ���',1500,sysdate);
insert into snack1 values(snack1_seq.nextval,'����','����',1000,sysdate);
insert into snack1 values(snack1_seq.nextval,'�ٰ�Ʈ','ũ���',1000,sysdate);
insert into snack1 values(snack1_seq.nextval,'Ŀ�ǻ���','����',5000,sysdate);
insert into snack1 values(snack1_seq.nextval,'ġ������ũ','������',4500,sysdate);
insert into snack1 values(snack1_seq.nextval,'����','����',2500,sysdate);
insert into snack1 values(snack1_seq.nextval,'�Ұ�����','�Ե�',3000,sysdate);

------------------------------------------------------------------------
2.������ ���� snack table and maker table �� �̿��Ͽ� ���������� �ۼ�

--���� �� ���� ���� ȸ�翡�� ����� �����̸�, ����
select s_name,s_price from snack where s_maker =(select m_name from maker where m_staff =(select min(m_staff)from maker));
--���� ��� ���ڸ� ����� ȸ��� ��� �ִ���
select m_name from maker where m_name=(select s_maker from snack where s_price =(select max(s_price)from snack));
--��õ�� �ִ� ȸ�翡�� ����� ������ ��հ�
select avg(s_price) from snack where s_maker = (select m_name from maker where m_name ='��õ');
--��հ� �̻��� ���ڸ� ����� ȸ���� �̸�,��ġ --error : single-row subquery ��¼�� ��¼�� in ����ؼ� �ذ�
select m_name,m_address from maker where m_name in(select s_maker from snack where s_price >= (select avg(s_price)from snack)	); 

create table maker (
m_name varchar(20 char) primary key,
m_address varchar(30 char) not null,
m_staff number(3)not null
);

insert into maker values('������','ȭ��',56);
insert into maker values('�Ե�','�Ϻ�',20);
insert into maker values('��ī�ݶ�','�̱�',500);
insert into maker values('ũ���','ȣ��',450);
insert into maker values('����','���ѹα�',980);

select * from maker;
----------------------------------------------------------------------------------
1.���� ���̺�� ī�� ���̺��� �����
--���� ���̺� : ���� �̸�/ ���� / �Ǹ��ϴ� ī���� �̸�
--ī�����̺� : ī���̸� / ���� / �¼���
--���� �� ���̺��� Ŀ���̸�, ī���̸��� ������ ���� ���´�.

2.���ǿ� �´� ���̺� ����
--aī��� ���￡ ��ġ�ϰ� �¼��� 100�� �Ƹ޸�ī�� 2õ��, �� 3õ��, ���� 2500��.
--bī��� �Ǳ��� ��ġ�ϰ� �¼��� 80��  ȫ�� 2500��,	������ 3õ��, ���������� 4õ��.

3.������ �ۼ�
-- ��հ����� ��� ����� �� ���� ����
select count(d_name) from drink where d_price > (select avg(d_price)from drink);
-- ���� �� ���Ḧ �Ĵ� ī���� �̸���
select c_name from CAFE where c_name = (select d_cafe from drink where d_price =(select min(d_price)from drink));
-- ���￡ �ִ� ī�信�� ����� ���� ��հ�����
select avg(d_price) from drink where d_cafe = (select c_name from cafe where c_location = '����'	);
-- �¼��� 90�� �̻��� ī�信�� �Ĵ� ������ �̸���
select d_name from drink where d_cafe = (select c_name from cafe where c_seat >= 90);
-- ��հ� ������ ������ �̸�
select d_name from drink where d_price <= (select avg(d_price)from drink);
-- ���� ��� ���Ḧ �Ĵ� ī��� ��� �ִ���
select c_location from cafe where c_name =(select d_cafe from drink where d_price = (select max(d_price)from drink));


create table drink (
d_name varchar2(30 char) primary key,
d_price number(8) not null,
d_cafe varchar2(30 char) not null
);
insert into drink values('�Ƹ޸�ī��',2000,'a');
insert into drink values('��',3000,'a');
insert into drink values('����',2500,'a');
insert into drink values('ȫ��',2500,'b');
insert into drink values('������',3000,'b');
insert into drink values('����������',4000,'b');

create table cafe (
c_name varchar2(30 char) primary key,
c_location varchar2(30 char) not null,
c_seat number(4) not null
);

select round(avg(d_price))from drink;
drop table cafe cascade constraint purge;
insert into cafe values('a','����',100);
insert into cafe values('b','�Ǳ�',80);
---------------------------------------------------------------------------------------



--�¼� �� ���� ���� �Ĵ� ��ϴ� ����� ��ü���� ��ȸ
select * from ceo where c_no =(select f_no from store where f_seat =(select max(f_seat)from store));
--���������� �޴� ��ü�� �̸�, ������ ���� �������� ������ ���ٸ� �޴����� ������ ���� ���� (������ �������ϰ� �������� oredr by �÷��� asc/desc , ����)
select m_name ,m_price from menu order by m_price,m_price desc;
--��ü ����Ե� �̸�,���� ��ȸ
select c_name, c_birthday from ceo;
--���������� �Ĵ� �� ��?
select count(f_name) from store;
--���������� �޴� ��ü�� ��հ�
select avg(m_price) from menu;
--���� ��� �޴� �̸�, ����
select m_name, m_price from menu where m_price = (select max(m_price)from menu);
--�ֿ����� ������� �̸� ,����
select c_name, c_birthday from ceo where c_birthday = (select min(c_birthday)from ceo);
--�¼� ���� ���� ���� �Ĵ��� �̸� ,������ ����,�¼���
select f_name , f_location , f_seat from store where f_seat =(select min(f_seat)from store);
--ȫ����� �Ǳ��� ��ϴ� ����� �̸�,����
select c_name,c_birthday from ceo where c_no =(select f_no from store where f_name ='ȫ�����' and f_location ='�Ǳ�');
--������ �� ������ ��𰡸� ���� �� �ֳ���
select f_name from store where f_no = (select m_f_no from menu where m_name like '%����%');
--�ֿ��� ����Գ� ���� �޴� �̸�,����
select m_name, m_price from menu where m_f_no = (select c_no from ceo where c_birthday =(select max(c_birthday)from ceo));
select m_name,m_price from menu where m_f_no = (select f_no from store where f_no =    (select c_no from ceo where c_birthday=(select max(c_birthday) from ceo)));
----------------------------���� Ȱ��---------------------------------------------------
-- ��ü �Ĵ� �̸�,������,����� �̸�, ����Ի���
select f_name,f_location,c_name,c_birthday from store ,ceo where f_no=c_no;
-- ��ü �޴���, ����, �Ĵ��̸�, ������
select m_name ,m_price ,f_name ,f_location from menu,store where m_f_no=f_no;
-- �¼��� �� 50�� �̻��� �Ĵ��� �޴���,����,�Ĵ��̸�,������,�¼���
select m_name,m_price,f_name,f_location,f_seat from menu , store where m_f_no= f_no;
-- �Ը� ���� ū �Ĵ��� �޴���, ����, �Ĵ��̸�, ������, �¼���
select m_name,m_price,f_name,f_location,F_seat from menu , store where m_f_no=f_no and f_seat =(select max(f_seat)from store);
-- �ֿ����� ����Գ� ��ü �޴���, ����, �Ĵ��̸�, ������ ,������̸�, ������ �޴��� - �����ټ�, �Ĵ��̸�- �����ټ�.
select m_name,m_price,f_name,f_location,C_name,c_birthday from menu,store,ceo where m_f_no=f_no and f_no=c_no and c_birthday = (select min(c_birthday)from ceo) ;
----------------------------�ο�� --------------------------------
�޴����̺� m_no (sequence ó���� ġ������ ������ �־  �����۾� �� ���)
--�޴� �̸��� ������ ������ �����ؼ� �޴� ��ü ������ ��ȸ�غ���.
select rownum , m_name from (select m_name from menu order by m_name)where rownum >=1 and rownum <=4;
--2~4 ���� �޴����̺� ������ �޴������� ������ ��
select * from(select rownum as rn,m_name,M_price from(select m_name ,m_price from menu order by m_name asc))where rn between 2 and 4;
--�浿 �̸��� ���� ����Գ� �޴���,����,�Ĵ��,������,������̸� ���� �� �������� ������ ���ٸ� �޴����� �����ټ� 3~8��° ���� ��ȸ.
select *from(select rownum rn , m_name,m_price ,f_name,f_location        from(select m_name, m_price,  f_name,  f_location       from menu,store,ceo where m_f_no=f_no and f_no=c_no and c_name like '%�浿%' order by m_name asc))where rn between 3 and 8;
--�达 ���� ���� ����Գ� �޴���,����,������̸�,����� ���� �� ������ ������������ �������ؼ� 2~3�������� 
select * from (select  rownum as rn ,m_name, m_price, c_name, c_gender from(select  m_name, m_price, c_name, c_gender from menu,ceo where m_f_no = c_no and c_name like '��%' order by m_price desc))where rn between 2 and 6;



create table store (
f_no number(3)primary key,
f_name varchar2 (30char) not null,
f_location varchar2 (30char)not null,
f_ceo number(3) not null,
f_seat number(5) not null
);
create sequence store_seq;


insert into store values(store_seq.nextval,'ȫ�����','�Ǳ�',1,100);
insert into store values(store_seq.nextval,'ȫ�����','����',2,80);
insert into store values(store_seq.nextval,'�ѽ�����','����',3,150);
insert into store values(store_seq.nextval,'��õ����','��õ',4,130);
insert into store values(store_seq.nextval,'�λ����','�λ�',7,200);

select * from store;


create table ceo (
c_no number(3) primary key,
c_name varchar2(30char) not null,
c_birthday date not null,
c_gender varchar2 (10char) not null
);

create sequence ceo_seq;


insert into ceo values(ceo_seq.nextval,'ȫ�浿',to_date('1990-03-01','YYYY-MM-DD'),'����');
insert into ceo values(ceo_seq.nextval,'��浿',to_date('1992-02-01','YYYY-MM-DD'),'����');
insert into ceo values(ceo_seq.nextval,'ȫ�浿',to_date('1991-12-12','YYYY-MM-DD'),'����');
insert into ceo values(ceo_seq.nextval,'�ֱ浿',to_date('1989-09-01','YYYY-MM-DD'),'����');


create table menu(
m_no number (3) primary key,
m_name varchar2(20char) not null,
m_price number(6) not null,
m_f_no number(3) not null
);

create sequence menu_seq;

insert into menu values(menu_seq.nextval,'�����',4000,1);
insert into menu values(menu_seq.nextval,'«��',5500,1);
insert into menu values(menu_seq.nextval,'������',3000,1);
insert into menu values(menu_seq.nextval,'�������',2300,2);
insert into menu values(menu_seq.nextval,'��ġ�',6000,2);
insert into menu values(menu_seq.nextval,'�ܹ���',4500,2);
insert into menu values(menu_seq.nextval,'�ʷ���',8000,3);
insert into menu values(menu_seq.nextval,'����ȭ��',35000,3);
insert into menu values(menu_seq.nextval,'��ͺ�',700,3);
insert into menu values(menu_seq.nextval,'��ī��',12000,4);
insert into menu values(menu_seq.nextval,'�׻�',3000,4);
insert into menu values(menu_seq.nextval,'����',500,4);


-------------------------------------------------------


--��� ��Ʈ�� ������ 30% ���̱�
update mart set m_parking = m_parking*0.7;
--Ȩ�÷��� �Ǳ����� ��ǰ ���� 10% ����
update product set p_price = p_price *0.9 where p_m_no = (select m_no from mart where m_location = '�Ǳ���');
--���� ��� ��ǰ 10% ����
update product set p_price = p_price * 0.9 where p_price = (select max(p_price)from product);
--�� ����
delete from product where p_food = '��';
--���� ���� ���� ��ǰ �� ����
delete from mart where m_scale=(select max(m_scale) from mart);


select * from product;
select * from mart;
select * from tab;
select * from user_sequences;
drop table product cascade constraint purge;
drop sequence product_seq;


create table mart (
m_no number(6) primary key,
m_name varchar2(30char) not null,
m_location varchar2(30char)not null,
m_scale number(6)not null,
m_parking number(6) not null
);

create sequence mart_seq;

insert into mart values(mart_seq.nextval,'Ȩ�÷���',	'�Ǳ���',	1000,	500);
insert into mart values(mart_seq.nextval,'Ȩ�÷���',	'������',	500,	300);
insert into mart values(mart_seq.nextval,'�̸�Ʈ',	'������',	800,	800);
insert into mart values(mart_seq.nextval,'danimart',	'������',	800,	800);





create table product(
p_no number(6) primary key,
p_m_no number(6)not null,
p_name varchar2(30char) not null,
p_gram number(5) not null,
p_price number(6) not null,
	constraint fk foreign key(p_m_no)
	references mart(m_no)
	on delete cascade
);

create sequence product_seq;

insert into product values(product_seq.nextval,1,'����',3000,10000);
insert into product values(product_seq.nextval,2,'��',500,5000);
insert into product values(product_seq.nextval,3,'����',2000,5000);
insert into product values(product_seq.nextval,3,'dani',2000,5000);
insert into product values(product_seq.nextval,4,'dani',2000,5000);

