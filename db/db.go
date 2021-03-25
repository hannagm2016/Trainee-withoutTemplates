package db

import (
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"site/config"
)

func DBConnect() *gorm.DB {

	dsn := config.Dbconfig ()
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}
	return db
}
