SELECT * FROM thaotaccsdl_1.subject;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất
select * from subject 
where Credit = (select Max(Credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select S.Sub_ID, S.Sub_Name, S.Credit, S.Status, M.Mark from Mark M 
inner join Subject S on M.Sub_ID = S.Sub_ID where M.Mark = (select Max(Mark) from Mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình (giảm dần)
select S.Student_ID, S.Student_Name, S.Address, S.Phone, S.Status, AVG(M.Mark) from Student S 
inner join Mark M on M.Student_ID = S.Student_ID
group by S.Student_ID, S.Student_Name order by AVG(M.Mark);

select * from Mark;
select * from Student;
