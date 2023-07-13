INSERT INTO default.products(product_id, product_name, price) VALUES (1, 'Испорченный телефон', 700), (2, 'Сарафанное радио', 1800), (3, 'Патефон', 250);

INSERT INTO default.shop_name(id_shop, shop_name) VALUES (1, 'dns'), (2, 'sitilink'), (3, 'mvideo');

INSERT INTO default.shop_mvideo("date", product_id, id_shop, sales_cnt) VALUES ('2023-07-01', 2, 3, 1), ('2023-07-02', 2, 3, 3), ('2023-07-02', 1, 3, 8), ('2023-07-09', 3, 3, 1), ('2023-07-07', 2, 3, 7), ('2023-07-21', 2, 3, 3), ('2022-07-17', 3, 3, 50), ('2023-07-17', 3, 3, 3);

INSERT INTO default.shop_dns("date", product_id, id_shop, sales_cnt) VALUES ('2023-07-07', 3, 1, 1), ('2023-07-13', 3, 1, 3), ('2023-07-02', 1, 1, 8), ('2023-07-26', 2, 1, 1), ('2023-07-21', 1, 1, 7), ('2023-06-11', 3, 1, 90), ('2023-07-22', 1, 1, 3), ('2023-07-15', 3, 1, 3);

INSERT INTO default.shop_sitilink("date", product_id, id_shop, sales_cnt) VALUES ('2023-07-01', 1, 2, 1), ('2023-07-02', 2, 2, 3), ('2023-07-03', 2, 2, 8), ('2023-07-04', 3, 2, 1), ('2023-07-05', 3, 2, 7), ('2023-07-06', 2, 2, 3), ('2023-07-07', 1, 2, 3);

INSERT INTO default.plan(product_id,id_shop, plan_cnt, plan_date) VALUES (1, 1, 15, '2023-07-30'), (2, 1, 20, '2023-07-30'), (3, 1, 10, '2023-07-30'), (1, 2, 25, '2023-07-30'), (2, 2, 10, '2023-07-30'), (3, 2, 10, '2023-07-30'), (1, 3, 35, '2023-07-30'), (2, 3, 30, '2023-07-30'), (3, 3, 29, '2023-07-30');