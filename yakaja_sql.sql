-- 변경사항
-- mem_id unique에서 pk로 제약조건 수정
-- 이름 중복되는 호텔 삽입 sql문 삭제


-- 기존 테이블 삭제
drop table pr2member;
drop table pr2hotel;
drop table pr2review;
drop table pr2reserv;
drop table pr2reserv2;
drop table pr2imsi;
drop table pr2rooma;
drop table pr2roomb;
drop table pr2roomc;

-- imsi 테이블 생성
create table pr2imsi(
room_imsi varchar2(10)
);

-- 멤버 테이블 생성
create table pr2member(
mem_id varchar2(20) constraint pr2member_mem_id_pk primary key,
mem_pw varchar2(20),
mem_email varchar2(20),
mem_name varchar2(20),
mem_tel varchar2(20),
mem_admin number(1)
);

-- 기본 리뷰 삽입용 고객아이디 입력
insert into pr2member
values('def123','1234','def@gmail.com','초기리뷰1','010-3213-1231',0);
insert into pr2member
values('eft123','1234','eft123@gmail.com','초기리뷰2', '010-3211-5549',0);
commit;

-- 초기 삽입용 업주아이디 입력
insert into pr2member
values('abc123','1234','abc@gmail.com','초기업주','010-6655-8765',1);
commit;

-- 호텔 테이블 생성
create table pr2hotel(
  hotel_id number(7)constraint pr2hotel_hotel_id_pk primary key,
  hotel_name varchar2(50) constraint pr2_hotel_name_uk unique,
  hotel_address varchar2(50),
  room_aprice number(8),
  room_bprice number(8),
  room_cprice number(8),
  mem_id varchar2(20) constraint pr2hotel_mem_id_fk references pr2member(mem_id),
  hotel_wifi number(2), --wifi
  hotel_pet number(2),  --pet
  hotel_bf number(2),   --breakfast
  hotel_rs number(2),   --roomservice
  hotel_ciga number(2), --흡연
  hotel_wc number(2)    --휠체어
);

-- 예약테이블 생성
create table pr2reserv(
reserv_id number(5) constraint pr2reserv_reserv_id_pk primary key,
room_num number(5),
hotel_id number(7) constraint pr2reserv_hotel_id_fk references pr2hotel(hotel_id) ,
room_price number(7) constraint pr2reserv_room_price_ck check(room_price>0),
reserv_in varchar2(20),
reserv_out varchar2(20),
mem_id varchar2(20) constraint pr2reserv_mem_id_fk references pr2member(mem_id)
);

-- 리뷰테이블 생성
create table pr2review(
bunho number(5) constraint pr2review_number_pk primary key,
review_title varchar2(30),
mem_id varchar2(20) constraint pr2review_mem_id_fk references pr2member(mem_id),
review_content varchar2(400),
review_score number(4,1) constraint pr2review_review_score_ck check(review_score<=5),
hotel_id number(7) constraint pr2review_hotel_id_fk references pr2hotel(hotel_id)
)

-- room 테이블 생성
create table pr2rooma(
room_num number(4),
room_rank varchar(20),
room_bath number(4),
room_bed number(4),
room_kit number(2),
room_size number(5)
);
create table pr2roomb(
room_num number(4),
room_rank varchar(20),
room_bath number(4),
room_bed number(4),
room_kit number(2),
room_size number(5)
);
create table pr2roomc(
room_num number(4),
room_rank varchar(20),
room_bath number(4),
room_bed number(4),
room_kit number(2),
room_size number(5)
);

-- 예약테이블2 생성
create table pr2reserv2(
pr2record varchar2(20) constraint pr2reserv2_pr2record_uk unique);

