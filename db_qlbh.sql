create database QLBH
go
use QLBH
go

create table NhanVien
(
	MaNV char(10) primary key,
	HoTen nvarchar(50),
	NgaySinh date,
	GioiTinh nchar(3) check(GioiTinh in ('Nam', N'Nữ')),	
	DiaChi nvarchar(50),
	Email varchar(50),
	SDT varchar(16),
	CapDo int
)
create table TaiKhoan
(
	TenTK varchar(50) primary key,
	MatKhau varchar(50),
	MaNV char(10) not null references NhanVien(MaNV)
)
create table NhaCungCap
(
	MaNCC char(10) primary key,
	TenNCC nvarchar(50),
	DiaChi nvarchar(50),
	SDT varchar(16)
)

create table LoaiHangHoa
(
	MaLHH char(10) primary key,
	TenLHH nvarchar(50)
)

create table HangHoa
(
	MaHH int primary key,
	TenHH nvarchar(50),
	MaLHH char(10) not null references LoaiHangHoa(MaLHH),
	ThongTinSP nvarchar(max),
	SoLuong int,
	GiaNhap int,
	GiaBan int
)

create table KhachHang
(
	MaKH int identity primary key,
	TenKH nvarchar(50),
	DiaChi nvarchar(50),
	SDT varchar(16)
)

create table HoaDonNhap
(
	MaHDN int primary key,
	MaNV char(10) not null references NhanVien(MaNV),
	MaNCC char(10) not null references NhaCungCap(MaNCC),
	NgayNhap datetime,
	TongTien int
)
create table ChiTietNhap
(
	MaHDN int not null references HoaDonNhap(MaHDN),
	MaHH int not null references HangHoa(MaHH),
	SoLuong int,
	DonGia int,
	ThanhTien int,
	primary key (MaHDN, MaHH)

)

create table HoaDonBan
(
	MaHDB int identity primary key,
	MaNV char(10) not null references NhanVien(MaNV),
	MaKH int not null references KhachHang(MaKH),
	NgayBan datetime,
	TongTien int
)


create table ChiTietBan
(
	MaHDB int not null references HoaDonBan(MaHDB),
	MaHH int not null references HangHoa(MaHH),
	SoLuong int,
	DonGia int,
	ThanhTien int,
	primary key (MaHDB, MaHH)
)