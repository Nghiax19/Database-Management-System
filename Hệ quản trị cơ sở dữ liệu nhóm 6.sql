--KHAI BÁO
set serveroutput ON
-- TAO BANG 
--tao bang cua hang

create table cuahang
(macuahang varchar2(5)
constraint cuahang_pk primary key,
tencuahang nvarchar2(20),
sodienthoai number,
diachi nvarchar2(40));

--tao bang san pham

create table sanpham
(masanpham varchar2(5)
constraint sanpham_pk primary key,
tensanpham nvarchar2(20),
mausac nvarchar2(10) ,
donvitinh number,
dongia number);

--tao bang cua hang - san pham

create table cuahangsanpham
(masanpham varchar2(5),
macuahang varchar2(5),
soluong number,
constraint chsp_pk primary key (masanpham,macuahang),
constraint fk_cuahang foreign key(macuahang) references cuahang(macuahang),
constraint fk_sanpham foreign key(masanpham) references sanpham(masanpham));

--tao bang khuyen mai

create table khuyenmai
(makhuyenmai varchar2(5)
constraint khuyenmai_pk primary key,
tenkhuyenmai nvarchar2(20),
ngaybatdau date,
ngayketthuc date);

--tao bang san pham-khuyen mai

create table sanphamkhuyenmai
(makhuyenmai varchar2(5),
masanpham varchar2(5),
giamgia number,
thanhtien number,
constraint sanphamkhuyenmai_pk primary key (masanpham,makhuyenmai),
constraint fk_khuyenmai foreign key(makhuyenmai) references khuyenmai(makhuyenmai),
constraint fk_sp foreign key(masanpham) references sanpham(masanpham));

-- tao bang nhan vien

create table nhanvien
(manhanvien varchar2(5)
constraint nhanvien_pk primary key,
macuahang varchar2(5),
tennhanvien nvarchar2(30),
gioitinh nvarchar2(5) ,
ngaysinh date,
quequan nvarchar2(20),
sodienthoai number,
luong number,
constraint fk_cuh foreign key(macuahang) references cuahang(macuahang));

--tao bang nha cung cap

create table nhacungcap
(manhacungcap varchar2(5)
constraint nhacungcap_pk primary key,
tennhacungcap nvarchar2(30),
diachi nvarchar2(20),
sodienthoai number);

-- tao bang khach hang

create table khachhang
(makhachhang varchar2(5)
constraint khachhang_pk primary key,
tenkhachhang nvarchar2(30),
gioitinh nvarchar2(5) ,
ngaysinh date,
diachi nvarchar2(20),
sodienthoai number);

-- tao bang phieu nhap

create table phieunhap
(maphieu varchar2(5)
constraint phieunhap_pk primary key,
manhacungcap varchar2(5),
manhanvien varchar2(5),
macuahang varchar2(5),
ngaynhap date,
tongtien number,
constraint fk_ch foreign key(macuahang) references cuahang(macuahang),
constraint fk_ncc foreign key(manhacungcap) references nhacungcap(manhacungcap),
constraint fk_nv foreign key(manhanvien) references nhanvien(manhanvien));

-- tao bang chi tiet phieu nhap

create table chitietphieunhap
(maphieu varchar2(5),
masanpham varchar2(5),
soluongnhap number,
dongia number,
thanhtien number,
constraint chitietphieunhap_pk primary key (masanpham,maphieu),
constraint fk_pn foreign key(maphieu) references phieunhap(maphieu),
constraint fk_spham foreign key(masanpham) references sanpham(masanpham));

-- tao bang hoa don

create table hoadon
(mahoadon varchar2(5)
constraint hoadon_pk primary key,
manhanvien varchar2(5),
makhachhang varchar2(5),
ngaythanhtoan date,
hinhthucthanhtoan nvarchar2(30),
tongtien number,
constraint fk_khachhang foreign key(makhachhang) references khachhang(makhachhang),
constraint fk_nhanvien foreign key(manhanvien) references nhanvien(manhanvien));

-- tao bang chi tiet hoa don 

create table chitiethoadon
(mahoadon varchar2(5),
masanpham varchar2(5),
soluong number,
dongia number,
thanhtien number,
constraint chitiethd_pk primary key (masanpham,mahoadon),
constraint fk_hoadon foreign key(mahoadon) references hoadon(mahoadon),
constraint fk_sapham foreign key(masanpham) references sanpham(masanpham));