-- room a/b/c 테이터 입력
INSERT all
into pr2rooma values(101,'디럭스',2,4,1,60)
into pr2rooma values(102,'스탠다드',1,2,0,39)
into pr2rooma values(103,'싱글',1,1,0,19)
into pr2rooma values(201,'싱글',1,1,0,19)
into pr2rooma values(202,'디럭스',2,4,1,60)
into pr2rooma values(203,'싱글',1,1,0,19)
into pr2rooma values(301,'스탠다드',1,2,0,39)
into pr2rooma values(302,'스탠다드',1,2,0,39)
into pr2rooma values(303,'싱글',1,1,0,19)
into pr2rooma values(401,'싱글',1,1,0,19)
into pr2rooma values(402,'싱글',1,1,0,19)
into pr2rooma values(403,'싱글',1,1,0,19)
into pr2rooma values(501,'디럭스',2,4,1,60)
into pr2rooma values(502,'디럭스',2,4,1,60)
into pr2rooma values(503,'디럭스',2,4,1,60)
into pr2rooma values(601,'스탠다드',1,2,0,39)
into pr2rooma values(602,'스탠다드',1,2,0,39)
into pr2rooma values(603,'디럭스',2,4,1,60)
into pr2rooma values(701,'싱글',1,1,0,19)
into pr2rooma values(702,'스탠다드',1,2,0,39)
into pr2rooma values(703,'디럭스',2,4,1,60)
into pr2rooma values(801,'싱글',1,1,0,19)
into pr2rooma values(802,'디럭스',2,4,1,60)
into pr2rooma values(803,'디럭스',2,4,1,60)
select * from dual;

INSERT all
into pr2roomb values(101,'스탠다드',1,2,0,28)
into pr2roomb values(102,'싱글',1,1,0,16)
into pr2roomb values(103,'싱글',1,1,0,16)
into pr2roomb values(201,'디럭스',2,3,1,42)
into pr2roomb values(202,'싱글',1,1,0,16)
into pr2roomb values(203,'싱글',1,1,0,16)
into pr2roomb values(301,'스탠다드',1,2,0,28)
into pr2roomb values(302,'싱글',1,1,0,16)
into pr2roomb values(303,'스탠다드',1,2,0,28)
into pr2roomb values(401,'디럭스',2,3,1,42)
into pr2roomb values(402,'싱글',1,1,0,16)
into pr2roomb values(403,'디럭스',2,3,1,42)
into pr2roomb values(501,'스탠다드',1,2,0,28)
into pr2roomb values(502,'싱글',1,1,0,16)
into pr2roomb values(503,'싱글',1,1,0,16)
into pr2roomb values(601,'스탠다드',1,2,0,28)
into pr2roomb values(602,'싱글',1,1,0,16)
into pr2roomb values(603,'디럭스',2,3,1,42)
into pr2roomb values(701,'싱글',1,1,0,16)
into pr2roomb values(702,'디럭스',2,3,1,42)
into pr2roomb values(703,'디럭스',2,3,1,42)
into pr2roomb values(801,'싱글',1,1,0,16)
into pr2roomb values(802,'스탠다드',1,2,0,28)
into pr2roomb values(803,'디럭스',2,3,1,42)
select * from dual;

INSERT all
into pr2roomc values(101,'싱글',1,1,0,15)
into pr2roomc values(102,'스탠다드',1,2,0,25)
into pr2roomc values(103,'싱글',1,1,0,15)
into pr2roomc values(201,'디럭스',2,3,1,40)
into pr2roomc values(202,'싱글',1,1,0,15)
into pr2roomc values(203,'싱글',1,1,0,15)
into pr2roomc values(301,'스탠다드',1,2,0,25)
into pr2roomc values(302,'스탠다드',1,2,0,25)
into pr2roomc values(303,'디럭스',2,3,1,40)
into pr2roomc values(401,'스탠다드',1,2,0,25)
into pr2roomc values(402,'싱글',1,1,0,15)
into pr2roomc values(403,'디럭스',2,3,1,40)
into pr2roomc values(501,'싱글',1,1,0,15)
into pr2roomc values(502,'싱글',1,1,0,15)
into pr2roomc values(503,'스탠다드',1,2,0,25)
into pr2roomc values(601,'디럭스',2,3,1,40)
into pr2roomc values(602,'디럭스',2,3,1,40)
into pr2roomc values(603,'스탠다드',1,2,0,25)
into pr2roomc values(701,'스탠다드',1,2,0,25)
into pr2roomc values(702,'디럭스',2,3,1,40)
into pr2roomc values(703,'디럭스',2,3,1,40)
into pr2roomc values(801,'싱글',1,1,0,15)
into pr2roomc values(802,'싱글',1,1,0,15)
into pr2roomc values(803,'스탠다드',1,2,0,25)
select * from dual;

