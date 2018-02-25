SELECT s.ORDER_ID, s.CUSTOMER_ID, s.PACKING_SLIP_NUMBER AS shipment_number, s.shipping_id, s.sales_ofc, s.sales_grp, s.DOC_TYPE, a.Id AS account_SFDC_Id, a.Name AS account_SFDC_Name,
a.ENSX_EDM__SAP_Customer_Number__C AS account_ENSX_EDM__SAP_Customer_Number, a.SAP_Ship_To_Number__c AS account_SAP_Ship_To_Number, a.RecordTypeId AS account_record_type, c.Id AS contact_SFDC_Id, c.Name AS contact_SFDC_Name, c.SFMC_Order_Confirmation__c AS contact_Dealer_Order_Confirmation, c.Email as [Email Address], c.Id AS SubscriberKey

FROM Contact_Salesforce c
INNER JOIN Account_Salesforce a
ON c.AccountId = a.Id
INNER JOIN FromSAP_Shipping s
ON s.CUSTOMER_ID = a.ENSX_EDM__SAP_Customer_Number__c
WHERE c.SFMC_Shipping__c = 'True'
AND s.shipping_id = s.CUSTOMER_ID
AND a.RecordTypeId = '012i0000000yQvFAAU'
AND (sales_ofc='STD' OR sales_ofc='HYB')
AND s.DOC_TYPE = 'TA'
AND s.consumed = 'false'
AND DATEDIFF(dd, s.[Date Added], GETDATE()) < 15
AND c.Email IS NOT NULL
AND s.sales_org = '1100'

UNION

SELECT s.ORDER_ID, s.CUSTOMER_ID, s.PACKING_SLIP_NUMBER AS shipment_number, s.shipping_id, s.sales_ofc, s.sales_grp, s.DOC_TYPE, a.Id AS account_SFDC_Id, a.Name AS account_SFDC_Name,
a.ENSX_EDM__SAP_Customer_Number__C AS account_ENSX_EDM__SAP_Customer_Number, a.SAP_Ship_To_Number__c AS account_SAP_Ship_To_Number, a.RecordTypeId AS account_record_type, c.Id AS contact_SFDC_Id, c.Name AS contact_SFDC_Name, c.SFMC_Order_Confirmation__c AS contact_Dealer_Order_Confirmation, c.Email as [Email Address], c.Id AS SubscriberKey

FROM Contact_Salesforce c
INNER JOIN Account_Salesforce a
ON c.AccountId = a.Id
INNER JOIN FromSAP_Shipping s
ON s.CUSTOMER_ID = a.ENSX_EDM__SAP_Customer_Number__c
WHERE c.SFMC_Shipping__c = 'True'
AND s.shipping_id <> s.CUSTOMER_ID
AND a.RecordTypeId = '012i0000000yQvFAAU'
AND (sales_ofc='STD' OR sales_ofc='HYB')
AND s.DOC_TYPE = 'TA'
AND s.consumed = 'false'
AND DATEDIFF(dd, s.[Date Added], GETDATE()) < 15
AND c.Email IS NOT NULL
AND s.sales_org = '1100'

UNION

SELECT s.ORDER_ID, s.CUSTOMER_ID, s.PACKING_SLIP_NUMBER AS shipment_number, s.shipping_id, s.sales_ofc, s.sales_grp, s.DOC_TYPE, a.Id AS account_SFDC_Id, a.Name AS account_SFDC_Name,
a.ENSX_EDM__SAP_Customer_Number__C AS account_ENSX_EDM__SAP_Customer_Number, a.SAP_Ship_To_Number__c AS account_SAP_Ship_To_Number, a.RecordTypeId AS account_record_type, c.Id AS contact_SFDC_Id, c.Name AS contact_SFDC_Name, c.SFMC_Order_Confirmation__c AS contact_Dealer_Order_Confirmation, c.Email as [Email Address], c.Id AS SubscriberKey

FROM Contact_Salesforce c
INNER JOIN Account_Salesforce a
ON c.AccountId = a.Id
INNER JOIN FromSAP_Shipping s
ON s.shipping_id = a.SAP_Ship_To_Number__c
WHERE c.SFMC_Shipping__c = 'True'
AND s.shipping_id <> s.CUSTOMER_ID
AND a.RecordTypeId = '012i0000000Bsh5AAC'
AND (sales_ofc='STD' OR sales_ofc='HYB')
AND s.DOC_TYPE = 'TA'
AND s.consumed = 'false'
AND DATEDIFF(dd, s.[Date Added], GETDATE()) < 15
AND c.Email IS NOT NULL
AND s.sales_org = '1100'
