package main

import (
  "fmt"
  "io/ioutil"
  "log"
  "net/http"
)

func main() {
  //fs := http.FileServer(http.Dir("./static"))
  //http.Handle("/", fs)
  http.HandleFunc("/dir", func(w http.ResponseWriter, r *http.Request) {
    d, _ := ioutil.ReadDir("./")
    for _, v := range d {
      fmt.Printf("%v<br>\n", v.Name())
    }
  })

  err := http.ListenAndServe(":3000", nil)
  if err != nil {
    log.Fatal(err)
  }
}