-- 테이블들 생성 후 초기치 입력과정
insert into pr2hotel(hotel_id, hotel_name, hotel_address, 
room_aprice, room_bprice, room_cprice,mem_id, hotel_wifi, hotel_pet, hotel_bf, hotel_rs, hotel_ciga, hotel_wc)
values(1001, '콘래드서울호텔', '서울특별시 영등포구', 500000, 400000, 300000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1002, '더클래식500', '서울특별시 광진구', 490000, 389000, 300000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1003, '롯데호텔부산', '부산광역시 부산진구', 440000,330000,222000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1004, '제주드림타워', '제주특별자치도 제주시',464000,320000,150000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1005, '비아이시티', '부산광역시 남구',320000,190000,85000,'abc123',1,0,1,1,0,0);
insert into pr2hotel
values(1006, '해운대 시타딘호텔', '부산광역시 해운대구',165000,140000,10000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1007, '서울드래곤시티', '서울특별시 용산구',323000,166000,99000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1008, '파크 하얏트 부산', '부산광역시 해운대구',321000,210000, 190000,'abc123',1,0,1,1,1,1);
insert into pr2hotel
values(1009, '한화리조트 해운대', '부산광역시 해운대구',190000,166000,110000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1010, '롯데호텔서울', '서울특별시 중구',321000,210000,190000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1011, 'JW메리어트호텔', '서울특별시 서초구',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1013, '롯데호텔월드', '서울특별시 송파구',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1014, '보광휘닉스파크 블루동', '강원특별자치도 평창군',320000,190000,85000,'abc123',1,1,1,1,0,1);
insert into pr2hotel
values(1015, '하이원 그랜드호텔', '강원특별자치도 정선군',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1016, '엠블호텔 여수', '전라남도 여수시',320000,190000,85000,'abc123',1,0,1,0,0,1);
insert into pr2hotel
values(1017, '쉐라톤 그랜드 인천', '인천광역시 연수구', 490000, 389000, 300000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1018, '롯데호텔울산', '울산광역시 남구', 490000, 389000, 300000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1019, '씨마크호텔', '강원특별자치도 강릉시', 490000, 389000, 300000,'abc123',1,1,1,1,0,1);
insert into pr2hotel
values(1020, '호텔 인터불고 대구', '대구광역시 수성구',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1021, '그랜드 플라자 청주호텔', '충청북도 청주시',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1022, '그랜드 하얏트 인천', '인천광역시 중구',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1023, '경원재 앰배서더 호텔', '인천광역시 연수구',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1024, '호텔 농심', '부산광역시 동내구',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1025, '소노캄 고양', '경기도 고양시', 490000, 389000, 300000,'abc123',1,1,1,1,0,1);
insert into pr2hotel
values(1026, '신라호텔', '서울특별시', 490000, 389000, 300000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1027, '거제 삼성 호텔', '경상남도 거제시', 490000, 389000, 300000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1028, '시그니엘 부산', '부산광역시 해운대구',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1029, '라한셀렉트', '경상북도 경주시', 490000, 389000, 300000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1030, '힐튼부산', '부산광역시 기장군',240100,167000,107300,'abc123',1,0,1,1,1,1);
insert into pr2hotel
values(1031, '인터컨티넨탈 알펜시아 평창', '강원특별자치도 평창군', 490000, 389000, 300000,'abc123',1,1,1,1,0,1);
insert into pr2hotel
values(1032, '홀리데이 인 리조트 알펜시아', '강원특별자치도 평창군', 66500,60500,49700,'abc123',1,0,1,1,0,0);
insert into pr2hotel
values(1033, '르메르디앙 서울', '서울특별시 중구', 66500,60500,49700,'abc123',1,0,1,1,1,1);
insert into pr2hotel
values(1034, '신라스테이 천안', '충청남도 천안시', 66500,60500,49700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1035, '롯데리조트 부여', '충청남도 부여시', 38500,25700,18700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1036, '호텔 우연 플로라', '충청남도 보령군',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1037, '온양 관광호텔', '충청남도 아산시', 66500,60500,49700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1038, '공주INK관광호텔', '충청남도 공주시', 490000, 389000, 300000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1039, '라마다프라자 바이 원덤', '전라남도 여수시', 38500,25700,18700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1040, '히든베이 호텔', '전라남도 여수시',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1041, '베니키아 호텔 여수', '전라남도 여수시',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1042, '호텔현대 바이 라한 목포', '전라남도 목포시',240100,167000,107300,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1043, '에이본 호텔 군산', '전라북도 군산시',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1044, '스위트 호텔 남원', '전라북도 남원시',240100,167000,107300,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1045, '라한호텔 전주', '전라북도 전주시',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1046, '베스트 웨스턴 플러스 전주', '전라북도 전주시',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1047, '더클래식호텔', '전라북도 전주시', 66500,60500,49700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1048, '라마다 군산', '전라북도 군산시', 66500,60500,49700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1049, '아세라 빌라드 아쿠아 호텔', '경상남도 김해시',320000,190000,85000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1050, '진해 인터시티 호텔', '경상남도 김해시', 490000, 389000, 300000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1053, '동대문다락', '서울특별시 동대문구', 45000,23800,21000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1054, '노원노블레스호텔', '서울특별시 노원구', 108500,103000,92800,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1056, '남양주리버', '경기도 남양주시', 54600,43900,38500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1057, '테이크호텔광명', '경기도 광명시', 240100,167000,107300,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1058, '시흥하운드거북섬', '경기도 시흥시', 35000,28200,10500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1059, '파주 케이힐스', '경기도 파주시', 59000,55800,41000,'abc123',1,1,0,1,1,0);
insert into pr2hotel
values(1060, '남양주강변비치', '경기도 남양주시', 89900,82000,61100,'abc123',1,0,1,0,1,1);
insert into pr2hotel
values(1061, '신라스테이천안', '충청남도 천안시', 59000,55800,41000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1062, '서산헬로호텔', '충청남도 서산시', 108500,103000,92800,'abc123',1,0,1,1,1,1);
insert into pr2hotel
values(1063, '더메인즈호텔', '충청남도 천안시', 35000,28200,10500,'abc123',1,1,1,1,0,1);
insert into pr2hotel
values(1064, '대천에스앤호텔', '충청남도 보령시', 54600,43900,38500,'abc123',1,1,1,1,0,1);
insert into pr2hotel
values(1065, '비체팰리스', '충청남도 보령시', 84900,73600,52500,'abc123',0,1,1,1,1,1);
insert into pr2hotel
values(1066, '소노문단양', '충청북도 단양군', 47300,45100,42500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1067, '제이원호텔', '충청남도 청주시', 27800,15800,11400,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1068, '호텔뮤제오', '충청남도 청주시', 49100,45800,25100,'abc123',1,0,1,0,0,1);
insert into pr2hotel
values(1069, '단양관광호텔', '충청북도 단양군', 40400,37900,19100,'abc123',1,1,1,1,0,1);
insert into pr2hotel
values(1070, '수안보스파호텔', '충청북도 충주시', 38500,25700,18700,'abc123',1,1,1,1,0,1);
insert into pr2hotel
values(1071, '어반스테이속초등대', '강원도 속초시', 24000,16700,10700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1072, '양양이엘호텔', '강원도 양양군', 48700,47100,26200,'abc123',1,0,1,1,0,0);
insert into pr2hotel
values(1073, '디그니티호텔', '강원도 양양군', 30900,29000,17600,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1074, '정동진썬크루즈호텔', '강원도 강릉시', 78500,75700,58700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1075, '호텔탑스텐정동진', '강원도 강릉시', 84900,73600,52500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1076, '영덕시포트리조트펜션', '경상북도 영덕군', 38500,25700,18700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1077, '소노벨청송', '경상북도 청송군', 47300,45100,42500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1078, '라한호텔포항', '경상북도 포항시', 54600,43900,38500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1079, '성주가야호텔', '경상북도 성주군', 35000,28200,10500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1080, '경주성호리조트', '경상북도 경주시', 84900,73600,52500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1081, '도야거제가족호텔', '경상남도 거제시', 59000,55800,41000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1082, '스타번호텔거제', '경상남도 거제시', 240100,167000,107300,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1083, '진주뉴라온스테이호텔', '경상남도 진주시', 49100,45800,25100,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1084, '마산스카이뷰호텔', '경상남도 창원시', 54600,43900,38500,'abc123',1,0,1,0,0,1);
insert into pr2hotel
values(1085, '통영스탠포드호텔앤리조트', '경상남도 통영시', 66500,60500,49700,'abc123',1,1,1,1,0,1);
insert into pr2hotel
values(1086, '대전유성비앤비', '대전광역시 유성구', 27800,15800,11400,'abc123',1,1,1,1,0,1);
insert into pr2hotel
values(1087, '대전중리호텔라움', '대전광역시 대덕구', 49100,45800,25100,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1088, '롯데시티호텔대전', '대전광역시 유성구', 40400,37900,19100,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1089, '대전용전벨레자호텔', '대전광역시 동구', 38500,25700,18700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1090, '대전중리페이지호텔', '대전광역시 대덕구', 240100,167000,107300,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1091, '인천소마호텔', '인천광역시 미추홀구', 35000,28200,10500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1092, '블루오션레지던스호텔', '인천광역시 중구', 66500,60500,49700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1093, '오라카이송도파크호텔', '인천광역시 연수구', 240100,167000,107300,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1094, '어반스테이인천송도', '인천광역시 연수구', 59000,55800,41000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1095, '라마다인천', '인천광역시 남동구', 108500,103000,92800,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1096, '곳스테이', '대구광역시 동구', 35000,28200,10500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1097, '대구호텔라온제나', '대구광역시 수성구', 54600,43900,38500,'abc123',1,0,1,1,0,0);
insert into pr2hotel
values(1098, 'ACT관광호텔', '대구광역시 수성구', 240100,167000,107300,'abc123',1,0,1,1,1,1);
insert into pr2hotel
values(1099, '대구그랜드호텔', '대구광역시 수성구', 89900,82000,61100,'abc123',1,0,1,0,0,1);
insert into pr2hotel
values(1100, '대구리버틴호텔', '대구광역시 중구', 59000,55800,41000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1101, '울산중구라파즈무인텔', '울산광역시 중구', 66500,60500,49700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1102, '스타즈호텔울산', '울산광역시 남구', 35000,28200,10500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1103, '울산리버사이드호텔', '울산광역시 중구', 49100,45800,25100,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1104, '신라스테이울산', '울산광역시 남구', 40400,37900,19100,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1105, '롯데시티호텔울산', '울산광역시 남구', 385900,257000,187000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1106, '부산송정올라호텔', '부산광역시 해운대구', 380000,250000,180000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1107, '광안리호텔1', '부산광역시 수영구', 85900,57200,28700,'abc123',1,0,1,0,0,1);
insert into pr2hotel
values(1108, '호텔아쿠아펠리스', '부산광역시 수영구', 59800,23400,13700,'abc123',1,0,0,1,0,1);
insert into pr2hotel
values(1109, '마리안느호텔', '부산광역시 해운대구', 78900,65800,54200,'abc123',1,0,1,0,0,1);
insert into pr2hotel
values(1110, '르컬렉티브오시리아', '부산광역시 기장군', 44800,21000,15000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1111, '전주시그니처호텔', '전라북도 전주시', 28000,21000,11000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1112, '군산스테이관광호텔', '전라북도 군산시', 54000,45700,39900,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1113, '전주제이브라운', '전라북도 전주시', 31000,22700,11900,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1114, '호텔원변산', '전라북도 부안군', 72000,67000,55000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1115, '전주베스트인시티호텔', '전라북도 전주시', 98700,82100,77700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1116, '신라스테이여수', '전라남도 여수시', 51000,49500,35000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1117, '목포호텔아야나', '전라남도 목포시', 76000,70900,68000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1118, '베니키아호텔', '전라남도 여수시', 69900,61500,56700,'abc123',1,0,1,0,0,1);
insert into pr2hotel
values(1119, '순천호텔라움', '전라남도 순천시', 99000,88000,77000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1120, '호텔드몽드', '전라남도 담양군', 76500,65400,54300,'abc123',1,0,1,1,0,0);
insert into pr2hotel
values(1121, '광주어반라이프호텔', '광주광역시 서구', 59000,55800,41000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1122, '에이치원호텔', '광주광역시 북구', 108500,103000,92800,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1123, '라마다플라자충장호텔', '광주광역시 동구', 35000,28200,10500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1124, '광주워싱턴호텔', '광주광역시 동구', 54600,43900,38500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1125, '홀리데이인광주호텔', '광주광역시 서구', 84900,73600,52500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1126, '제주신라호텔', '제주특별자치도 서귀포시', 66500,60500,49700,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1127, '헤이서귀포', '제주특별자치도 서귀포시', 45000,23800,21000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1128, '글로스터호텔제주', '제주특별자치도 제주시', 108500,103000,92800,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1129, '에벤에셀호텔', '제주특별자치도 제주시', 58800,47300,41000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1130, '호텔윈스토리', '제주특별자치도 서귀포시', 84900,73600,52500,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1131, '씨크루즈호텔','강원도 속초시',199000,155000,110000,'abc123',1,1,1,1,0,1);
insert into pr2hotel
values(1132, '호텔 더 블루 테라','강원도 속초시',154000,132000,110000,'abc123',1,0,0,1,0,1);
insert into pr2hotel
values(1133, '라마다 속초 바이 윈덤','강원도 속초시',233000,200000,149900,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1134, '마리나베이 속초','강원도 속초시',120000,80000,49000,'abc123',1,1,1,1,0,1);
insert into pr2hotel
values(1135,'델피노','강원도 속초시',233300,219000,179000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1136, '보우힐 펜션','제주특별자치도 서귀포시',120000,80000,68000,'abc123',1,0,1,1,0,1);
insert into pr2hotel
values(1137, '골든튤립 인천공항','인천광역시 중구',249000,180000,100000,'abc123',1,1,1,1,1,1);
commit;

