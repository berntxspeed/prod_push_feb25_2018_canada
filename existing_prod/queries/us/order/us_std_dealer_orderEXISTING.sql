SELECT s.order_id, s.customer_id, s.shipping_id, s.sales_ofc, s.sales_grp, s.doc_type, a.Id AS
account_SFDC_Id, a.Name AS account_SFDC_Name,
a.ENSX_EDM__SAP_Customer_Number__C AS
account_ENSX_EDM__SAP_Customer_Number, a.SAP_Ship_To_Number__c AS
account_SAP_Ship_To_Number, c.Id AS contact_SFDC_Id, c.Name AS
contact_SFDC_Name, c.SFMC_Order_Confirmation__c AS
contact_Dealer_Order_Confirmation, c.Email as 'Email Address', c.Id AS SubscriberKey

FROM Contact_Salesforce c
INNER JOIN Account_Salesforce a
ON c.AccountId = a.Id
INNER JOIN FromSAP_Order s
ON s.customer_id = a.ENSX_EDM__SAP_Customer_Number__c
WHERE c.SFMC_Order_Confirmation__c = 'True'
AND s.shipping_id = s.customer_id
AND a.RecordTypeId = '012i0000000yQvFAAU'
AND (sales_ofc='STD' OR sales_ofc='HYB')
AND s.DOC_TYPE = 'TA'
AND s.consumed = 'false'
AND DATEDIFF(dd, s.[Date Posted], GETDATE()) < 15
AND c.Email IS NOT NULL

UNION

SELECT s.order_id, s.customer_id, s.shipping_id, s.sales_ofc, s.sales_grp, s.doc_type, a.Id AS
account_SFDC_Id, a.Name AS account_SFDC_Name,
a.ENSX_EDM__SAP_Customer_Number__C AS
account_ENSX_EDM__SAP_Customer_Number, a.SAP_Ship_To_Number__c AS
account_SAP_Ship_To_Number, c.Id AS contact_SFDC_Id, c.Name AS
contact_SFDC_Name, c.SFMC_Order_Confirmation__c AS
contact_Dealer_Order_Confirmation, c.Email as 'Email Address', c.Id AS SubscriberKey

FROM Contact_Salesforce c
INNER JOIN Account_Salesforce a
ON c.AccountId = a.Id
INNER JOIN FromSAP_Order s
ON s.customer_id = a.ENSX_EDM__SAP_Customer_Number__c
WHERE c.SFMC_Order_Confirmation__c = 'True'
AND s.shipping_id <> s.customer_id
AND a.RecordTypeId = '012i0000000yQvFAAU'
AND (sales_ofc='STD' OR sales_ofc='HYB')
AND s.DOC_TYPE = 'TA'
AND s.consumed = 'false'
AND DATEDIFF(dd, s.[Date Posted], GETDATE()) < 15
AND c.Email IS NOT NULL

UNION

SELECT s.order_id, s.customer_id, s.shipping_id, s.sales_ofc, s.sales_grp, s.doc_type, a.Id AS
account_SFDC_Id, a.Name AS account_SFDC_Name,
a.ENSX_EDM__SAP_Customer_Number__C AS
account_ENSX_EDM__SAP_Customer_Number, a.SAP_Ship_To_Number__c AS
account_SAP_Ship_To_Number, c.Id AS contact_SFDC_Id, c.Name AS
contact_SFDC_Name, c.SFMC_Order_Confirmation__c AS
contact_Dealer_Order_Confirmation, c.Email as 'Email Address', c.Id AS SubscriberKey

FROM Contact_Salesforce c
INNER JOIN Account_Salesforce a
ON c.AccountId = a.Id
INNER JOIN FromSAP_Order s
ON s.shipping_id = a.SAP_Ship_To_Number__c
WHERE c.SFMC_Order_Confirmation__c = 'True'
AND s.shipping_id <> s.customer_id
AND a.RecordTypeId = '012i0000000Bsh5AAC'
AND (sales_ofc='STD' OR sales_ofc='HYB')
AND s.DOC_TYPE = 'TA'
AND s.consumed = 'false'
AND DATEDIFF(dd, s.[Date Posted], GETDATE()) < 15
AND c.Email IS NOT NULL
