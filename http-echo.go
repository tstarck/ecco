/* http-echo.go
 */

package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
)

const LogT string = `%s: %s [%s] %s "%s %s"`

const RespT string = `{
  "name": "%s",
  "addr": "%s",
  "host": "%s",
  "proto": "%s",
  "method": "%s",
  "path": "%s"
}`

var name string

func init() {
	log.SetFlags(log.Ldate | log.Lmicroseconds | log.LUTC)
	flag.StringVar(&name, "n", "noname", "Instance name")
	flag.Parse()
}

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		log.Printf(LogT, name, r.RemoteAddr, r.Host, r.Proto, r.Method, r.URL.Path)
		fmt.Fprintf(w, RespT, name, r.RemoteAddr, r.Host, r.Proto, r.Method, r.URL.Path)
	})

	log.Printf("Running `%s` and listening port 8000\n", name)

	http.ListenAndServe(":8000", nil)
}
