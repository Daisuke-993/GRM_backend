-- SQLBook: Code
-- +goose Up
-- +goose StatementBegin
CREATE TABLE `restaurant_user_reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint(20) unsigned NOT NULL COMMENT '店舗ID',
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ユーザーID',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'レビューのテキスト本文',
  `rating` int(10) unsigned NOT NULL DEFAULT '5' COMMENT 'ユーザーの評価',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `review_id` (`restaurant_id`,`user_id`),
  KEY `restaurant_user_reviews_user_id_foreign` (`user_id`),
  CONSTRAINT `restaurant_user_reviews_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`),
  CONSTRAINT `restaurant_user_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE `restaurant_user_reviews`;
-- +goose StatementEnd
