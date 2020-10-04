/*--------------------------------C H A R T---------------------------------------------*/
/* 월별 가입자수  */
select sum(decode(to_char(reg_date,'MM'), '01', 1)) "1월",
	   sum(decode(to_char(reg_date,'MM'), '02', 1)) "2월",
	   sum(decode(to_char(reg_date,'MM'), '03', 1)) "3월",
	   sum(decode(to_char(reg_date,'MM'), '04', 1)) "4월",
	   sum(decode(to_char(reg_date,'MM'), '05', 1)) "5월",
	   sum(decode(to_char(reg_date,'MM'), '06', 1)) "6월",
	   sum(decode(to_char(reg_date,'MM'), '07', 1)) "7월",
	   sum(decode(to_char(reg_date,'MM'), '08', 1)) "8월",
	   sum(decode(to_char(reg_date,'MM'), '09', 1)) "9월"
from member;

/* 월별 매출액 */
select sum(case when to_char(o_date,'MM') = '01' then totalCost end) "MON1",
	   sum(case when to_char(o_date,'MM') = '02' then totalCost end) "MON2",
	   sum(case when to_char(o_date,'MM') = '03' then totalCost end) "MON3",
	   sum(case when to_char(o_date,'MM') = '04' then totalCost end) "MON4",
	   sum(case when to_char(o_date,'MM') = '05' then totalCost end) "MON5",
	   sum(case when to_char(o_date,'MM') = '06' then totalCost end) "MON6",
	   sum(case when to_char(o_date,'MM') = '07' then totalCost end) "MON7",
	   sum(case when to_char(o_date,'MM') = '08' then totalCost end) "MON8",
	   sum(case when to_char(o_date,'MM') = '09' then totalCost end) "MON9"
from orders;

/* 총 누적 판매액 & 펀딩상품 판매액 & 일반상품 판매액 */
select sum(totalCost) as totalCost,
	   sum(case when substr(p_id,1,1) = 'f' then totalCost end) as fundingTotal,
	   sum(case when substr(p_id,1,1) = 'p' then totalCost end) as productTotal
from orders

/* 총 회원 수*/
select count(*) as member from member;

/* 누적 주문 건수 & 펀딩상품 주문 건수 & 일반상품 주문건수 */
select count(*) as orderTotal,
	   count(case when substr(p_id,1,1) = 'f' then p_id end) as fundingOrderTotal,
	   count(case when substr(p_id,1,1) = 'p' then p_id end) as productOrderTotal
from orders

/* 총 상품갯수 & 펀딩 상품 개수 & 일반상품 개수  */
select a.p_id, b.fp_id
from (select count(*) p_id from products)a,
	(select count(*) fp_id from funding_product)b

/* 월별 펀딩상품 주문건수 */
select count(case when substr(p_id,1,1) = 'f' and to_char(o_date,'MM') = '01' then 1 end) "1월",
	   count(case when substr(p_id,1,1) = 'f' and to_char(o_date,'MM') = '02' then 1 end) "2월",
	   count(case when substr(p_id,1,1) = 'f' and to_char(o_date,'MM') = '03' then 1 end) "3월",
	   count(case when substr(p_id,1,1) = 'f' and to_char(o_date,'MM') = '04' then 1 end) "4월",
	   count(case when substr(p_id,1,1) = 'f' and to_char(o_date,'MM') = '05' then 1 end) "5월",
	   count(case when substr(p_id,1,1) = 'f' and to_char(o_date,'MM') = '06' then 1 end) "6월",
	   count(case when substr(p_id,1,1) = 'f' and to_char(o_date,'MM') = '07' then 1 end) "7월",
	   count(case when substr(p_id,1,1) = 'f' and to_char(o_date,'MM') = '08' then 1 end) "8월",
	   count(case when substr(p_id,1,1) = 'f' and to_char(o_date,'MM') = '09' then 1 end) "9월"
from orders;

/* 월별 상품 주문건수 */
select count(case when substr(p_id,1,1) = 'p' and to_char(o_date,'MM') = '01' then 1 end) "1월",
	   count(case when substr(p_id,1,1) = 'p' and to_char(o_date,'MM') = '02' then 1 end) "2월",
	   count(case when substr(p_id,1,1) = 'p' and to_char(o_date,'MM') = '03' then 1 end) "3월",
	   count(case when substr(p_id,1,1) = 'p' and to_char(o_date,'MM') = '04' then 1 end) "4월",
	   count(case when substr(p_id,1,1) = 'p' and to_char(o_date,'MM') = '05' then 1 end) "5월",
	   count(case when substr(p_id,1,1) = 'p' and to_char(o_date,'MM') = '06' then 1 end) "6월",
	   count(case when substr(p_id,1,1) = 'p' and to_char(o_date,'MM') = '07' then 1 end) "7월",
	   count(case when substr(p_id,1,1) = 'p' and to_char(o_date,'MM') = '08' then 1 end) "8월",
	   count(case when substr(p_id,1,1) = 'p' and to_char(o_date,'MM') = '09' then 1 end) "9월"
from orders;
/*--------------------------------------------MEMBER CHART DB----------------------------------------*/
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test1','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test2','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test3','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test4','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test5','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test6','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test7','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test8','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test9','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-02-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test10','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-02-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test11','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-02-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test12','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-03-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test13','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-03-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test14','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-03-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test15','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-03-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));


insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test16','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test17','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test18','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test19','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test20','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));


insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test21','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test22','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));

insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test23','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-06-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));

insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test24','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test25','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test26','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test27','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test28','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test29','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));

insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test30','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test31','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test32','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test33','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test34','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test35','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test36','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into member(id, password, name, phone, postcode, address, detailAddress, extraAddress, reg_date) 
values('test37','1234','테스트','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길', TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'));
/*---------------------------------------------P & FP CHART DB------------------------------------ */
/* 1월의 펀딩상품(f_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031147','f1001',1,TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031148','f1000',1,TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031149','f1001','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031150','f1000','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031151','f1001','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031152','f1001','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031153','f1001','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031154','f1001','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');


/* 1월의 일반상품(p_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031155','p1235','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031156','p1248','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031157','p1235','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031158','p1248','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031159','p1235','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031160','p1248','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031161','p1235','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031162','p1248','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031163','p1235','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031164','p1248','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031165','p1235','1',TO_DATE('2020-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');






/* 2월의 펀딩상품(f_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031167','f1000','1',TO_DATE('2020-02-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031168','f1001','1',TO_DATE('2020-02-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031169','f1000','1',TO_DATE('2020-02-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');


/* 2월의 일반상품(p_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031170','p1235','1',TO_DATE('2020-02-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031171','p1248','1',TO_DATE('2020-02-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031172','p1235','1',TO_DATE('2020-02-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031173','p1248','1',TO_DATE('2020-02-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031174','p1235','1',TO_DATE('2020-02-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');




/* 3월의 펀딩상품(f_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031175','f1000','1',TO_DATE('2020-03-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031176','f1001','1',TO_DATE('2020-03-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031177','f1000','1',TO_DATE('2020-03-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031178','f1001','1',TO_DATE('2020-03-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031179','f1000','1',TO_DATE('2020-03-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031180','f1001','1',TO_DATE('2020-03-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');


/* 3월의 일반상품(p_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031181','p1235','1',TO_DATE('2020-03-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031182','p1248','1',TO_DATE('2020-03-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031183','p1235','1',TO_DATE('2020-03-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');




/* 4월의 펀딩상품(f_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031184','f1000','1',TO_DATE('2020-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031185','f1001','1',TO_DATE('2020-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031186','f1000','1',TO_DATE('2020-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');


/* 4월의 일반상품(p_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031187','p1235','1',TO_DATE('2020-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031188','p1248','1',TO_DATE('2020-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031189','p1235','1',TO_DATE('2020-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031190','p1248','1',TO_DATE('2020-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031191','p1235','1',TO_DATE('2020-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');




/* 5월의 펀딩상품(f_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031192','f1000','1',TO_DATE('2020-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031193','f1001','1',TO_DATE('2020-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031194','f1000','1',TO_DATE('2020-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031195','f1001','1',TO_DATE('2020-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031196','f1000','1',TO_DATE('2020-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031197','f1001','1',TO_DATE('2020-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031198','f1001','1',TO_DATE('2020-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031199','f1001','1',TO_DATE('2020-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');



/* 5월의 일반상품(p_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031100','p1235','1',TO_DATE('2020-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031101','p1248','1',TO_DATE('2020-05-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');




/* 6월의 펀딩상품(f_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031102','f1000','1',TO_DATE('2020-06-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');


/* 6월의 일반상품(p_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031103','p1235','1',TO_DATE('2020-06-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031104','p1248','1',TO_DATE('2020-06-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031105','p1235','1',TO_DATE('2020-06-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031106','p1248','1',TO_DATE('2020-06-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031107','p1235','1',TO_DATE('2020-06-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');







/* 7월의 펀딩상품(f_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031108','f1000','1',TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031109','f1001','1',TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031110','f1000','1',TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031112','f1000','1',TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031113','f1001','1',TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031114','f1001','1',TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031115','f1001','1',TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031116','f1001','1',TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');


/* 7월의 일반상품(p_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031117','p1235','1',TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031118','p1248','1',TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031119','p1235','1',TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031120','p1248','1',TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031121','p1235','1',TO_DATE('2020-07-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');





/* 8월의 펀딩상품(f_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031136','f1000','1',TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031137','f1001','1',TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031138','f1000','1',TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031139','f1001','1',TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031140','f1000','1',TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031141','f1001','1',TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');


/* 8월의 일반상품(p_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031142','p1235','1',TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031143','p1248','1',TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031144','p1235','1',TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031145','p1248','1',TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031146','p1235','1',TO_DATE('2020-08-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');




/* 9월의 펀딩상품(f_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031122','f1000','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031123','f1001','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031124','f1000','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031125','f1001','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031126','f1000','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031127','f1001','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031128','f1000','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031129','f1001','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');

/* 9월의 일반상품(p_id) 주문건수 */
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031130','p1248','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031131','p1235','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031132','p1248','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031133','p1235','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031134','p1248','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
insert into orders(seq,o_number,p_id,qty,o_date,id,name,phone,postcode,address,detailAddress,extraAddress,requestedTerm,couponUsed,totalCost)
values(seq_orders.nextval,'TN2009031135','p1235','1',TO_DATE('2020-09-01 00:00:00','YYYY-MM-DD HH24:MI:SS'),'yun','윤성','01049226182','06134', '서울특별시 강남구 역삼동 649-5', '6층', '테헤란로 7길','경비실에 맡겨 주세요','미사용','59000');
