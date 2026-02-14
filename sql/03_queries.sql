-- 1. Eligibility Check
SELECT 
    s.student_id,
    m.name AS student_name,
    sc.scholarship_id,
    sc.name AS scholarship_name
FROM Student s
JOIN Member m ON s.student_id = m.member_id
JOIN IncomeCertificate ic ON s.student_id = ic.student_id
JOIN CPIRecord cpi ON s.student_id = cpi.student_id
JOIN EligibilityCriteria ec ON s.category_id = ec.required_category
JOIN Scholarship sc ON ec.scholarship_id = sc.scholarship_id
WHERE 
    cpi.cpi >= ec.min_cpi
    AND ic.annual_income <= ec.max_income;

-- 2. Pending Applications
SELECT 
    a.application_id,
    a.application_date,
    m.name AS student_name,
    sc.name AS scholarship_name
FROM Application a
JOIN Student s ON a.student_id = s.student_id
JOIN Member m ON s.student_id = m.member_id
JOIN Scholarship sc ON a.scholarship_id = sc.scholarship_id
WHERE a.status = 'pending';

-- 3. Approved Scholarships
SELECT 
    a.application_id,
    m.name AS student_name,
    sc.name AS scholarship_name,
    v.verification_date,
    v.remarks
FROM Application a
JOIN Verification v ON a.application_id = v.application_id
JOIN Student s ON a.student_id = s.student_id
JOIN Member m ON s.student_id = m.member_id
JOIN Scholarship sc ON a.scholarship_id = sc.scholarship_id
WHERE v.decision = 'approved';

-- 4. Fund Allocation
SELECT 
    sc.scholarship_id,
    sc.name AS scholarship_name,
    fa.allocated_amount,
    fa.remaining_amount
FROM FundAllocation fa
JOIN Scholarship sc ON fa.scholarship_id = sc.scholarship_id;

-- 5. Payment Release Report
SELECT 
    p.payment_id,
    a.application_id,
    m.name AS student_name,
    sc.name AS scholarship_name,
    p.amount,
    p.payment_date,
    p.transaction_id
FROM Payment p
JOIN Application a ON p.application_id = a.application_id
JOIN Student s ON a.student_id = s.student_id
JOIN Member m ON s.student_id = m.member_id
JOIN Scholarship sc ON a.scholarship_id = sc.scholarship_id
ORDER BY p.payment_date DESC;
