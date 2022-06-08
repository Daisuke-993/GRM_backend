package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"

	"main/graph"
	"main/graph/generated"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"

	//"github.com/jinzhu/gorm"
	//_ "github.com/jinzhu/gorm/dialects/mysql"
	"main/packages/db"
	"time"
)

var e = createMux()

type Category struct {
	Id   int    `json:"id"`
	Name string `json:"name"`
	// _lft       int       `json:"_lft"`
	// _rgt       int       `json:"_rgt"`
	Parent_id  int       `json:"parent_id"`
	Created_at time.Time `json:"created_at"`
	Updated_at time.Time `json:"updated_at"`
}

var category Category

func main() {
	e.GET("/", articleIndex)
	e.GET("/testDB", testDB)

	graphqlHandler := handler.NewDefaultServer(
		generated.NewExecutableSchema(
			generated.Config{Resolvers: &graph.Resolver{}},
		),
	)
	playgroundHandler := playground.Handler("GraphQL", "/query")

	e.POST("/query", func(c echo.Context) error {
		graphqlHandler.ServeHTTP(c.Response(), c.Request())
		return nil
	})

	e.GET("/playground", func(c echo.Context) error {
		playgroundHandler.ServeHTTP(c.Response(), c.Request())
		return nil
	})

	e.Logger.Fatal(e.Start(":8080"))
}

func createMux() *echo.Echo {
	e := echo.New()

	e.Use(middleware.Recover())
	e.Use(middleware.Logger())
	e.Use(middleware.Gzip())

	return e
}

func articleIndex(c echo.Context) error {
	return c.String(http.StatusOK, "Hello, World!")
}

func testDB(c echo.Context) error {
	categories := []Category{}
	db.NewDB().Connection.Find(&categories)
	return c.JSON(http.StatusOK, categories)
}