-- 임시테이블에 hotel_id 컬럼 추가
alter table pr2imsi add  hotel_id number(7);
alter table pr2imsi add constraint pr2imsi_hotel_id_fk foreign key(hotel_id)
references pr2hotel(hotel_id);

--pr2imsi에 데이터 입력
insert  into pr2imsi(hotel_id, room_imsi)
    select hotel_id, mod(hotel_id, 3)
    from pr2hotel;

-- 호텔 테이블에 room_imsi 컬럼 추가
alter table pr2hotel add room_imsi varchar2(10);

-- 호텔 테이블에 room imsi 입력
update pr2hotel h
set h.room_imsi=(
select i.room_imsi
from pr2imsi i
where h.hotel_id=i.hotel_id)
where exists(
select 1
from pr2imsi i
where h.hotel_id=i.hotel_id);

-- 시퀀스 생성
create sequence pr2reserv_sequencel;
create sequence pr2review_sequencel;

create sequence pr2hotel_sequence
START WITH 1200 -- 호텔 시퀀스 초기값 1200
INCREMENT BY 1;


-- 시퀀스 초기화
alter sequence pr2review_sequencel increment by -9999;
select pr2review_sequencel.nextval from dual;
alter sequence pr2review_sequencel increment by 1;
alter sequence pr2reserv_sequencel increment by -9999;
select pr2reserv_sequencel.nextval from dual;
alter sequence pr2reserv_sequencel increment by 1;

