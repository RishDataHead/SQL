select count(t1.transaction_id) as payment_count
from transactions3 t1 inner join transactions3 t2 
on t1.merchant_id=t2.merchant_id and t1.credit_card_id=t2.credit_card_id and t1.amount=t2.amount
and t2.transaction_timestamp>t1.transaction_timestamp
where timestampdiff(minute,t1.transaction_timestamp,t2.transaction_timestamp)<10;