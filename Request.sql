 WITH sl_fact AS(SELECT
                (CASE
                	WHEN sd.product_id = 1 THEN (SELECT SUM(sd.sales_cnt) FROM shop_dns sd INNER JOIN products pr ON sd.product_id = pr.product_id WHERE sd.product_id = 1 AND toMonth(sd."date") = toMonth(now()) AND toYear(sd."date") = toYear(now()))
                	WHEN sd.product_id = 2 THEN (SELECT SUM(sd.sales_cnt) FROM shop_dns sd INNER JOIN products pr ON sd.product_id = pr.product_id WHERE sd.product_id = 2 AND toMonth(sd."date") = toMonth(now()) AND toYear(sd."date") = toYear(now()))
                	WHEN sd.product_id = 3 THEN (SELECT SUM(sd.sales_cnt) FROM shop_dns sd INNER JOIN products pr ON sd.product_id = pr.product_id WHERE sd.product_id = 3 AND toMonth(sd."date") = toMonth(now()) AND toYear(sd."date") = toYear(now()))
                    WHEN sm.product_id = 1 THEN (SELECT SUM(sm.sales_cnt) FROM shop_mvideo sm INNER JOIN products pr ON sm.product_id = pr.product_id WHERE sm.product_id = 1 AND toMonth(sm."date") = toMonth(now()) AND toYear(sm."date") = toYear(now()))
                	WHEN sm.product_id = 2 THEN (SELECT SUM(sm.sales_cnt) FROM shop_mvideo sm INNER JOIN products pr ON sm.product_id = pr.product_id WHERE sm.product_id = 2 AND toMonth(sm."date") = toMonth(now()) AND toYear(sm."date") = toYear(now()))
                	WHEN sm.product_id = 3 THEN (SELECT SUM(sm.sales_cnt) FROM shop_mvideo sm INNER JOIN products pr ON sm.product_id = pr.product_id WHERE sm.product_id = 3 AND toMonth(sm."date") = toMonth(now()) AND toYear(sm."date") = toYear(now()))
                	WHEN ss.product_id = 1 THEN (SELECT SUM(ss.sales_cnt) FROM shop_sitilink ss INNER JOIN products pr ON ss.product_id = pr.product_id WHERE ss.product_id = 1 AND toMonth(ss."date") = toMonth(now()) AND toYear(ss."date") = toYear(now()))
                	WHEN ss.product_id = 2 THEN (SELECT SUM(ss.sales_cnt) FROM shop_sitilink ss INNER JOIN products pr ON ss.product_id = pr.product_id WHERE ss.product_id = 2 AND toMonth(ss."date") = toMonth(now()) AND toYear(ss."date") = toYear(now()))
                	WHEN ss.product_id = 3 THEN (SELECT SUM(ss.sales_cnt) FROM shop_sitilink ss INNER JOIN products pr ON ss.product_id = pr.product_id WHERE ss.product_id = 3 AND toMonth(ss."date") = toMonth(now()) AND toYear(ss."date") = toYear(now()))
                 END) AS sales_fact,
                (CASE
                	WHEN pl.product_id = 1 AND pl.id_shop = 1 THEN (SELECT pl.plan_cnt FROM plan pl WHERE pl.product_id = 1 AND pl.id_shop = 1)
	                WHEN pl.product_id = 2 AND pl.id_shop = 1 THEN (SELECT pl.plan_cnt FROM plan pl WHERE pl.product_id = 2 AND pl.id_shop = 1)
	                WHEN pl.product_id = 3 AND pl.id_shop = 1 THEN (SELECT pl.plan_cnt FROM plan pl WHERE pl.product_id = 3 AND pl.id_shop = 1)
	                WHEN pl.product_id = 1 AND pl.id_shop = 2 THEN (SELECT pl.plan_cnt FROM plan pl WHERE pl.product_id = 1 AND pl.id_shop = 2)
	                WHEN pl.product_id = 2 AND pl.id_shop = 2 THEN (SELECT pl.plan_cnt FROM plan pl WHERE pl.product_id = 2 AND pl.id_shop = 2)
	                WHEN pl.product_id = 3 AND pl.id_shop = 2 THEN (SELECT pl.plan_cnt FROM plan pl WHERE pl.product_id = 3 AND pl.id_shop = 2)
	                WHEN pl.product_id = 1 AND pl.id_shop = 3 THEN (SELECT pl.plan_cnt FROM plan pl WHERE pl.product_id = 1 AND pl.id_shop = 3)
	                WHEN pl.product_id = 2 AND pl.id_shop = 3 THEN (SELECT pl.plan_cnt FROM plan pl WHERE pl.product_id = 2 AND pl.id_shop = 3)
	                WHEN pl.product_id = 3 AND pl.id_shop = 3 THEN (SELECT pl.plan_cnt FROM plan pl WHERE pl.product_id = 3 AND pl.id_shop = 3)
                 END) AS sales_plan, product_name, shop_name, price
                 FROM products pr
                 INNER JOIN shop_dns sd ON sd.product_id = pr.product_id
                 INNER JOIN shop_mvideo sm ON sm.product_id = pr.product_id
                 INNER JOIN shop_sitilink ss ON ss.product_id = pr.product_id
                 INNER JOIN plan pl ON pl.product_id = pr.product_id
                 INNER JOIN shop_name sn ON pl.id_shop = sn.id_shop
                 GROUP BY  sales_fact, pr.product_name, sales_plan, shop_name, pr.price)
SELECT shop_name, product_name, sales_fact, sales_plan, (sales_fact/sales_plan) AS sales_ratio, sales_fact*price AS income_fact, sales_plan*price AS income_plan, (sales_fact*price)/(sales_plan*price) AS income_ratio
FROM sl_fact
ORDER BY shop_name, product_name