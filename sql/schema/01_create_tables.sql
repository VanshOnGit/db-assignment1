-- ================================
-- SCHOLAREASE DATABASE SCHEMA
-- MAX MARKS VERSION (MySQL)
-- ================================

CREATE DATABASE IF NOT EXISTS ScholEase;
USE ScholEase;

-- ================================
-- TABLE: Member
-- ================================
CREATE TABLE Member (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    role ENUM('student','admin') NOT NULL,
    CHECK (role IN ('student','admin'))
);

-- ================================
-- TABLE: Category
-- ================================
CREATE TABLE Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

-- ================================
-- TABLE: Student
-- ================================
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    roll_no VARCHAR(20) NOT NULL UNIQUE,
    dob DATE NOT NULL,
    category_id INT NOT NULL,
    admission_year INT NOT NULL,
    
    FOREIGN KEY (student_id) REFERENCES Member(member_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ================================
-- TABLE: Admin
-- ================================
CREATE TABLE Admin (
    admin_id INT PRIMARY KEY,
    designation VARCHAR(100) NOT NULL,

    FOREIGN KEY (admin_id) REFERENCES Member(member_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ================================
-- TABLE: Scholarship
-- ================================
CREATE TABLE Scholarship (
    scholarship_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    total_fund DECIMAL(12,2) NOT NULL CHECK (total_fund >= 0)
);

-- ================================
-- TABLE: EligibilityCriteria
-- ================================
CREATE TABLE EligibilityCriteria (
    criteria_id INT PRIMARY KEY AUTO_INCREMENT,
    scholarship_id INT NOT NULL,
    min_cpi DECIMAL(3,2) NOT NULL CHECK (min_cpi >= 0 AND min_cpi <= 10),
    max_income DECIMAL(12,2) NOT NULL CHECK (max_income >= 0),
    required_category INT NOT NULL,

    FOREIGN KEY (scholarship_id) REFERENCES Scholarship(scholarship_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (required_category) REFERENCES Category(category_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ================================
-- TABLE: Application
-- ================================
CREATE TABLE Application (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    scholarship_id INT NOT NULL,
    application_date DATE NOT NULL,
    status ENUM('pending','approved','rejected') NOT NULL,

    FOREIGN KEY (student_id) REFERENCES Student(student_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (scholarship_id) REFERENCES Scholarship(scholarship_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ================================
-- TABLE: Document
-- ================================
CREATE TABLE Document (
    document_id INT PRIMARY KEY AUTO_INCREMENT,
    application_id INT NOT NULL,
    document_type VARCHAR(50) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    upload_date DATE NOT NULL,

    FOREIGN KEY (application_id) REFERENCES Application(application_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ================================
-- TABLE: Verification
-- ================================
CREATE TABLE Verification (
    verification_id INT PRIMARY KEY AUTO_INCREMENT,
    application_id INT NOT NULL,
    admin_id INT NOT NULL,
    decision ENUM('approved','rejected') NOT NULL,
    remarks TEXT,
    verification_date DATE NOT NULL,

    FOREIGN KEY (application_id) REFERENCES Application(application_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- ================================
-- TABLE: FundAllocation
-- ================================
CREATE TABLE FundAllocation (
    allocation_id INT PRIMARY KEY AUTO_INCREMENT,
    scholarship_id INT NOT NULL,
    allocated_amount DECIMAL(12,2) NOT NULL CHECK (allocated_amount >= 0),
    remaining_amount DECIMAL(12,2) NOT NULL CHECK (remaining_amount >= 0),

    FOREIGN KEY (scholarship_id) REFERENCES Scholarship(scholarship_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ================================
-- TABLE: Payment
-- ================================
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    application_id INT NOT NULL,
    amount DECIMAL(12,2) NOT NULL CHECK (amount >= 0),
    payment_date DATE NOT NULL,
    transaction_id VARCHAR(50) NOT NULL UNIQUE,

    FOREIGN KEY (application_id) REFERENCES Application(application_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ================================
-- TABLE: CPIRecord
-- ================================
CREATE TABLE CPIRecord (
    cpi_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    cpi DECIMAL(3,2) NOT NULL CHECK (cpi >= 0 AND cpi <= 10),
    semester INT NOT NULL,

    FOREIGN KEY (student_id) REFERENCES Student(student_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ================================
-- TABLE: IncomeCertificate
-- ================================
CREATE TABLE IncomeCertificate (
    income_certificate_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    annual_income DECIMAL(12,2) NOT NULL CHECK (annual_income >= 0),
    issue_date DATE NOT NULL,

    FOREIGN KEY (student_id) REFERENCES Student(student_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