--THEM DU LIEU

-- bang cua hang

insert into cuahang(macuahang,tencuahang,sodienthoai,diachi) values ('ch01','cua hang 1',0123456789,'Ha Noi');
insert into cuahang(macuahang,tencuahang,sodienthoai,diachi) values ('ch02','cua hang 2',0987654321,'Nam Dinh');
insert into cuahang(macuahang,tencuahang,sodienthoai,diachi) values ('ch03','cua hang 3',0888888888,'Sai Gon');

--bang san pham

insert into sanpham(masanpham,tensanpham,mausac,donvitinh,dongia) values ('sp01','máy bay','?en',1,100000);
insert into sanpham(masanpham,tensanpham,mausac,donvitinh,dongia) values ('sp02','ô tô','??',1,200000);
insert into sanpham(masanpham,tensanpham,mausac,donvitinh,dongia) values ('sp03','siêu nhân','vàng',1,300000);
insert into sanpham(masanpham,tensanpham,mausac,donvitinh,dongia) values ('sp04','tàu h?a','?en',1,150000);
insert into sanpham(masanpham,tensanpham,mausac,donvitinh,dongia) values ('sp05','búp bê','h?ng',1,500000);
insert into sanpham(masanpham,tensanpham,mausac,donvitinh,dongia) values ('sp06','lego','xanh',1,1000000);

--bang cua hang - san pham

insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp01','ch01',1000);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp01','ch02',2000);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp01','ch03',900);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp02','ch01',1000);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp02','ch02',1200);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp02','ch03',1300);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp03','ch01',100);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp03','ch02',0);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp03','ch03',700);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp04','ch01',100);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp04','ch02',2500);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp04','ch03',4000);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp05','ch01',2000);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp05','ch02',0);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp05','ch03',1500);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp06','ch01',800);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp06','ch02',1000);
insert into cuahangsanpham(masanpham,macuahang,soluong) values ('sp06','ch03',600);

-- bang khuyen mai

insert into khuyenmai(makhuyenmai,tenkhuyenmai,ngaybatdau,ngayketthuc) values ('km01','bé vui mình vui',to_date('15/10/2023','dd/mm/yyyy'),to_date('15/01/2024','dd/mm/yyyy'));
insert into khuyenmai(makhuyenmai,tenkhuyenmai,ngaybatdau,ngayketthuc) values ('km02','v?a h?c v?a ch?i',to_date('10/08/2023','dd/mm/yyyy'),to_date('10/12/2023','dd/mm/yyyy'));

-- bang san pham-khuyen mai

insert into sanphamkhuyenmai(makhuyenmai,masanpham,giamgia,thanhtien) values ('km01','sp01',0.1,90000);
insert into sanphamkhuyenmai(makhuyenmai,masanpham,giamgia,thanhtien) values ('km01','sp03',0.2,240000);
insert into sanphamkhuyenmai(makhuyenmai,masanpham,giamgia,thanhtien) values ('km01','sp05',0.1,450000);
insert into sanphamkhuyenmai(makhuyenmai,masanpham,giamgia,thanhtien) values ('km02','sp02',0.5,100000);
insert into sanphamkhuyenmai(makhuyenmai,masanpham,giamgia,thanhtien) values ('km02','sp04',0.1,135000);

-- bang nhan vien

insert into nhanvien(manhanvien,macuahang,tennhanvien,gioitinh,ngaysinh,quequan,sodienthoai,luong) values ('nv01','ch01','Nguyen Thi Kim','Nu',to_date('19/02/1998','dd/mm/yyyy'),'Bac Ninh',0111111111,1000000);
insert into nhanvien(manhanvien,macuahang,tennhanvien,gioitinh,ngaysinh,quequan,sodienthoai,luong) values ('nv02','ch01','Nguyen Thi Hoa','Nu',to_date('01/07/1996','dd/mm/yyyy'),'Ha Noi',0222222222,1000000);
insert into nhanvien(manhanvien,macuahang,tennhanvien,gioitinh,ngaysinh,quequan,sodienthoai,luong) values ('nv03','ch02','Nguyen Van Long','Nam',to_date('09/03/2000','dd/mm/yyyy'),'Nam Dinh',033333333,1000000);
insert into nhanvien(manhanvien,macuahang,tennhanvien,gioitinh,ngaysinh,quequan,sodienthoai,luong) values ('nv04','ch02','Nguyen Thi Mai','Nu',to_date('19/02/1997','dd/mm/yyyy'),'Thai Binh',0444444444,1000000);
insert into nhanvien(manhanvien,macuahang,tennhanvien,gioitinh,ngaysinh,quequan,sodienthoai,luong) values ('nv05','ch03','Nguyen Duc Luong','Nam',to_date('10/04/2001','dd/mm/yyyy'),'Dong Nai',055555555,1100000);
insert into nhanvien(manhanvien,macuahang,tennhanvien,gioitinh,ngaysinh,quequan,sodienthoai,luong) values ('nv06','ch03','Nguyen Thi Ngan','Nu',to_date('09/05/1998','dd/mm/yyyy'),'Sai Gon',0111111112,1100000);

