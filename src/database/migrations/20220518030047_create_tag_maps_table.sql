-- +goose Up
-- +goose StatementBegin
CREATE TABLE `tag_maps` (
  `restaurant_id` bigint(20) unsigned NOT NULL COMMENT '店舗ID',
  `tag_id` bigint(20) unsigned NOT NULL COMMENT 'タグID',
  UNIQUE KEY `tag_maps_restaurant_id_tag_id_unique` (`restaurant_id`,`tag_id`),
  KEY `tag_maps_tag_id_foreign` (`tag_id`),
  CONSTRAINT `tag_maps_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`),
  CONSTRAINT `tag_maps_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE `tag_maps`;
-- +goose StatementEnd
