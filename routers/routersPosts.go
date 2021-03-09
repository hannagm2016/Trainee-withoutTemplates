package routers

import (
	"net/http"
	"github.com/labstack/echo"
    "siteNoTemplate/models"
    "fmt"
    "strconv"
)
const (
    COOKIE_NAME ="sessionId"
)
var Posts []models.Post

type handler struct {
	PostModel models.PostModelImpl
}

func NewHandler (p models.PostModelImpl) *handler {
	return &handler{p}
}
// Index godoc
// @Summary Show all post
// @Description all posts
// @Tags Posts
// @Accept  json
// @Produce  json
// @Success 200 {array} models.Post
// @Failure 500 {string} string "fail"
// @Router / [get]
func (h *handler) Index(c echo.Context) error {
	Posts = h.PostModel.FindAll()
	var Model models.BaseModel
	 cookie,_=c.Cookie(COOKIE_NAME)
    	    if cookie != nil{
    	 Model.IsAuthorized=true}
    	 Model.Posts=Posts
    	  fmt.Println("Endpoint Hit: Index" )
	return c.JSON(http.StatusOK, Posts)
}
// ReturnSinglePost godoc
// @Summary Show single post with id specified
// @Description get post by ID
// @Tags Posts
// @Accept  json
// @Produce  json
// @Param id path float64 true "post id"
// @Success 200 {object} models.Post
// @Failure 404 {string} ot found
// @Router /post/{id} [get]
func (h *handler) ReturnSinglePost(c echo.Context) error {
	id := c.Param("id")
	key,_:= strconv.ParseFloat(string(id), 64)
	post := h.PostModel.FindByID(key)
	 fmt.Println("Endpoint Hit: OnePost" , post.Id)
	return c.XMLPretty(http.StatusOK, post, " ")
}

// DeletePost godoc
// @Summary Delete one post with id specified
// @Description delete post by ID
// @Tags Posts
// @Accept  json
// @Produce  json
// @Param id path float64 true "post id"
// @Success 200 {string} string "success"
// @Failure 403 {string} string "not registered"
// @Failure 404 {string} string "not found"
// @Router /deletePost/{id} [delete]
func (h *handler) DeletePost(c echo.Context) error {
/*	cookie,_=c.Cookie(COOKIE_NAME)
    	    if cookie == nil{

             return  c.String(http.StatusForbidden, "Not registered")
    	    }*/
	id := c.Param("id")
	key,_:= strconv.ParseFloat(string(id), 64)
	fmt.Println(id, "+++")
	h.PostModel.DeleteByID(key)
 fmt.Println("Endpoint Hit: DeletePost" , id)
 for index, post := range Posts {//Removing from Posts variable
                 if post.Id == key {
                     Posts = append(Posts[:index], Posts[index+1:]...)
                 }
               }

 	return c.JSON(http.StatusOK, Posts)
	//return  c.String(http.StatusOK, "Post removed from db")
}
// SavePost godoc
// @Summary Save new or updated post
// @Description Save post to db
// @Tags Posts
// @Accept  json
// @Produce  json
// @Param id query string false "post id"
// @Param body body string false "post body"
// @Param userId query string false "post UserId"
// @Success 200 {string} string "success - redirect to index"
// @Failure 500 {string} string "fail"
// @Router /savePost [post]
func (h *handler) SavePost(c echo.Context) error {
form := new(models.Post)

               if err := c.Bind(form); err != nil {
                   return c.JSON(http.StatusBadRequest, err)
               }

               post := models.Post{
               UserId: form.UserId,
                   Title: form.Title,
                   Id:    form.Id,
                   Body: form.Body,
               }

              h.PostModel.SaveByID(post)

	 fmt.Println("Endpoint Hit: InsertrPost")
     return   c.JSON(http.StatusOK, post)
          }

// CreateNewPost godoc
// @Summary Form for creation new post
// @Description Form for creation new post
// @Tags Posts
// @Accept  json
// @Produce  xml
// @Param id path int true "Post ID"
// @Success 200 {string} string "success - redirect to save post"
// @Failure 403 {string} string "not registered"
// @Failure 404 {string} string "not found"
// @Router /post [get]
// @Deprecated true
func (h *handler) CreateNewPost(c echo.Context) error  {
cookie,_=c.Cookie(COOKIE_NAME)
fmt.Println(cookie,"***")
	    if cookie ==nil{
           return c.Redirect(http.StatusMovedPermanently, "/")
	    }
	     fmt.Println("Endpoint Hit: CreateNewPost")
                     	return c.Render(http.StatusOK, "create.html", map[string]interface{}{})
    }
// EditPost godoc
// @Summary Form for updating post
// @Description Get post and edit it
// @Tags Posts
// @Accept  json
// @Produce  json
// @Param id path float64 true "post id"
//@Success 200 {string} string "success - redirect to save post"
// @Failure 403 {string} string "not registered"
// @Failure 404 {string} string "not found"
// @Router /postUpdate/{id} [get]
// @Deprecated true
 func (h *handler) EditPost (c echo.Context) error {
 cookie,_=c.Cookie(COOKIE_NAME)
 fmt.Println(cookie)

 	    if cookie == nil{
             return c.Redirect(http.StatusMovedPermanently, "/")
 	    }
           id:= c.Param("id")
               key,_:= strconv.ParseFloat(string(id), 64)
post := h.PostModel.FindByID(key)
 fmt.Println("Endpoint Hit: EditPost" , post.Id)
                       	return c.Render(http.StatusOK, "create.html", post)

 }
