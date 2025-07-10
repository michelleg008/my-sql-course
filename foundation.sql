SELECT 
    ps.PatientId
    , ps.Hospital
    , ps.Ward
    , ps.AdmittedDate 
    , ps.DischargeDate
    , DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
    , DATEADD(WEEK, -2, ps.AdmittedDate) AS ReminderDate
    , ps.Tariff
FROM PatientStay ps
WHERE ps.Hospital IN ('Kingston' , 'PRUH')
AND ps.Ward LIKE '%Surgery'
AND ps.AdmittedDate BETWEEN '2024-02-27' AND '2024-03-01'
AND ps.Tariff > 5
ORDER BY 
    ps.AdmittedDate DESC 
    , ps.PatientId DESC