-- bang nha cung cap

insert into nhacungcap(manhacungcap,tennhacungcap,diachi,sodienthoai) values ('ncc01','cung cap 1','Vinh Phuc',0888888888);
insert into nhacungcap(manhacungcap,tennhacungcap,diachi,sodienthoai) values ('ncc02','cung cap 2','Dong Nai',099999999);

-- bang khach hang

insert into khachhang(makhachhang,tenkhachhang,gioitinh,ngaysinh,diachi,sodienthoai) values ('kh01','Nguyen Trong Nghia','Nam',to_date('25/04/2003','dd/mm/yyyy'),'Nam Dinh',0328680646);
insert into khachhang(makhachhang,tenkhachhang,gioitinh,ngaysinh,diachi,sodienthoai) values ('kh02','Nguyen Thi Nguyet','Nu',to_date('01/02/2000','dd/mm/yyyy'),'Ha Noi',0432432432);
insert into khachhang(makhachhang,tenkhachhang,gioitinh,ngaysinh,diachi,sodienthoai) values ('kh03','Nguyen Trong Binh','Nam',to_date('11/11/2004','dd/mm/yyyy'),'Nam Dinh',0789789789);
insert into khachhang(makhachhang,tenkhachhang,gioitinh,ngaysinh,diachi,sodienthoai) values ('kh04','Nguyen Thi Huong','Nu',to_date('21/11/2001','dd/mm/yyyy'),'Thai Nguyen',0987987987);
insert into khachhang(makhachhang,tenkhachhang,gioitinh,ngaysinh,diachi,sodienthoai) values ('kh05','Nguyen Hai Long','Nam',to_date('25/08/2003','dd/mm/yyyy'),'Hai Duong',0321321321);

-- bang phieu nhap

insert into phieunhap(maphieu,manhacungcap,manhanvien,macuahang,ngaynhap,tongtien) values ('pn01','ncc01','nv04','ch02',to_date('20/04/2023','dd/mm/yyyy'),100000000);
insert into phieunhap(maphieu,manhacungcap,manhanvien,macuahang,ngaynhap,tongtien) values ('pn02','ncc01','nv01','ch01',to_date('25/04/2023','dd/mm/yyyy'),80000000);
insert into phieunhap(maphieu,manhacungcap,manhanvien,macuahang,ngaynhap,tongtien) values ('pn03','ncc01','nv02','ch01',to_date('30/04/2023','dd/mm/yyyy'),30000000);
insert into phieunhap(maphieu,manhacungcap,manhanvien,macuahang,ngaynhap,tongtien) values ('pn04','ncc02','nv05','ch03',to_date('21/04/2023','dd/mm/yyyy'),100000000);

-- bang chi tiet phieu nhap

