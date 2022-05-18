-- +goose Up
-- +goose StatementBegin
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'カテゴリーID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'カテゴリー名',
  `_lft` int(10) unsigned NOT NULL DEFAULT '0',
  `_rgt` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE categories;
-- +goose StatementEnd
