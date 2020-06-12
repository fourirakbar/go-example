package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"time"
)

func currentDate(w http.ResponseWriter, r *http.Request) {
	t := time.Now()
	d := t.Day()
	mon := t.Month()
	fullPath := fmt.Sprintf("http://numbersapi.com/%d/%d/date", mon, d)

	resp, err := http.Get(fullPath)
	if err != nil {
		log.Fatalln(err)
	}

	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatalln(err)
	}

	fmt.Fprintf(w, string(body))
}

func main() {
	http.HandleFunc("/", currentDate)
	http.ListenAndServe(":3000", nil)
}
