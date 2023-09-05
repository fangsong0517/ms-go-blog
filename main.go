package main

import (
	"fmt"
	"log"
	"ms-go-blog/common"
	"ms-go-blog/router"
	"net/http"
)

func init() {
	//页面模板加载
	common.LoadTemplate()
}

func main() {
	router.Router()
	//开始启动并监听
	if err := http.ListenAndServe(fmt.Sprintf(":%d", 8889), nil); err != nil {
		log.Fatal(err)
	}
}
