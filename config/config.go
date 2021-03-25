package config

import (
	"fmt"
	"github.com/tkanos/gonfig"
)

type Configuration struct {
	ClientID     string
	ClientSecret string
	RedirectURL  string
}
type DbConnection struct {
	User     string
	Password string
	Protocol string
	Address  string
	Dbname   string
}

func GetConfig(env string) Configuration {
	configuration := Configuration{}
	fileName := fmt.Sprintf("config/%s_config.json", env)
	gonfig.GetConf(fileName, &configuration)
	return configuration
}
func Dbconfig() string {
	dbcon := DbConnection{}
	gonfig.GetConf("config/db_config.json", &dbcon)
	dns := dbcon.User + ":" + dbcon.Password + "@" + dbcon.Protocol + "(" + dbcon.Address + ")/" + dbcon.Dbname
	return dns
}
