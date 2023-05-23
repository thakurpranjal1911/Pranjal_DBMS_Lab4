select c.cat_id, c.cat_name, p.pro_name, sp.Least_Expensive_Price
from category c
inner join  product p on c.cat_id = p.cat_id
inner join  (
    select c.cat_id, MIN(sp.supp_price) as Least_Expensive_Price
    from category c
    inner join product p on c.cat_id = p.cat_id
    inner join supplier_pricing sp on p.pro_id = sp.pro_id
    group by c.cat_id
) sp on c.cat_id = sp.cat_id
inner join supplier_pricing sp2 on p.pro_id = sp2.pro_id
AND sp.Least_Expensive_Price = sp2.supp_price
order by c.cat_id asc;