SELECT s.invoice_number, s.customer_number, s.shipping_id, s.sales_ofc, s.sales_grp, s.doc_type, a.Id AS
account_SFDC_Id, a.Name AS account_SFDC_Name, a.ENSX_EDM__SAP_Customer_Number__C AS
account_ENSX_EDM__SAP_Customer_Number, a.SAP_Ship_To_Number__c AS
account_SAP_Ship_To_Number, c.Id AS contact_SFDC_Id, c.Name AS contact_SFDC_Name, c.SFMC_Invoice__c AS contact_SFMC_Invoice, c.Email as 'Email Address', c.Id AS SubscriberKey

FROM Contact_Salesforce c
INNER JOIN Account_Salesforce a
ON c.AccountId = a.Id
INNER JOIN FromSAP_Invoice s
ON s.customer_number = a.ENSX_EDM__SAP_Customer_Number__c
WHERE c.SFMC_Invoice__c = 'True'
AND s.shipping_id = s.customer_number
AND a.RecordTypeId = '0120S0000000xeTQAQ'
AND (sales_ofc='STD' OR sales_ofc='DSD' OR sales_ofc='OEM' OR sales_ofc='NTL')
AND (s.DOC_TYPE = 'TA' OR s.DOC_TYPE = 'F2')
AND s.consumed = 'false'
AND DATEDIFF(dd, s.[Date Added], GETDATE()) < 15
AND c.Email IS NOT NULL
AND s.sales_org = '1500'

UNION

SELECT s.invoice_number, s.customer_number, s.shipping_id, s.sales_ofc, s.sales_grp, s.doc_type, a.Id AS
account_SFDC_Id, a.Name AS account_SFDC_Name, a.ENSX_EDM__SAP_Customer_Number__C AS
account_ENSX_EDM__SAP_Customer_Number, a.SAP_Ship_To_Number__c AS
account_SAP_Ship_To_Number, c.Id AS contact_SFDC_Id, c.Name AS contact_SFDC_Name, c.SFMC_Invoice__c AS contact_SFMC_Invoice, c.Email as 'Email Address', c.Id AS SubscriberKey

FROM Contact_Salesforce c
INNER JOIN Account_Salesforce a
ON c.AccountId = a.Id
INNER JOIN FromSAP_Invoice s
ON s.customer_number = a.ENSX_EDM__SAP_Customer_Number__c
WHERE c.SFMC_Invoice__c = 'True'
AND s.shipping_id <> s.customer_number
AND a.RecordTypeId = '0120S0000000xeTQAQ'
AND (sales_ofc='STD' OR sales_ofc='DSD' OR sales_ofc='OEM' OR sales_ofc='NTL')
AND (s.DOC_TYPE = 'TA' OR s.DOC_TYPE = 'F2')
AND s.consumed = 'false'
AND DATEDIFF(dd, s.[Date Added], GETDATE()) < 15
AND c.Email IS NOT NULL
AND s.sales_org = '1500'

UNION

SELECT s.invoice_number, s.customer_number, s.shipping_id, s.sales_ofc, s.sales_grp, s.doc_type, a.Id AS
account_SFDC_Id, a.Name AS account_SFDC_Name, a.ENSX_EDM__SAP_Customer_Number__C AS
account_ENSX_EDM__SAP_Customer_Number, a.SAP_Ship_To_Number__c AS
account_SAP_Ship_To_Number, c.Id AS contact_SFDC_Id, c.Name AS contact_SFDC_Name, c.SFMC_Invoice__c AS contact_SFMC_Invoice, c.Email as 'Email Address', c.Id AS SubscriberKey

FROM Contact_Salesforce c
INNER JOIN Account_Salesforce a
ON c.AccountId = a.Id
INNER JOIN FromSAP_Invoice s
ON s.shipping_id = a.SAP_Ship_To_Number__c
WHERE c.SFMC_Invoice__c = 'True'
AND s.shipping_id <> s.customer_number
AND a.RecordTypeId = '012i0000000Bsh5AAC'
AND (sales_ofc='STD' OR sales_ofc='DSD' OR sales_ofc='OEM' OR sales_ofc='NTL')
AND (s.DOC_TYPE = 'TA' OR s.DOC_TYPE = 'F2')
AND s.consumed = 'false'
AND DATEDIFF(dd, s.[Date Added], GETDATE()) < 15
AND c.Email IS NOT NULL
AND s.sales_org = '1500'
