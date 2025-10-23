CREATE TABLE medical_insurance_edit (
    person_id FLOAT PRIMARY KEY NOT NULL,
    age FLOAT,
    sex VARCHAR(255),
    region VARCHAR(255),
    urban_rural VARCHAR(255),
    income FLOAT,
    education VARCHAR(255),
    marital_status VARCHAR(255),
    employment_status VARCHAR(255),
    household_size FLOAT,
    dependents FLOAT,
    bmi FLOAT,
    smoker VARCHAR(255),
    alcohol_freq VARCHAR(255),
    visits_last_year FLOAT,
    hospitalizations_last_3yrs FLOAT,
    days_hospitalized_last_3yrs FLOAT,
    medication_count FLOAT,
    systolic_bp FLOAT,
    diastolic_bp FLOAT,
    ldl FLOAT,
    hba1c FLOAT,
    plan_type VARCHAR(255),
    network_tier VARCHAR(255),
    deductible FLOAT,
    copay FLOAT,
    policy_term_years FLOAT,
    policy_changes_last_2yrs FLOAT,
    provider_quality FLOAT,
    risk_score FLOAT,
    annual_medical_cost FLOAT,
    annual_premium FLOAT,
    monthly_premium FLOAT,
    claims_count FLOAT,
    avg_claim_amount FLOAT,
    total_claims_paid FLOAT,
    chronic_count FLOAT,
    hypertension FLOAT,
    diabetes FLOAT,
    asthma FLOAT,
    copd FLOAT,
    cardiovascular_disease FLOAT,
    cancer_history FLOAT,
    kidney_disease FLOAT,
    liver_disease FLOAT,
    arthritis FLOAT,
    mental_health FLOAT,
    proc_imaging_count FLOAT,
    proc_surgery_count FLOAT,
    proc_physio_count FLOAT,
    proc_consult_count FLOAT,
    proc_lab_count FLOAT,
    is_high_risk FLOAT,
    had_major_procedure FLOAT
);


copy medical_insurance_edit from 'C:\medical_insurance.csv' DELIMITER ',' CSV HEADER;

select * from medical_insurance_edit;

--Retrieve all columns where region = 'North'
select *
From medical_insurance_edit
Where region = 'North';

-- count how many patients are from each region
select region, count(*) as patient_count
from medical_insurance_edit group by region order by patient_count DESC;

-- count of patients by gender
select sex, count(*) as gender_count from medical_insurance_edit
group by sex order by gender_count desc;

-- Find the average income of males and females
select sex, round(avg (income):: numeric,2) as average_income from medical_insurance_edit
group by sex; 

-- Top 5 highest incomes
Select * from medical_insurance_edit order by income desc limit 5 ;

--All patients older than 65 years
select * from medical_insurance_edit where age > 65;

-- Average income by education level
select education, round(avg(income):: numeric,2) as average_income from medical_insurance_edit
group by education order by average_income desc;

-- Count people with diabetes grouped by region
(select region, count (*) as diabetes_count from medical_insurance_edit where diabetes = 1
group by region)
union all
(select 'TOTAL' as region, count(*) as diabetes_count
from medical_insurance_edit where diabetes = 1)
order by diabetes_count;

-- all rows where is_high_risk = 1 and heart_disease = 1

select * from medical_insurance_edit where is_high_risk = 1 and cardiovascular_disease = 1;

-- How many people have more than 2 medical procedures
select count(*) as people_more_than_two_procedures from medical_insurance_edit 
where proc_imaging_count + proc_physio_count + proc_consult_count
+ proc_lab_count >2;

-- The percentage of high-risk patients in each region.

select region, count(*) as total_patients,
sum(case when is_high_risk = 1 then 1 else 0 end) as high_risk_patients,
round(100.0 * sum(case when is_high_risk = 1 then 1 else 0 end)/ count (*), 2) as high_risk_percentage
from medical_insurance_edit group by region
order by high_risk_percentage desc;

-- Calculate average income, average age, and percentage of high-risk per urban_rural group.

select urban_rural, round(avg(income):: numeric, 2) as average_income, 
round(avg (age):: numeric,0) as average_age, count(*) as total_patients,
sum(case when is_high_risk = 1 then 1 else 0 end) as high_risk_patients,
round(100.0 * sum(case when is_high_risk = 1 then 1 else 0 end)/ count (*), 2) as high_risk_percentage
from medical_insurance_edit group by urban_rural
order by high_risk_percentage desc;

-- Rank individuals by income within each education group
select person_id, education, income, 
rank() over (partition by education order by income desc) as income_rank
from medical_insurance_edit;


-- Create a view named high_risk_patients 
-- containing only patients with chronic diseases or `is_high_risk = 1`

create view high_risk_patients as 
select * from medical_insurance_edit where is_high_risk = 1 or chronic_count = 1;
-- to view high risk patients table
select * from high_risk_patients;