insert into chitietphieunhap(maphieu,masanpham,soluongnhap,dongia,thanhtien) values ('pn01','sp01',80,50000,4000000);
insert into chitietphieunhap(maphieu,masanpham,soluongnhap,dongia,thanhtien) values ('pn01','sp02',100,100000,10000000);
insert into chitietphieunhap(maphieu,masanpham,soluongnhap,dongia,thanhtien) values ('pn01','sp06',100,800000,80000000);
insert into chitietphieunhap(maphieu,masanpham,soluongnhap,dongia,thanhtien) values ('pn01','sp04',60,100000,6000000);
insert into chitietphieunhap(maphieu,masanpham,soluongnhap,dongia,thanhtien) values ('pn02','sp01',200,50000,10000000);
insert into chitietphieunhap(maphieu,masanpham,soluongnhap,dongia,thanhtien) values ('pn02','sp03',200,250000,50000000);
insert into chitietphieunhap(maphieu,masanpham,soluongnhap,dongia,thanhtien) values ('pn02','sp05',50,400000,20000000);
insert into chitietphieunhap(maphieu,masanpham,soluongnhap,dongia,thanhtien) values ('pn03','sp02',200,150000,30000000);
insert into chitietphieunhap(maphieu,masanpham,soluongnhap,dongia,thanhtien) values ('pn04','sp01',80,50000,4000000);
insert into chitietphieunhap(maphieu,masanpham,soluongnhap,dongia,thanhtien) values ('pn04','sp02',100,100000,10000000);
insert into chitietphieunhap(maphieu,masanpham,soluongnhap,dongia,thanhtien) values ('pn04','sp06',100,800000,80000000);
insert into chitietphieunhap(maphieu,masanpham,soluongnhap,dongia,thanhtien) values ('pn04','sp04',60,100000,6000000);

-- bang hoa don 

insert into hoadon(mahoadon,manhanvien,makhachhang,ngaythanhtoan,hinhthucthanhtoan,tongtien) values ('hd01','nv01','kh01',to_date('20/05/2023','dd/mm/yyyy'),'tien mat',3000000);
insert into hoadon(mahoadon,manhanvien,makhachhang,ngaythanhtoan,hinhthucthanhtoan,tongtien) values ('hd02','nv03','kh03',to_date('20/06/2023','dd/mm/yyyy'),'tien mat',2000000);
insert into hoadon(mahoadon,manhanvien,makhachhang,ngaythanhtoan,hinhthucthanhtoan,tongtien) values ('hd03','nv05','kh04',to_date('28/06/2023','dd/mm/yyyy'),'chuyen khoan',1000000);
insert into hoadon(mahoadon,manhanvien,makhachhang,ngaythanhtoan,hinhthucthanhtoan,tongtien) values ('hd04','nv06','kh05',to_date('21/08/2023','dd/mm/yyyy'),'tien mat',4000000);
insert into hoadon(mahoadon,manhanvien,makhachhang,ngaythanhtoan,hinhthucthanhtoan,tongtien) values ('hd05','nv02','kh02',to_date('20/10/2023','dd/mm/yyyy'),'chuyen khoan',1000000);
insert into hoadon(mahoadon,manhanvien,makhachhang,ngaythanhtoan,hinhthucthanhtoan,tongtien) values ('hd06','nv01','kh01',to_date('04/11/2023','dd/mm/yyyy'),'tien mat',8000000);

-- bang chi tiet hoa don

insert into chitiethoadon(mahoadon,masanpham,soluong,dongia,thanhtien) values ('hd01','sp01',3,100000,300000);
insert into chitiethoadon(mahoadon,masanpham,soluong,dongia,thanhtien) values ('hd01','sp06',2,1000000,2000000);
insert into chitiethoadon(mahoadon,masanpham,soluong,dongia,thanhtien) values ('hd01','sp05',1,500000,500000);
insert into chitiethoadon(mahoadon,masanpham,soluong,dongia,thanhtien) values ('hd01','sp02',1,200000,200000);
insert into chitiethoadon(mahoadon,masanpham,soluong,dongia,thanhtien) values ('hd02','sp06',2,1000000,2000000);
insert into chitiethoadon(mahoadon,masanpham,soluong,dongia,thanhtien) values ('hd03','sp06',1,1000000,1000000);
insert into chitiethoadon(mahoadon,masanpham,soluong,dongia,thanhtien) values ('hd04','sp01',10,100000,1000000);
insert into chitiethoadon(mahoadon,masanpham,soluong,dongia,thanhtien) values ('hd04','sp04',20,135000,2700000);
insert into chitiethoadon(mahoadon,masanpham,soluong,dongia,thanhtien) values ('hd04','sp03',1,300000,300000);
insert into chitiethoadon(mahoadon,masanpham,soluong,dongia,thanhtien) values ('hd05','sp06',1,1000000,1000000);
insert into chitiethoadon(mahoadon,masanpham,soluong,dongia,thanhtien) values ('hd06','sp06',4,1000000,4000000);
insert into chitiethoadon(mahoadon,masanpham,soluong,dongia,thanhtien) values ('hd06','sp05',8,450000,3600000);
insert into chitiethoadon(mahoadon,masanpham,soluong,dongia,thanhtien) values ('hd06','sp02',4,100000,400000);

