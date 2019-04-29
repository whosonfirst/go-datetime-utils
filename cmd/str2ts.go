package main

import (
	"flag"
	"fmt"
	"log"
	"time"
)

func main() {

	format := flag.String("format", "2006-01-02", "...")
	
	flag.Parse()

	for _, str_t := range flag.Args() {

		t, err := time.Parse(*format, str_t)

		if err != nil {
			log.Fatal(err)
		}
		
		fmt.Println(t.Unix())
	}
}
