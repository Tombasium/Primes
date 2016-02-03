#include <iostream>
//<ctime> is included ready to include a timer to compare execution times between C++, python and eventually assembly on like systems
#include <ctime>
#include <math.h>

float num = 1;

// This function is pulled out from the main and determines whether or not the number under examination is prime.
int primeDetermine(int num){
	for (int i = 2; i <= sqrt(num); ++i){
		if((num%i) == 0){
			std::cout << num << " is NOT\n";
			return 0;
		}	
	}
	std::cout << num << " is prime\n";
	return 0;
}

int main(){
	
	while (1){
		primeDetermine(num);
		if(num<3){
			++num;
		} else {
			num += 2;
		}
	}
	return 0;
}
