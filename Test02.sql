----- Câu 1 -----
create database QLHANG
go 
use QLHANG
go
create table VatTu
(
MaVT nvarchar(10) primary key,
TenVT nvarchar(20) not null,
DVTinh nvarchar(10) not null,
SLCon int
)
go
create table HDBan
(
MaHD nvarchar(10) primary key, 
NgayXuat smalldatetime,
HoTenKhach varchar(40) not null,
)
go
create table HangXuat
(
MaHD nvarchar(10) not null,
MaVT nvarchar(10) not null,
DonGia money,
SLBan int not null	
constraint pk_HangXuat primary key (MaHD, MaVT)
)
go
insert into VatTu values(N'VT01', N'Xi mang', 'VND', 200)
insert into VatTu values(N'VT02', N'Gach', 'VND', 5000)
insert into HDBan values(N'HD001', CAST(N'2022-9-10' as date), N'Pham Quang Huy')
insert into HDBan values(N'HD002', CAST(N'2022-5-25' as date), N'Tran Hong Hoang')
insert into HangXuat values(N'HD001', N'VT01', 150000, 50)
insert into HangXuat values(N'HD002', N'VT02', 5000, 1000)
insert into HangXuat values(N'HD003', N'VT01', 150000, 100)
insert into HangXuat values(N'HD004', N'VT02', 5000, 2000)

----- Câu 2 -----
select top 1 MaHD, sum(DonGia*SLBan) as TongTien from HangXuat group by MaHD, DonGia
order by DonGia desc

----- Câu 4 -----
create proc sp_cau4
	@thang int, @nam int
as
	select sum(SLBan*DonGia) from HangXuat a inner join HDBan b on a.MaHD = b.MaHD
	where MONTH(b.NgayXuat) = @thang and YEAR(b.NgayXuat) = @nam;
	select top 1 MaHD, sum(DonGia) as TongTien from HangXuat group by MaHD, DonGia 
	order by DonGia desc