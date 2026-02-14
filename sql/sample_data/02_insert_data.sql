INSERT INTO Member (name, email, phone, role) VALUES
('Amit Sharma', 'amit@example.com', '9876543210', 'student'),
('Priya Verma', 'priya@example.com', '9988776655', 'student'),
('Rohan Singh', 'rohan@example.com', '9123456780', 'student'),
('Sanya Gupta', 'sanya@example.com', '9090909090', 'student'),
('Vikas Mehta', 'vikas@example.com', '9876501234', 'student'),

('Admin One', 'admin1@example.com', '8000000001', 'admin'),
('Admin Two', 'admin2@example.com', '8000000002', 'admin'),
('Admin Three', 'admin3@example.com', '8000000003', 'admin'),

('Deepak Rao', 'deepak@example.com', '9900112233', 'student'),
('Neha Nair', 'neha@example.com', '9933557799', 'student');

INSERT INTO Category (category_name) VALUES
('General'),
('OBC'),
('SC'),
('ST'),
('EWS');

INSERT INTO Student (student_id, roll_no, dob, category_id, admission_year) VALUES
(1, '21CS001', '2003-02-11', 1, 2021),
(2, '21CS002', '2003-04-19', 2, 2021),
(3, '21CS003', '2003-09-03', 3, 2021),
(4, '21CS004', '2003-12-30', 4, 2021),
(5, '21CS005', '2003-01-25', 2, 2021),
(9, '21CS009', '2003-05-14', 1, 2021),
(10,'21CS010', '2003-07-01', 5, 2021);

INSERT INTO Admin (admin_id, designation) VALUES
(6, 'Senior Officer'),
(7, 'Accounts Manager'),
(8, 'Verification Officer');

INSERT INTO Scholarship (name, description, total_fund) VALUES
('Merit Scholarship', 'Awarded for academic excellence', 500000),
('Means Scholarship', 'Based on family income', 300000),
('ST Category Scholarship', 'Support for ST category students', 200000),
('Girl Child Scholarship', 'Support for female students', 250000),
('Research Grant', 'Given to students involved in research', 400000);

INSERT INTO EligibilityCriteria (scholarship_id, min_cpi, max_income, required_category) VALUES
(1, 8.0, 1000000, 1),
(2, 7.0, 300000, 2),
(3, 6.5, 500000, 4),
(4, 7.5, 1500000, 1),
(5, 8.5, 2000000, 1);

INSERT INTO FundAllocation (scholarship_id, allocated_amount, remaining_amount) VALUES
(1, 500000, 460000),
(2, 300000, 250000),
(3, 200000, 180000),
(4, 250000, 220000),
(5, 400000, 380000);

INSERT INTO Application (student_id, scholarship_id, application_date, status) VALUES
(1, 1, '2024-01-10', 'approved'),
(2, 2, '2024-01-12', 'pending'),
(3, 3, '2024-01-14', 'rejected'),
(4, 4, '2024-01-18', 'approved'),
(5, 1, '2024-01-20', 'pending'),
(9, 2, '2024-01-22', 'approved'),
(10,3, '2024-01-25', 'pending'),
(1, 5, '2024-02-01', 'approved'),
(2, 4, '2024-02-05', 'approved'),
(5, 2, '2024-02-08', 'pending');

INSERT INTO Document (application_id, document_type, file_path, upload_date) VALUES
(1, 'Income Certificate', '/files/income1.pdf', '2024-01-10'),
(2, 'CPI Certificate', '/files/cpi2.pdf', '2024-01-12'),
(3, 'ID Proof', '/files/id3.pdf', '2024-01-14'),
(4, 'Income Certificate', '/files/income4.pdf', '2024-01-18'),
(5, 'CPI Certificate', '/files/cpi5.pdf', '2024-01-20'),
(6, 'ID Proof', '/files/id6.pdf', '2024-01-22'),
(7, 'Income Certificate', '/files/income7.pdf', '2024-01-25'),
(8, 'Research Proof', '/files/research8.pdf', '2024-02-01'),
(9, 'CPI Certificate', '/files/cpi9.pdf', '2024-02-05'),
(10,'Income Certificate', '/files/income10.pdf', '2024-02-08');

INSERT INTO CPIRecord (student_id, cpi, semester) VALUES
(1, 8.2, 5),
(2, 7.8, 5),
(3, 6.5, 5),
(4, 7.2, 5),
(5, 7.9, 5),
(9, 8.5, 5),
(10,7.1, 5),
(2, 8.0, 6),
(1, 8.4, 6),
(5, 7.7, 6);

INSERT INTO IncomeCertificate (student_id, annual_income, issue_date) VALUES
(1, 450000, '2023-12-01'),
(2, 250000, '2023-12-02'),
(3, 300000, '2023-12-05'),
(4, 180000, '2023-12-07'),
(5, 500000, '2023-12-10'),
(9, 350000, '2023-12-12'),
(10,220000, '2023-12-15'),
(1, 460000, '2023-12-20'),
(2, 240000, '2023-12-22'),
(3, 290000, '2023-12-25');

INSERT INTO Verification (application_id, admin_id, decision, remarks, verification_date) VALUES
(1, 6, 'approved', 'Good academic record.', '2024-01-15'),
(2, 7, 'approved', 'Income verified.', '2024-01-16'),
(3, 8, 'rejected', 'Low CPI.', '2024-01-17'),
(4, 6, 'approved', 'All documents clear.', '2024-01-19'),
(5, 7, 'approved', 'CPI verified.', '2024-01-21'),
(6, 8, 'approved', 'Meets criteria.', '2024-01-23'),
(7, 6, 'rejected', 'Incomplete docs.', '2024-01-26'),
(8, 7, 'approved', 'Research validated.', '2024-02-02'),
(9, 8, 'approved', 'Eligible category.', '2024-02-06'),
(10,6, 'pending',  'Under review.', '2024-02-09');

INSERT INTO Payment (application_id, amount, payment_date, transaction_id) VALUES
(1, 20000, '2024-01-20', 'TXN001'),
(4, 18000, '2024-01-23', 'TXN002'),
(8, 25000, '2024-02-05', 'TXN003'),
(9, 15000, '2024-02-06', 'TXN004'),
(2, 10000, '2024-01-25', 'TXN005'),
(6, 12000, '2024-01-28', 'TXN006'),
(5, 9000,  '2024-01-22', 'TXN007'),
(3, 0,     '2024-01-18', 'TXN008'),
(7, 5000,  '2024-01-30', 'TXN009'),
(10,11000, '2024-02-10', 'TXN010');
