package main

func main() {
    print[int]([]int{1,2,3,4})
}


func print[T any](slice []T) {
	fmt.Print("Generic: ")
	for _, v := range slice {
		fmt.Print(v, " ")
	}
	fmt.Print("\n")
}
