package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"
	"main/entity"
	"main/graph/generated"
	"main/graph/model"
	"strconv"
)

func (r *queryResolver) User(ctx context.Context, id string) (*model.User, error) {
	idn, err := strconv.Atoi(id)
	if err != nil {
		return nil, err
	}
	var u entity.User

	res := r.DB.Find(&u, idn)
	if err := res.Error; err != nil {
		return nil, err
	}

	return &model.User{
		ID:     u.ID,
		Name:   u.Name,
		Avatar: u.Avatar,
	}, nil
}

func (r *queryResolver) RestaurantList(ctx context.Context) (*model.RestaurantList, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *queryResolver) Restaurant(ctx context.Context, restaurantID string) (*model.Restaurant, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *queryResolver) ReviewList(ctx context.Context, restaurantID string) (*model.ReviewList, error) {
	panic(fmt.Errorf("not implemented"))
}

// Query returns generated.QueryResolver implementation.
func (r *Resolver) Query() generated.QueryResolver { return &queryResolver{r} }

type queryResolver struct{ *Resolver }

// !!! WARNING !!!
// The code below was going to be deleted when updating resolvers. It has been copied here so you have
// one last chance to move it out of harms way if you want. There are two reasons this happens:
//  - When renaming or deleting a resolver the old code will be put in here. You can safely delete
//    it when you're done.
//  - You have helper methods in this file. Move them out to keep these resolver files clean.
func (r *queryResolver) Restaurants(ctx context.Context) ([]*model.Restaurant, error) {
	panic(fmt.Errorf("not implemented"))
}

type mutationResolver struct{ *Resolver }