--NGHIEP VU TRUY VAN

-- TRUY VAN SQL

--1 Lay thong tin san pham va so luong ton kho cua tung cua hang

SELECT cs.macuahang, cs.tencuahang, sp.masanpham, sp.tensanpham, csp.soluong AS soluongtonkho
FROM cuahangsanpham csp
JOIN cuahang cs ON csp.macuahang = cs.macuahang
JOIN sanpham sp ON csp.masanpham = sp.masanpham;

--2 Lay danh sach cac san pham dang duoc khuyen mai

SELECT skm.makhuyenmai, km.tenkhuyenmai, sp.masanpham, sp.tensanpham, skm.giamgia
FROM sanphamkhuyenmai skm
JOIN khuyenmai km ON skm.makhuyenmai = km.makhuyenmai
JOIN sanpham sp ON skm.masanpham = sp.masanpham;

--3 Lay danh sach san pham va so luong da ban cua moi san pham

SELECT s.masanpham, s.tensanpham, SUM(h.soluong) AS tongban
FROM sanpham s
LEFT JOIN chitiethoadon h ON s.masanpham = h.masanpham
GROUP BY s.masanpham, s.tensanpham;

--4 Lay tong doanh so ban hang cua moi san pham va sap xep theo thu tu giam dan

SELECT s.masanpham, s.tensanpham, SUM(h.soluong * h.dongia) AS tongtien
FROM sanpham s
LEFT JOIN chitiethoadon h ON s.masanpham = h.masanpham
GROUP BY s.masanpham, s.tensanpham
ORDER BY tongtien DESC;

--5 Lay thong tin chi tiet ve phieu nhap va so luong da nhap cua phieu nhap co ma 'pn01'

SELECT p.maphieu, pc.masanpham, pc.soluongnhap, p.ngaynhap
FROM phieunhap p
JOIN chitietphieunhap pc ON p.maphieu = pc.maphieu
WHERE pc.maphieu = 'pn01';

--6 Lay thong tin khach hang tiem nang ( tong tien >2000000 vnd)

select k.makhachhang,k.tenkhachhang, sum(h.tongtien) as Tongtien
from khachhang k join hoadon h
on k.makhachhang=h.makhachhang
group by k.makhachhang,k.tenkhachhang
having sum(h.tongtien) >2000000;

--7 Cho biet nhung san pham duoc khuyen mai trong thang 10

select spkm.masanpham from sanphamkhuyenmai spkm join khuyenmai km on spkm.makhuyenmai=km.makhuyenmai
where ngaybatdau< '01/10/2023' and ngayketthuc >'31/10/2023';

--TRUY V?N PL/SQL

--1 Doanh thu cua 1 san pham

accept ma_san_pham prompt 'Nhap ma san pham '
declare
ma_san_pham sanpham.masanpham%type;
doanh_thu chitiethoadon.thanhtien%type;
begin
ma_san_pham := '&ma_san_pham';
select sum(thanhtien)
into doanh_thu
from chitiethoadon
where masanpham=ma_san_pham;
dbms_output.put_line    ('Doanh thu cua san pham la '||doanh_thu);
end;

--2 cho biet thong tin nhan vien cua hang khi nhap vao ma cua hang

accept mch prompt 'Nhap ma cua hang '
declare
mch cuahang.macuahang%type;
tnv nhanvien.tennhanvien%type;
mnv nhanvien.manhanvien%type;
gt nhanvien.gioitinh%type;
ns nhanvien.ngaysinh%type;
qq nhanvien.quequan%type;
sdt nhanvien.sodienthoai%type;
l nhanvien.luong%type;
begin
mch := '&mch';
for k in(select manhanvien,tennhanvien,gioitinh,ngaysinh,quequan,sodienthoai,luong
         from nhanvien
         where macuahang=mch)
loop
    mnv := k.manhanvien;
    tnv := k.tennhanvien;
    gt := k.gioitinh;
    ns := k.ngaysinh;
    qq := k.quequan;
    sdt := k.sodienthoai;
    l := k.luong;
dbms_output.put_line    ('ma nhan vien: '||mnv||' ten nhan vien: '||tnv||' gioi tinh: '||gt||' ngay sinh: '||ns||' que quan: '||qq||' so dien thoai: '||sdt||' luong: '||l);
end loop;
end;

