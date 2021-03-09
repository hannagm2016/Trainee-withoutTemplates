package routers

import (
	"net/http"
	"github.com/labstack/echo"
    "site/models"
    "fmt"
    "site/session"
    "time"
)
var inMemorySession *session.Session

var  cookie *http.Cookie

// Logout godoc
// @Summary Log out, remove authorisation
// @Description removing cookie, set IsAuthorize as false
// @Tags User
// @Produce  json
// @Success 200 {string} string "successful operation"
// @Failure 500 {string} string "fail"
// @Router /logout [get]
func (h *handler) Logout (c echo.Context) error {
 fmt.Println("Endpoint Hit: logout", cookie)
               cookie=&http.Cookie {
                     Name: COOKIE_NAME,
                     Value: "",
                     Expires: time.Now(),
               }
           c.SetCookie(cookie)
        fmt.Println("Endpoint Hit: logout", cookie)
        return c.String(http.StatusOK, "User logged out")
    }
// Authorisation godoc
// @Summary Authorisation form
// @Description Entering login and pass into authorisation form
// @Tags User
// @Success 200 {string} string "success"
// @Failure 500 {string} string "fail"
// @Router /authorisation [get]
// @Deprecated true
func (h *handler)Authorisation (c echo.Context) error  {
inMemorySession = session.NewSession()
        fmt.Println("Endpoint Hit: authorisation", inMemorySession)
       	return c.Render(http.StatusOK, "authorisation.html", map[string]interface{}{})
    }
// AuthorisationPost godoc
// @Summary Authorisation process
// @Description Creating cookie, set IsAuthorize as true
// @Tags User
// @Accept  json
// @Produce  json
// @Param inputEmail query string true "inputEmail"
// @Param inputPassword query string true "inputPassword"
// @Success 200 {string} string "success"
// @Failure 500 {string} string "fail"
// @Router /authorisationPost [post]
func (h *handler)AuthorisationPost (c echo.Context) error {
inMemorySession = session.NewSession()
        fmt.Println("Endpoint Hit: authorisation", inMemorySession)
    inputEmail:=c.FormValue("inputEmail")
    inputPassword:=c.FormValue("inputPassword")
    fmt.Println(inputPassword, inputEmail)
         sessionId := inMemorySession.Init(inputEmail)
            cookie=&http.Cookie {
                  Name: COOKIE_NAME,
                  Value: sessionId,
                  Expires: time.Now().Add(5*time.Minute),
                   MaxAge:   60 * 60,
            }
       c.SetCookie(cookie)
       fmt.Println("Endpoint Hit: authorisation",cookie)
       return c.String(http.StatusOK, "User authorised, cookie created")
    }
// Registration godoc
// @Summary Registration form
// @Description Creating user, cookie, set IsAuthorize as true
// @Tags User
// @Accept  json
// @Produce  json
// @Success 200 {string} string "ok"
// @Failure 500 {string} string "fail"
// @Router /registration [get]
// @Deprecated true
func (h *handler)Registration(c echo.Context) error {
        fmt.Println("Endpoint Hit: registration")
       	return c.Render(http.StatusOK, "registration.html", map[string]interface{}{})
    }
// RegistrationPost godoc
// @Summary Registration process
// @Description Creating user, cookie, set IsAuthorize as true
// @Tags User
// @Accept  json
// @Produce  json
// @Param inputEmail query string true "inputEmail"
// @Param inputPassword query string true "inputPassword"
// @Param inputName query string true "UserName"
// @Success 200 {string} string "ok"
// @Failure 500 {string} string "fail"
// @Router /registrationPost [post]
func (h *handler)RegistrationPost (c echo.Context) error {
    var user models.User
    user.Name=c.FormValue("inputName")
    user.Email=c.FormValue("inputEmail")
   // inputPassword:=c.FormValue("inputPassword")
  //   h.db.CreateUser(&user)

            sessionId := inMemorySession.Init(user.Email)
            cookie=&http.Cookie {
                  Name: COOKIE_NAME,
                  Value: sessionId,
                  Expires: time.Now().Add(5*time.Minute),
                   MaxAge:   60 * 60,
            }
         c.SetCookie(cookie)
          return c.String(http.StatusOK, "User registrated, cookie created")
    }
