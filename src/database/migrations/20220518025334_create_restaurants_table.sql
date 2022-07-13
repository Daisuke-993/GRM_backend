-- SQLBook: Code
-- +goose Up
-- +goose StatementBegin
CREATE TABLE `restaurants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '店舗ID',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店舗名',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店舗住所',
  `tel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '店舗電話番号',
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'WebsiteのURL',
  `data_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'GoogleMapURLのdataに含まれる一意な文字列',
  `place_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'GoogleMapのPlaceID',
  `latitude` double(9,6) NOT NULL COMMENT '緯度',
  `longitude` double(9,6) NOT NULL COMMENT '経度',
  `tabelog_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '食べログのURL',
  `gurunavi_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ぐるなびのURL',
  `smoking` tinyint(1) DEFAULT NULL COMMENT '喫煙可否',
  `seats` int(10) unsigned DEFAULT NULL COMMENT '座席数',
  `lunch_lower_limit` int(10) unsigned DEFAULT NULL COMMENT 'ランチ価格帯下限',
  `lunch_upper_limit` int(10) unsigned DEFAULT NULL COMMENT 'ランチ価格帯上限',
  `dinner_lower_limit` int(10) unsigned DEFAULT NULL COMMENT 'ディナー価格帯下限',
  `dinner_upper_limit` int(10) unsigned DEFAULT NULL COMMENT 'ディナー価格帯上限',
  `created_by` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作成したユーザー',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurants_data_id_unique` (`data_id`),
  UNIQUE KEY `restaurants_place_id_unique` (`place_id`),
  KEY `restaurants_created_by_foreign` (`created_by`),
  CONSTRAINT `restaurants_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE restaurants;
-- +goose StatementEnd
