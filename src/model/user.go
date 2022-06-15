package model

import (
	"main/entity"
	"time"
)

type User struct {
	ID         string    `json:"id"`
	Name       string    `json:"name"`
	Email      string    `json:"email"`
	Provider   string    `json:"provider"`
	ProviderId string    `json:"provider_id"`
	Avatar     string    `json:"avatar"`
	CreatedAt  time.Time `json:"created_at"`
	UpdatedAt  time.Time `json:"updated_at"`
}

func NewUserFromEntity(e *entity.User) *User {
	return &User{
		ID:     e.ID,
		Name:   e.Name,
		Avatar: e.Avatar,
	}
}
