package routers

import (
	"net/http"
	"net/http/httptest"
	"testing"
//"fmt"
"bytes"
	"github.com/labstack/echo"
	"github.com/stretchr/testify/assert"
	"siteNoTemplate/models"
	//"strings"
)

type 	PostsModelStub struct{}


func (u *PostsModelStub) FindAll() []models.Post {
	posts := []models.Post{}
	posts = append (posts, models.Post{
	UserId:1,
	Id:1,
	Title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
	Body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
	})
	return posts
}

func (u *PostsModelStub) FindByID(id float64) models.Post {
	return models.Post{
		UserId:1,
       	Id:1,
       	Title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
       	Body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
       	}

}
func (u *PostsModelStub) SaveByID(post models.Post) models.Post {
//fmt.Println(post)
return models.Post{
		UserId:1,
       	Id:1,
       	Title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
       	Body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
       	}
}

func (u *PostsModelStub) DeleteByID(id float64) []models.Post  {
	posts := []models.Post{}
	posts = append (posts, models.Post{
	UserId:1,
	Id:1,
	Title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
	Body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
	})
	return posts
	}

func TestGetIndex(t *testing.T) {
	e := echo.New()
	req := httptest.NewRequest(echo.GET, "/", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.SetPath("/")
	p := &PostsModelStub{}
	h := NewHandler(p)

	var postJSON = `[{"UserId":1,"Id":1,"Title":"sunt aut facere repellat provident occaecati excepturi optio reprehenderit","Body":"quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto","Comment":null}]`

	if assert.NoError(t, h.Index(c)) {
		assert.Equal(t, http.StatusOK, rec.Code)
		assert.Equal(t, postJSON, rec.Body.String())
	}
}
func TestGetDetail(t *testing.T) {
	e := echo.New()
	req := httptest.NewRequest(echo.GET, "/", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.SetPath("/post/:id")
	c.SetParamNames("id")
	c.SetParamValues("1")

	u := &PostsModelStub{}
	h := NewHandler(u)

	var postJSON = `{"UserId": 1, "Id": 1, "Title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", "Body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto", "Comment": null}`

	if assert.NoError(t, h.ReturnSinglePost(c)) {
		assert.Equal(t, http.StatusOK, rec.Code)
		assert.Equal(t, postJSON, rec.Body.String())
	}
}

func TestSaveByID(t *testing.T) {
var jsonStr = []byte(`{"UserId": 1, "Id": 1, "Title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"}`)

	e := echo.New()
	req := httptest.NewRequest(echo.POST, "/", bytes.NewBuffer(jsonStr))
	//req := httptest.NewRequest(http.MethodPost, "/", strings.NewReader(jsonStr))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.SetPath("/savePost")
	//c.SetParamNames("Title")
	//c.SetParamValues("gkj")

	u := &PostsModelStub{}
	h := NewHandler(u)

	var postJSON = `{"UserId":1,"Id":1,"Title":"sunt aut facere repellat provident occaecati excepturi optio reprehenderit","body":"quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto","Comment":null}`
 	if assert.NoError(t, h.SavePost(c)) {
		assert.Equal(t, http.StatusOK, rec.Code)
		assert.Equal(t, postJSON, rec.Body.String())
	}
}


func TestDeleteByID(t *testing.T) {
var jsonStr = []byte(`[{"UserId": 1, "Id": 1, "Title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", "Body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"}]`)

	e := echo.New()
    	req := httptest.NewRequest(echo.DELETE, "/", bytes.NewBuffer(jsonStr))
    	rec := httptest.NewRecorder()
    	c := e.NewContext(req, rec)
    	c.SetPath("/deletePost/:id")
    	c.SetParamNames("id")
    	c.SetParamValues("1")

    	u := &PostsModelStub{}
    	h := NewHandler(u)

    	var postJSON = "[]\n"

    	if assert.NoError(t, h.DeletePost(c)) {
    		assert.Equal(t, http.StatusOK, rec.Code)
    		assert.Equal(t, postJSON, rec.Body.String())
    	}
    }