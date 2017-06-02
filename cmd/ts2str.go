package main

import (
	"flag"
	"fmt"
	"strconv"
	"time"
)

func main() {

	flag.Parse()

	for _, ts := range flag.Args() {

		i, err := strconv.ParseInt(ts, 10, 64)

		if err != nil {
			panic(err)
		}

		tm := time.Unix(i, 0)
		fmt.Println(tm)
	}
}
