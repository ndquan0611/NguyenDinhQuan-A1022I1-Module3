-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
-- một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select Ho_Ten from Nhan_Vien 
where Ho_Ten like 'H%' or Ho_Ten like 'T%' or Ho_Ten like 'K%' 
and char_length(Ho_Ten) <= 15;

-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
-- có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from Khach_Hang 
where (round(datediff(curdate(), Ngay_Sinh) / 365, 0) between 18 and 50)
and Dia_Chi like '%Đà Nẵng' or Dia_Chi like '%Quảng Trị';

-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select KH.Ma_KH, KH.Ho_Ten, LK.Ten_LK ,count(KH.Ma_KH) So_Lan from Khach_Hang KH
inner join Loai_Khach LK on KH.Ma_LK = LK.Ma_LK 
inner join Hop_Dong HD on HD.Ma_KH = KH.Ma_KH
inner join Dich_Vu DV on DV.Ma_DV = HD.Ma_DV
inner join Loai_Dich_Vu LDV on LDV.Ma_LDV = DV.Ma_LDV
where LK.Ten_LK = 'Diamond'
group by KH.Ma_KH
order by So_Lan;

--  5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
create view Tien as
select HDCT.*, sum(DVDK.Gia * HDCT.So_Luong) Gia_Tien from Dich_Vu_Di_Kem DVDK 
inner join Hop_Dong_Chi_Tiet HDCT on HDCT.Ma_DVDK = DVDK.Ma_DVDK
group by DVDK.Ma_DVDK, HDCT.Ma_HDCT;

select KH.Ma_KH, KH.Ho_Ten, LK.Ten_LK, HD.Ma_HD, DV.Ten_DV, HD.Ngay_Lam_HD, HD.Ngay_Ket_Thuc, sum(DV.Chi_Phi_Thue + T.Gia_Tien) Tong  from Khach_Hang KH
left join  Loai_Khach LK on KH.Ma_LK = LK.Ma_LK 
left join Hop_Dong HD on HD.Ma_KH = KH.Ma_KH
left join Dich_Vu DV on DV.Ma_DV = HD.Ma_DV
left join Tien T on T.Ma_HD = HD.Ma_HD
group by KH.Ma_KH, HD.Ma_HD;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả 
-- các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select DV.Ma_DV, DV.Ten_DV, DV.Chi_Phi_Thue, HD.Ngay_Lam_HD, LDV.Ten_LDV from Dich_Vu DV
inner join Loai_Dich_Vu LDV on LDV.Ma_LDV = DV.Ma_LDV
inner join Hop_Dong HD on HD.Ma_DV = DV.Ma_DV
where DV.Ma_DV not in (select DV.Ma_DV from Hop_Dong HD
join Dich_Vu DV on HD.Ma_DV = DV.Ma_DV
where (year(HD.Ngay_Lam_HD) = 2021 and month(HD.Ngay_Lam_HD) in(1,2,3)))
group by DV.Ma_DV, HD.Ma_HD;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả 
-- các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021
select DV.Ma_DV, DV.Ten_DV, DV.Dien_Tich, DV.So_Nguoi_Toi_Da, DV.Chi_Phi_Thue, LDV.Ten_LDV from Dich_Vu DV
inner join Loai_Dich_Vu LDV on LDV.Ma_LDV = DV.Ma_LDV
where DV.Ma_DV not in(select DV.Ma_DV from Hop_Dong HD
join Dich_Vu DV on HD.Ma_DV = DV.Ma_DV
where year(HD.Ngay_Lam_HD) = 2021)
group by DV.Ma_DV;

-- 8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- Cách 1:
select distinct KH.Ho_Ten from Khach_Hang KH;
-- Cách 2:
select KH.Ho_Ten from Khach_Hang KH
group by KH.Ho_Ten;
-- Cách 3:
select distinct KH.Ho_Ten from Khach_Hang KH
union
select KH.Ho_Ten from Khach_Hang KH;

-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(Ngay_Lam_HD) Thang, count(Ma_KH) as So_Luong_Khach_Hang from Hop_Dong 
where year(Ngay_Lam_HD) = 2021
group by (month(Ngay_Lam_HD))
order by month(Ngay_Lam_HD);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select HD.Ma_HD, HD.Ngay_Lam_HD, HD.Ngay_Ket_Thuc, HD.Tien_Dat_Coc, sum(HDCT.So_Luong) So_Luong from Hop_Dong HD
left join Hop_Dong_Chi_Tiet HDCT on HD.Ma_HD = HDCT.Ma_HD
left join Dich_Vu_Di_Kem DVDK on HDCT.Ma_DVDK = DVDK.Ma_DVDK
group by HD.Ma_HD;