-- 예약 확인용 예약정보 삽입
insert into pr2reserv
values(pr2reserv_sequencel.nextval,503,1001,200000,'2023-06-23','2023-06-25', 'abc123');
commit;

-- 리뷰 확인용 초기 리뷰 삽입
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰타이틀1','def123','테스트용 리뷰내용입니다',4.6,1001);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰타이틀2','eft123','테스트용 리뷰입니다 123123',3.8,1001);
commit;

-- 데이터 삭제관련 cascade

ALTER TABLE PR2HOTEL
DROP CONSTRAINT PR2HOTEL_MEM_ID_FK;

ALTER TABLE PR2RESERV
DROP CONSTRAINT PR2RESERV_MEM_ID_FK;

ALTER TABLE PR2REVIEW
DROP CONSTRAINT PR2REVIEW_MEM_ID_FK;

ALTER TABLE PR2RESERV
DROP CONSTRAINT PR2RESERV_RESERV_ID_PK;

ALTER TABLE PR2HOTEL
ADD CONSTRAINT PR2HOTEL_MEM_ID_FK FOREIGN KEY (MEM_ID)
REFERENCES PR2MEMBER(MEM_ID)
ON DELETE CASCADE;

ALTER TABLE PR2RESERV
ADD CONSTRAINT PR2RESERV_MEM_ID_FK FOREIGN KEY (MEM_ID)
REFERENCES PR2MEMBER(MEM_ID)
ON DELETE CASCADE;

