package entity

import "time"

type User struct {
	ID         string
	Name       string
	Email      string
	Provider   string
	ProviderId string
	Avatar     string
	CreatedAt  time.Time
	UpdatedAt  time.Time
}
