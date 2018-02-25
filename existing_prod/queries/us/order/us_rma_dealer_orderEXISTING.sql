SELECT s.order_id, s.customer_id, s.shipping_id, s.sales_ofc, s.sales_grp, s.doc_type,
s.Email_OTC AS [Email Address], s.Email_OTC AS SubscriberKey

FROM FromSAP_Order s

WHERE
(s.sales_ofc = 'STD' OR s.sales_ofc = 'HYB')
AND s.doc_type = 'ZARF'
AND s.consumed = 'false'
AND DATEDIFF(dd, s.[Date Posted], GETDATE()) < 15
AND s.Email_OTC IS NOT NULL