ALTER TABLE PR2REVIEW
ADD CONSTRAINT PR2REVIEW_MEM_ID_FK FOREIGN KEY (MEM_ID)
REFERENCES PR2MEMBER(MEM_ID)
ON DELETE CASCADE;

ALTER TABLE PR2RESERV
ADD CONSTRAINT PR2RESERV_HOTEL_ID_FK FOREIGN KEY (HOTEL_ID)
REFERENCES PR2HOTEL(HOTEL_ID)
ON DELETE CASCADE;

-- 사용자, 업주 추가

insert into pr2member values('user1', 1234, 'user1@gmail.com', '홍길동', '010-0000-0000', 0);
insert into pr2member values('user2', 1234, 'user1@gmail.com', '사용자', '010-0000-0000', 0);
insert into pr2member values('user3', 1234, 'user1@gmail.com', '이몽룡', '010-0000-0000', 0);
insert into pr2member values('user4', 1234, 'user1@gmail.com', '성춘향', '010-0000-0000', 0);
insert into pr2member values('user5', 1234, 'user1@gmail.com', '홍길순', '010-0000-0000', 0);
insert into pr2member values('user6', 1234, 'user1@gmail.com', '사용인', '010-0000-0000', 0);
insert into pr2member values('user7', 1234, 'user1@gmail.com', '강감찬', '010-0000-0000', 0);
insert into pr2member values('user8', 1234, 'user1@gmail.com', '권율', '010-0000-0000', 0);
insert into pr2member values('user9', 1234, 'user1@gmail.com', '이순신', '010-0000-0000', 0);
insert into pr2member values('user10', 1234, 'user1@gmail.com', '세종', '010-0000-0000', 0);

