use thiet_ke_csdl_1;
create table Phieu_Xuat(
	So_PX int auto_increment primary key,
    Ngay_Xuat date
);

create table Vat_Tu(
	Ma_VTU varchar(20) primary key,
    Ten_VTU varchar(50) not null
);

create table Chi_Tiet_Phieu_Xuat(
	DG_Xuat varchar(25) not null,
    SL_Xuat int not null, 
    So_PX int,
    Ma_VTU varchar(20),
    primary key (So_PX, Ma_VTU),
	constraint FK_CTPX_So_PX foreign key (So_PX) references Phieu_Xuat(So_PX),
	constraint FK_CTPX_Ma_VTU foreign key (Ma_VTU) references Vat_Tu(Ma_VTU)
);

create table Phieu_Nhap(
	So_PN int auto_increment primary key,
    Ngay_Nhap date
);

create table Chi_Tiet_Phieu_Nhap(
	DG_Nhap varchar(25) not null,
    SL_Nhap int not null,
    Ma_VTU varchar(20),
    So_PN int,
    primary key (Ma_VTU, So_PN),
	constraint FK_CTPN_Ma_VTU foreign key (Ma_VTU) references Vat_Tu(Ma_VTU),
	constraint FK_CTPX_So_PN foreign key (So_PN) references Phieu_Nhap(So_PN)
);

create table Don_DH(
	So_DH int auto_increment primary key, 
    Ngay_DH date
);

create table Chi_Tiet_Don_DH(
	Ma_VTU varchar(20),
    So_DH int,
    primary key (Ma_VTU, So_DH),
    constraint FK_CTDDH_Ma_VTU foreign key (Ma_VTU) references Vat_Tu(Ma_VTU),
    constraint FK_CTDDH_So_DH foreign key (So_DH) references Don_DH(So_DH)
);

create table Nha_CC(
	Ma_NCC varchar(20) not null primary key,
    Ten_NCC varchar(50) not null,
    Dia_Chi varchar(50),
    SDT varchar(10)
);

create table Cung_Cap(
	Ma_NCC varchar(20),
	constraint FK_CC_Ma_NCC foreign key (Ma_NCC) references Nha_CC(Ma_NCC)
);