--3 lay thong tin cua hoa don ma nhan vien da tao sau khi nhap ma nhan vien cua nhan vien do

accept mnv prompt 'Nhap ma nhan vien '
declare
mhd hoadon.mahoadon%type;
mnv nhanvien.manhanvien%type;
ntt hoadon.ngaythanhtoan%type;
httt hoadon.hinhthucthanhtoan%type;
tt hoadon.tongtien%type;
begin
mnv := '&mnv';
for k in(select mahoadon,ngaythanhtoan,hinhthucthanhtoan,tongtien
         from hoadon
         where manhanvien=mnv)
loop
    mhd := k.mahoadon;
    ntt := k.ngaythanhtoan;
    httt := k.hinhthucthanhtoan;
    tt := k.tongtien;
dbms_output.put_line    ('ma hoa don: '||mhd||' ngay thanh toan: '||ntt||' hinh thuc thanh toan: '||httt||' tong tien: '||tt);
end loop;
end;

--4 nhap vao mot moc thoi gian va cho biet vao thoi diem do co nhung khuyen mai nao

accept mtg prompt 'Nhap thoi gian '
declare
mtg date;
mkm khuyenmai.makhuyenmai%type;
tkm khuyenmai.tenkhuyenmai%type;
nbd khuyenmai.ngaybatdau%type;
nkt khuyenmai.ngayketthuc%type;
begin
mtg := '&mtg';
for k in(select makhuyenmai,tenkhuyenmai,ngaybatdau,ngayketthuc
         from khuyenmai
         where mtg > ngaybatdau and mtg < ngayketthuc)
loop
    mkm := k.makhuyenmai;
    tkm := k.tenkhuyenmai;
    nbd := k.ngaybatdau;
    nkt := k.ngayketthuc;
dbms_output.put_line    ('ma khuyen mai: '||mkm||' ten khuyen mai: '||tkm||' ngaybatdau: '||nbd||' ngayketthuc: '||nkt);
end loop;
end;


--5 Lay danh sach hoa don duoc thanh toan bang tien mat va tong gia tri cua tung hoa don

DECLARE
    v_mahoadon hoadon.mahoadon%TYPE;
    v_ngaythanhtoan hoadon.ngaythanhtoan%TYPE;
    v_tongtien hoadon.tongtien%TYPE;
BEGIN
    FOR rec IN (SELECT mahoadon, ngaythanhtoan, tongtien
                FROM hoadon
                WHERE hinhthucthanhtoan = 'tien mat')
    LOOP
        v_mahoadon := rec.mahoadon;
        v_ngaythanhtoan := rec.ngaythanhtoan;
        v_tongtien := rec.tongtien;
        
        DBMS_OUTPUT.PUT_LINE('Invoice ID: ' || v_mahoadon || ', Payment Date: ' || v_ngaythanhtoan || ', Total Amount: ' || v_tongtien);
    END LOOP;
END;

--6 Lay thong tin khach hang va so luong hoa don da tao ra

DECLARE
    v_makhachhang khachhang.makhachhang%TYPE;
    v_tenkhachhang khachhang.tenkhachhang%TYPE;
    v_tonghoadon NUMBER;
BEGIN
    FOR rec IN (SELECT kh.makhachhang, kh.tenkhachhang, COUNT(hd.mahoadon) AS tonghoadon
                FROM khachhang kh
                LEFT JOIN hoadon hd ON kh.makhachhang = hd.makhachhang
                GROUP BY kh.makhachhang, kh.tenkhachhang)
    LOOP
        v_makhachhang := rec.makhachhang;
        v_tenkhachhang := rec.tenkhachhang;
        v_tonghoadon := rec.tonghoadon;
        
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_makhachhang || ', Customer Name: ' || v_tenkhachhang || ', Total Invoices: ' || v_tonghoadon);
    END LOOP;
END;

--7 Lay thong tin nha cung cap va tong so luong san pham da nhap

DECLARE
    v_manhacungcap nhacungcap.manhacungcap%TYPE;
    v_tennhacungcap nhacungcap.tennhacungcap%TYPE;
    v_tong_soluong_nhap NUMBER;
