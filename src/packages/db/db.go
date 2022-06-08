package db

import(
	"github.com/jinzhu/gorm"
    _ "github.com/jinzhu/gorm/dialects/mysql"
)

type DB struct {
    Host string
    Username string
    Password string
    DBName string
    Connection *gorm.DB
}

func NewDB() *DB {
    return newDB(&DB{
        Host: "host.docker.internal:3366",
        Username: "test",
        Password: "test",
        DBName: "Gourmates",
    })
}

/**
 * func Open(dialect string, args ...interface{}) (db *DB, err error)
 * https://godoc.org/github.com/jinzhu/gorm#Open
 */
func newDB(d *DB) *DB {
    //
    // ex) MySQL
    // https://github.com/go-sql-driver/mysql#examples
    //
    // ex) MySQL Parameters
    // https://github.com/go-sql-driver/mysql#parameters
    db, err := gorm.Open("mysql", d.Username + ":" + d.Password + "@tcp(" + d.Host + ")/" + d.DBName + "?charset=utf8&parseTime=True&loc=Local")
    if err != nil {
        panic(err.Error())
    }
    d.Connection = db
    return d
}

// Begin begins a transaction
func (db *DB) Begin() *gorm.DB {
    return db.Connection.Begin()
}

func (db *DB) Connect() *gorm.DB {
    return db.Connection
}