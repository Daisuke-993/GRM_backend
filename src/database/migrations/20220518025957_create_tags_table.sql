-- +goose Up
-- +goose StatementBegin
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'タグID',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'タグ名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE `tags`;
-- +goose StatementEnd
