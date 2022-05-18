-- +goose Up
-- +goose StatementBegin
CREATE TABLE `restaurant_user_states` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `restaurant_id` bigint(20) unsigned NOT NULL COMMENT '店舗ID',
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ユーザーID',
  `excellent_type` enum('excellent_type','none','excellent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none' COMMENT '良かったの状態',
  `state_type` enum('state_type','none','want','went') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none' COMMENT '行きたい・行ったの状態',
  PRIMARY KEY (`id`),
  KEY `restaurant_user_states_restaurant_id_foreign` (`restaurant_id`),
  KEY `restaurant_user_states_user_id_foreign` (`user_id`),
  CONSTRAINT `restaurant_user_states_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`),
  CONSTRAINT `restaurant_user_states_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE `restaurant_user_states`;
-- +goose StatementEnd
