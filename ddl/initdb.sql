CREATE TABLE IF NOT EXISTS default.products(
    product_id UInt32,
    product_name String,
    price UInt32
)
Engine = MergeTree()
ORDER BY product_id;

CREATE TABLE IF NOT EXISTS default.shop_name(
    id_shop UInt8,
    shop_name String
) 
Engine = MergeTree()
ORDER BY id_shop;

CREATE TABLE IF NOT EXISTS default.shop_mvideo(
    "date" date,
    product_id UInt32,
    id_shop UInt8,
    sales_cnt UInt16
) 
Engine = MergeTree()
ORDER BY product_id;

CREATE TABLE IF NOT EXISTS default.shop_dns(
    "date" date,
    product_id UInt32,
    id_shop UInt8,
    sales_cnt UInt16
) 
Engine = MergeTree()
ORDER BY product_id;

CREATE TABLE IF NOT EXISTS default.shop_sitilink(
    "date" date,
    product_id UInt32,
    id_shop UInt8,
    sales_cnt UInt16
) 
Engine = MergeTree()
ORDER BY product_id;

CREATE TABLE IF NOT EXISTS default.plan(
    product_id UInt32,
    id_shop UInt8,
    plan_cnt UInt16,
    plan_date date
) 
Engine = MergeTree()
ORDER BY product_id;