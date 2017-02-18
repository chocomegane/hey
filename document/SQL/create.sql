-- 顧客情報テーブル
-- DROP TABLE public.customers;
-- serial -> 自動採番
-- PRIMARY KEY -> 主キー
CREATE TABLE customers (
  id serial PRIMARY KEY
  ,name varchar(255)
  ,password varchar(255)
  ,email varchar(255)
  ,creat_day timestamp
  ,update_day timestamp
);

