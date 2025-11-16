CREATE TABLE "gender" (
  "gender_id" int PRIMARY KEY,
  "gender_name" varchar(20) UNIQUE NOT NULL
);

CREATE TABLE "car_ownership" (
  "car_ownership_id" int PRIMARY KEY,
  "ownership_status" varchar(10) UNIQUE NOT NULL
);

CREATE TABLE "wealth_segments" (
  "wealth_segment_id" int PRIMARY KEY,
  "segment_name" varchar(50) UNIQUE NOT NULL
);

CREATE TABLE "industry_categories" (
  "industry_category_id" int PRIMARY KEY,
  "category_name" varchar(100) UNIQUE NOT NULL
);

CREATE TABLE "brands" (
  "brand_id" int PRIMARY KEY,
  "brand_name" varchar(100) UNIQUE NOT NULL
);

CREATE TABLE "product_lines" (
  "product_line_id" int PRIMARY KEY,
  "line_name" varchar(50) UNIQUE NOT NULL
);

CREATE TABLE "product_classes" (
  "product_class_id" int PRIMARY KEY,
  "class_name" varchar(20) UNIQUE NOT NULL
);

CREATE TABLE "product_sizes" (
  "product_size_id" int PRIMARY KEY,
  "size_name" varchar(20) UNIQUE NOT NULL
);

CREATE TABLE "order_statuses" (
  "order_status_id" int PRIMARY KEY,
  "status_name" varchar(50) UNIQUE NOT NULL
);

CREATE TABLE "addresses" (
  "address_id" int PRIMARY KEY,
  "street_address" varchar(255) NOT NULL,
  "postcode" int NOT NULL,
  "state" varchar(50) NOT NULL,
  "country" varchar(50) NOT NULL DEFAULT 'Australia'
);

CREATE TABLE "jobs" (
  "job_id" int PRIMARY KEY,
  "job_title" varchar(100),
  "industry_category_id" int
);

CREATE TABLE "customers" (
  "customer_id" int PRIMARY KEY,
  "first_name" varchar(100) NOT NULL,
  "last_name" varchar(100),
  "gender_id" int,
  "date_of_birth" date,
  "deceased_indicator" char(1) NOT NULL DEFAULT 'N',
  "owns_car_id" int,
  "address_id" int,
  "job_id" int,
  "wealth_segment_id" int,
  "property_valuation" int
);

CREATE TABLE "products" (
  "product_id" int PRIMARY KEY,
  "brand_id" int,
  "product_line_id" int,
  "product_class_id" int,
  "product_size_id" int,
  "list_price" decimal(10,2) NOT NULL,
  "standard_cost" decimal(10,2) NOT NULL
);

CREATE TABLE "transactions" (
  "transaction_id" int PRIMARY KEY,
  "customer_id" int NOT NULL,
  "product_id" int NOT NULL,
  "transaction_date" date NOT NULL,
  "online_order" char(1),
  "order_status_id" int NOT NULL
);

ALTER TABLE "customers" ADD FOREIGN KEY ("gender_id") REFERENCES "gender" ("gender_id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "customers" ADD FOREIGN KEY ("owns_car_id") REFERENCES "car_ownership" ("car_ownership_id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "customers" ADD FOREIGN KEY ("address_id") REFERENCES "addresses" ("address_id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "customers" ADD FOREIGN KEY ("job_id") REFERENCES "jobs" ("job_id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "customers" ADD FOREIGN KEY ("wealth_segment_id") REFERENCES "wealth_segments" ("wealth_segment_id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "jobs" ADD FOREIGN KEY ("industry_category_id") REFERENCES "industry_categories" ("industry_category_id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "products" ADD FOREIGN KEY ("brand_id") REFERENCES "brands" ("brand_id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "products" ADD FOREIGN KEY ("product_line_id") REFERENCES "product_lines" ("product_line_id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "products" ADD FOREIGN KEY ("product_class_id") REFERENCES "product_classes" ("product_class_id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "products" ADD FOREIGN KEY ("product_size_id") REFERENCES "product_sizes" ("product_size_id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "transactions" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("customer_id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "transactions" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("product_id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "transactions" ADD FOREIGN KEY ("order_status_id") REFERENCES "order_statuses" ("order_status_id") ON DELETE RESTRICT ON UPDATE CASCADE;


