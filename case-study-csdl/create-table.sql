create database case_study;
use case_study;
create table Vi_Tri(
	Ma_VT int auto_increment primary key,
    Ten_VT varchar(45)
);

create table Trinh_Do(
	Ma_TD int auto_increment primary key,
    Ten_TD varchar(45)
);

create table Bo_Phan(
	Ma_BP int auto_increment primary key, 
    Ten_BP varchar(45)
);

create table Nhan_Vien(
	Ma_NV int auto_increment primary key,
    Ho_Ten varchar(45) not null,
    Ngay_Sinh date not null,
    So_CMND varchar(45) not null,
    Luong double not null,
    So_Dien_Thoai varchar(45) not null,
    Email varchar(45),
    Dia_Chi varchar(45),
    Ma_VT int,
    Ma_TD int,
    Ma_BP int,
    constraint FK_NV_Ma_VT foreign key (Ma_VT) references Vi_Tri(Ma_VT),
	constraint FK_NV_Ma_TD foreign key (Ma_TD) references Trinh_Do(Ma_TD),
	constraint FK_NV_Ma_BP foreign key (Ma_BP) references Bo_Phan(Ma_BP)
);

create table Loai_Khach(
	Ma_LK int auto_increment primary key, 
    Ten_LK varchar(45)
);

create table Khach_Hang(
	Ma_KH int auto_increment primary key,
	Ho_Ten varchar(45) not null,
    Ngay_Sinh date not null,
    Gioi_Tinh bit(1) not null,
    So_CMND varchar(45) not null,
    So_Dien_Thoai varchar(45) not null,
    Email varchar(45),
    Dia_Chi varchar(45),
    Ma_LK int,
    constraint FK_KH_Ma_LK foreign key (Ma_LK) references Loai_Khach(Ma_LK)
);

create table Loai_Dich_Vu(
	Ma_LDV int auto_increment primary key,
    Ten_LDV varchar(45)
);

create table Kieu_Thue(
	Ma_KT int auto_increment primary key,
    Ten_KT varchar(45)
);

create table Dich_Vu(
	Ma_DV int auto_increment primary key,
    Ten_DV varchar(45) not null, 
    Dien_Tich int,
    Chi_Phi_Thue double not null,
    So_Nguoi_Toi_Da int,
    Tieu_Chuan_Phong varchar(45),
    Mo_Ta_Tien_Nghi_Khac varchar(45),
    Dien_Tich_Ho_Boi double,
    So_Tang int,
    Ma_KT int,
    Ma_LDV int,
    constraint FK_DV_Ma_KT foreign key (Ma_KT) references Kieu_Thue(Ma_KT),
	constraint FK_DV_Ma_LDV foreign key (Ma_LDV) references Loai_Dich_Vu(Ma_LDV)
);

create table Dich_Vu_Di_Kem(
	Ma_DVDK int auto_increment primary key,
    Ten_DVDK varchar(45),
    Gia double,
    Don_Vi varchar(10),
    Trang_Thai varchar(45)
);

create table Hop_Dong(
	Ma_HD int auto_increment primary key,
    Ngay_Lam_HD datetime,
    Ngay_Ket_Thuc datetime,
    Tien_Dat_Coc double,
    Ma_NV int,
    Ma_KH int,
    Ma_DV int,
    constraint FK_HD_Ma_NV foreign key (Ma_NV) references Nhan_Vien(Ma_NV),
    constraint FK_HD_Ma_KH foreign key (Ma_KH) references Khach_Hang(Ma_KH),
    constraint FK_HD_Ma_DV foreign key (Ma_DV) references Dich_Vu(Ma_DV)
);

create table Hop_Dong_Chi_Tiet(
	Ma_HDCT int auto_increment primary key,
	So_Luong int,
    Ma_HD int,
    Ma_DVDK int,
    constraint FK_HDCT_Ma_HD foreign key (Ma_HD) references Hop_Dong(Ma_HD),
    constraint FK_HDCT_Ma_DVDK foreign key (Ma_DVDK) references Dich_Vu_Di_Kem(Ma_DVDK)
);