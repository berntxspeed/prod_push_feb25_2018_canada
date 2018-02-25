SELECT s.order_id, s.customer_id, s.shipping_id, s.sales_ofc, s.sales_grp, s.doc_type,
s.Email_OTC AS 'Email Address', s.Email_OTC AS SubscriberKey

FROM FromSAP_Order s

WHERE
(s.sales_ofc = 'ECM' OR s.sales_ofc = 'YRD')
AND s.doc_type = 'ZARF'
AND s.consumed = 'false'
AND s."Date Posted" >= Convert(datetime, '2017-01-20')
AND s.Email_OTC IS NOT NULL
AND s.sales_org = '1100'
