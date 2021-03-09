package session
import (
    "site/utils"
    "fmt"
)

type sessionData struct {
	Username string
	IsAuthorized bool
}

type Session struct {
	data map[string]*sessionData

}

func NewSession() *Session {
	s := new(Session)

	s.data = make(map[string]*sessionData)

	return s
}

func (s *Session) Init(username string) string {
	sessionId := utils.GenerateId()

	data := &sessionData{Username: username, IsAuthorized: true}
	s.data[sessionId] = data
fmt.Println(data.IsAuthorized)
	return sessionId
}
func (s *Session) Get(sessionId string) string {
	data := s.data[sessionId]

	if data == nil {
		return ""
	}

	return data.Username
}