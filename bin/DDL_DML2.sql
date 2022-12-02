select * from user_sequences;
drop sequence aug30_snack_seq;
drop sequence ceo_seq;
drop sequence menu_seq;
drop sequence snack_seq;
drop sequence store_seq;

select * from tab; 
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
select min(s_price) from snack where s_price <= 2000;
--��� ������ ��հ���
select avg(s_price) from snack 
--������ �̸��� ������ 30% ���ε� �ݾ�
select s_name , s_price*0.7 from snack
--3500���� ������ ������ �?
select count(s_name) from snack where s_price =3000;
--3000�� ������ ������ �̸�,ȸ���̸�
--��� ���� �̸�, ����, ������� ��ȸ
--��� ���� �̸�, ����, �ΰ��� ��ȸ 10%
--��� ���� �̸�, ����, �ǸŰ� ��ȸ 20%����
--3000�� ���� ū �ݾ��� ���ڵ��� ��հ� ��ȸ
--�ְ�,������,�� ���� ���� ������� ��ȸ
--3000�� �̻��� ������ ��ü ���� ��ȸ
--3000�� �̸��� ������ �̸�, ����, �ǸŰ� ��ȸ 20% ����
--��Ϲ���Ĩ�� ���� ��ȸ
--ũ��� ȸ���� ���� ���� ���� ��ȸ
--9�� ������ �Ծ�� �ϴ� ���� �̸�, ����, ������� ��ȸ
--'��'�� ���� ȸ�翡�� ���� ������ �̸� ��ȸ
--'��' ������ ���ڵ� ��հ� ��ȸ
--ũ�����ڰų�,����~�ΰ� �̸�,����ȸ��,���� ��ȸ
--������ �̸��� '���޴���'���� �����ϰų� '��' �� ������ ������ �̸�,������ ,���� ��ȸ 
--���� ������ �߿��� ȸ�簡 ũ����̰� ������ 1000�� �����̰ų� 3000�� �̻��� ���� ��ü���� ��ȸ
--�Ե� �Ǵ� ���� ȸ���� ���� ��� ������ 1800 �� �̻��� �� �� ȸ���� ��� ���� ������ �� ����
--ȸ�纰�� �׷��� ��� ���� ��հ���, �ּҰ���, �ְ��� �� �˰������
--ȸ�� �̸�, ȸ�纰 ���� �� ���� �հ�� ��� ���ڵ��� �հ�
--ȸ�纰�� ���� ��� ������ 2000�� �̻��� ȸ���� �̸��� ���� ��� ������ ��ȸ.


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
--���Ϻ�� �����̸�,������,����
--���� �� ���ڴ� ��𿡼� ���峪��
--��հ����� ��� ���ڴ� �� ����?
--��������� ���� �������� ������ ��ü����.

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
--���� ��� ���ڸ� ����� ȸ��� ��� �ִ���
--��õ�� �ִ� ȸ�翡�� ����� ������ ��հ�
--��հ� �̻��� ���ڸ� ����� ȸ���� �̸�,��ġ --error : single-row subquery ��¼�� ��¼�� in ����ؼ� �ذ�

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
-- ���� �� ���Ḧ �Ĵ� ī���� �̸���
-- ���￡ �ִ� ī�信�� ����� ���� ��հ�����
-- �¼��� 90�� �̻��� ī�信�� �Ĵ� ������ �̸���
-- ��հ� ������ ������ �̸�
-- ���� ��� ���Ḧ �Ĵ� ī��� ��� �ִ���


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
--���������� �޴� ��ü�� �̸�, ������ ���� �������� ������ ���ٸ� �޴����� ������ ���� ���� (������ �������ϰ� �������� oredr by �÷��� asc/desc , ����)
--��ü ����Ե� �̸�,���� ��ȸ
--���������� �Ĵ� �� ��?
--���������� �޴� ��ü�� ��հ�
--���� ��� �޴� �̸�, ����
--�ֿ����� ������� �̸� ,����
--�¼� ���� ���� ���� �Ĵ��� �̸� ,������ ����,�¼���
--ȫ����� �Ǳ��� ��ϴ� ����� �̸�,����
--������ �� ������ ��𰡸� ���� �� �ֳ���
--�ֿ��� ����Գ� ���� �޴� �̸�,����
----------------------------���� Ȱ��---------------------------------------------------
-- ��ü �Ĵ� �̸�,������,����� �̸�, ����Ի���
-- ��ü �޴���, ����, �Ĵ��̸�, ������
-- �¼��� �� 50�� �̻��� �Ĵ��� �޴���,����,�Ĵ��̸�,������,�¼���
-- �Ը� ���� ū �Ĵ��� �޴���, ����, �Ĵ��̸�, ������, �¼���
-- �ֿ����� ����Գ� ��ü �޴���, ����, �Ĵ��̸�, ������ ,������̸�, ������ �޴��� - �����ټ�, �Ĵ��̸�- �����ټ�.
----------------------------�ο�� --------------------------------
�޴����̺� m_no (sequence ó���� ġ������ ������ �־  �����۾� �� ���)
--�޴� �̸��� ������ ������ �����ؼ� �޴� ��ü ������ ��ȸ�غ���.
--2~4 ���� �޴����̺� ������ �޴������� ������ ��
--�浿 �̸��� ���� ����Գ� �޴���,����,�Ĵ��,������,������̸� ���� �� �������� ������ ���ٸ� �޴����� �����ټ� 3~8��° ���� ��ȸ.
--�达 ���� ���� ����Գ� �޴���,����,������̸�,����� ���� �� ������ ������������ �������ؼ� 2~3�������� 



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
--Ȩ�÷��� �Ǳ����� ��ǰ ���� 10% ����
--���� ��� ��ǰ 10% ����
--�� ����
--���� ���� ���� ��ǰ �� ����


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