-- +goose Up
-- +goose StatementBegin
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '画像ID',
  `restaurant_id` bigint(20) unsigned NOT NULL COMMENT '店舗ID',
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '/strage/app以下の画像パス',
  `uploaded_by` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'アップロードしたユーザー',
  `main_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'メイン画像のフラグ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `photos_file_path_unique` (`file_path`),
  KEY `photos_restaurant_id_foreign` (`restaurant_id`),
  KEY `photos_uploaded_by_foreign` (`uploaded_by`),
  CONSTRAINT `photos_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`),
  CONSTRAINT `photos_uploaded_by_foreign` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  ;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE `photos`;
-- +goose StatementEnd