BEGIN
    FOR rec IN (SELECT ncc.manhacungcap, ncc.tennhacungcap, SUM(ct.soluongnhap) AS tong_soluong_nhap
                FROM nhacungcap ncc
                LEFT JOIN phieunhap pn ON ncc.manhacungcap = pn.manhacungcap
                LEFT JOIN chitietphieunhap ct ON pn.maphieu = ct.maphieu
                GROUP BY ncc.manhacungcap, ncc.tennhacungcap)
    LOOP
        v_manhacungcap := rec.manhacungcap;
        v_tennhacungcap := rec.tennhacungcap;
        v_tong_soluong_nhap := rec.tong_soluong_nhap;
        
        DBMS_OUTPUT.PUT_LINE('Supplier ID: ' || v_manhacungcap || ', Supplier Name: ' || v_tennhacungcap || ', Total Quantity Imported: ' || v_tong_soluong_nhap);
    END LOOP;
END;

 --8 Lay thong tin ve cac san pham co trong mot cua hang 
 
 DECLARE
    v_cuahang_code cuahang.macuahang%TYPE;
BEGIN
    v_cuahang_code := '&v_cuahang_code';
    FOR rec IN (SELECT sp.tensanpham, sp.mausac, sp.donvitinh, sp.dongia, chsp.soluong
                FROM sanpham sp
                JOIN cuahangsanpham chsp ON sp.masanpham = chsp.masanpham
                WHERE chsp.macuahang = v_cuahang_code) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Ten san pham: ' || rec.tensanpham || ', Mau sac: ' || rec.mausac || ', Ðon vi tinh: ' || rec.donvitinh || ', Gia: ' || rec.dongia || ', So luong: ' || rec.soluong);
    END LOOP;
END;

--9 Tính tong doanh thu cho mot chuong trinh khuyen mai cu the.

DECLARE
    v_makhuyenmai sanphamkhuyenmai.makhuyenmai%TYPE;
    v_tong_doanhthu NUMBER := 0;
BEGIN
    v_makhuyenmai :='&v_makhuyenmai';
    FOR rec IN (SELECT spkm.giamgia, spkm.thanhtien
                FROM sanphamkhuyenmai spkm
                WHERE spkm.makhuyenmai = v_makhuyenmai) 
    LOOP
        v_tong_doanhthu := v_tong_doanhthu + rec.thanhtien;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Tong Doanh thu cho Chuong trinh ' || v_makhuyenmai || ': ' || v_tong_doanhthu);
END;

-- TAO VA GAN QUYEN CHO USER

-- tao user chu doanh nghiep
create user chudoanhnghiep
identified by 1234
quota 100m on users;
-- quyen thay doi thông tin user
grant alter user to chudoanhnghiep;
-- cap quyen cho phép truy cap vào csdl và chu doanh nghiep có the cap cho user khác
grant create session to chudoanhnghiep with admin option;
-- tao nhom quyen doi tuong
create role nhom_quyen_doi_tuong;
grant create table to nhom_quyen_doi_tuong;
grant create view to nhom_quyen_doi_tuong;
grant create procedure to nhom_quyen_doi_tuong;
grant create sequence to nhom_quyen_doi_tuong;
-- cap nhóm quyen doi tuong cho user chu doanh nghiep
grant nhom_quyen_doi_tuong to chudoanhnghiep;
--cap quyen DBA cho user
grant dba to nhom_quyen_doi_tuong;


-- t?o user nhóm qu?n tr?
CREATE USER NHOMQUANTRI IDENTIFIED BY 1234  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";
-- QUOTAS
ALTER USER NHOMQUANTRI QUOTA UNLIMITED ON "USERS";
-- ROLES
GRANT "DBA" TO NHOMQUANTRI ;
ALTER USER NHOMQUANTRI DEFAULT ROLE "DBA";


-- t?o user nhân viên bán hàng
CREATE USER nhanvienbanhang IDENTIFIED BY 1234
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";
-- QUOTAS
ALTER USER nhanvienbanhang QUOTA UNLIMITED ON "USERS";
-- C?p quy?n cho user
GRANT SELECT, ALTER, UPDATE ON sanpham TO nhanvienbanhang;
GRANT SELECT, ALTER, UPDATE ON khuyenmai TO nhanvienbanhang;
GRANT SELECT, ALTER, UPDATE ON sanphamkhuyenmai TO nhanvienbanhang;
GRANT SELECT, ALTER, UPDATE ON khachhang TO nhanvienbanhang;
GRANT SELECT, ALTER, UPDATE ON hoadon TO nhanvienbanhang;
GRANT SELECT, ALTER, UPDATE ON chitiethoadon TO nhanvienbanhang;

