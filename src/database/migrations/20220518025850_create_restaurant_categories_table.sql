-- +goose Up
-- +goose StatementBegin
CREATE TABLE `restaurant_categories` (
  `restaurant_id` bigint(20) unsigned NOT NULL COMMENT '店舗ID',
  `category_id` bigint(20) unsigned NOT NULL COMMENT 'カテゴリーID',
  UNIQUE KEY `restaurant_categories_restaurant_id_category_id_unique` (`restaurant_id`,`category_id`),
  KEY `restaurant_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `restaurant_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `restaurant_categories_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE `restaurant_categories`;
-- +goose StatementEnd