insert into pr2member values('upjoo1', 1234, 'upjoo1@gmail.com', '업주1', '010-0000-0000', 1);
insert into pr2member values('upjoo2', 1234, 'upjoo1@gmail.com', '업주2', '010-0000-0000', 1);
insert into pr2member values('upjoo3', 1234, 'upjoo1@gmail.com', '업주3', '010-0000-0000', 1);
insert into pr2member values('upjoo4', 1234, 'upjoo1@gmail.com', '업주4', '010-0000-0000', 1);
insert into pr2member values('upjoo5', 1234, 'upjoo1@gmail.com', '업주5', '010-0000-0000', 1);
insert into pr2member values('upjoo6', 1234, 'upjoo1@gmail.com', '업주6', '010-0000-0000', 1);
insert into pr2member values('upjoo7', 1234, 'upjoo1@gmail.com', '업주7', '010-0000-0000', 1);
insert into pr2member values('upjoo8', 1234, 'upjoo1@gmail.com', '업주8', '010-0000-0000', 1);
insert into pr2member values('upjoo9', 1234, 'upjoo1@gmail.com', '업주9', '010-0000-0000', 1);
insert into pr2member values('upjoo10', 1234, 'upjoo1@gmail.com', '업주10', '010-0000-0000', 1);

-- 리뷰 삽입
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰1','def123','테스트용 리뷰내용입니다',4.6,1001);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰2','eft123','테스트용 리뷰입니다',3.2,1002);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰3','def123','테스트용 리뷰내용입니다',4.3,1003);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰4','eft123','테스트용 리뷰입니다',3.8,1004);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰5','def123','테스트용 리뷰내용입니다',4.1,1005);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰6','eft123','테스트용 리뷰입니다',3.4,1006);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰7','eft123','테스트용 리뷰입니다',3.5,1007);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰8','eft123','테스트용 리뷰입니다',3.6,1008);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰9','eft123','테스트용 리뷰입니다',3.7,1009);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰10','eft123','테스트용 리뷰입니다',3.8,1010);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰11','def123','테스트용 리뷰내용입니다',4.6,1011);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰12','eft123','테스트용 리뷰입니다',3.2,1012);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰13','def123','테스트용 리뷰내용입니다',4.3,1013);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰14','eft123','테스트용 리뷰입니다',3.8,1014);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰15','def123','테스트용 리뷰내용입니다',4.1,1015);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰16','eft123','테스트용 리뷰입니다',3.4,1016);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰17','eft123','테스트용 리뷰입니다',3.5,1017);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰18','eft123','테스트용 리뷰입니다',3.6,1018);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰19','eft123','테스트용 리뷰입니다',3.7,1019);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰20','eft123','테스트용 리뷰입니다',3.8,1020);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰21','def123','테스트용 리뷰내용입니다',4.6,1021);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰22','eft123','테스트용 리뷰입니다',3.2,1022);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰23','def123','테스트용 리뷰내용입니다',4.3,1023);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰24','eft123','테스트용 리뷰입니다',3.8,1024);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰25','def123','테스트용 리뷰내용입니다',4.1,1025);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰26','eft123','테스트용 리뷰입니다',3.4,1026);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰27','eft123','테스트용 리뷰입니다',3.5,1027);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰28','eft123','테스트용 리뷰입니다',3.6,1028);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰29','eft123','테스트용 리뷰입니다',3.7,1029);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰30','eft123','테스트용 리뷰입니다',3.8,1030);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰31','def123','테스트용 리뷰내용입니다',4.6,1031);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰32','eft123','테스트용 리뷰입니다',3.2,1032);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰33','def123','테스트용 리뷰내용입니다',4.3,1033);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰34','eft123','테스트용 리뷰입니다',3.8,1034);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰35','def123','테스트용 리뷰내용입니다',4.1,1035);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰36','eft123','테스트용 리뷰입니다',3.4,1036);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰37','eft123','테스트용 리뷰입니다',3.5,1037);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰38','eft123','테스트용 리뷰입니다',3.6,1038);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰39','eft123','테스트용 리뷰입니다',3.7,1039);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰40','eft123','테스트용 리뷰입니다',3.8,1040);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰41','def123','테스트용 리뷰내용입니다',4.6,1041);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰42','eft123','테스트용 리뷰입니다',3.2,1032);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰43','def123','테스트용 리뷰내용입니다',4.3,1043);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰44','eft123','테스트용 리뷰입니다',3.8,1044);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰45','def123','테스트용 리뷰내용입니다',4.1,1045);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰46','eft123','테스트용 리뷰입니다',3.4,1046);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰47','eft123','테스트용 리뷰입니다',3.5,1047);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰48','eft123','테스트용 리뷰입니다',3.6,1048);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰49','eft123','테스트용 리뷰입니다',3.7,1049);
insert into pr2review
values(pr2review_sequencel.nextval,'리뷰50','eft123','테스트용 리뷰입니다',3.8,1050);