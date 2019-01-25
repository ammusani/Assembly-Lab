#include<stdio.h>
int main() {
	int a = 11;
	switch(a%2) {
		case 0: {
			if(a == 2) a += 2;
			else a += 1;
			break;
		}
		case 1: {
			int flag = 1;
			for(int i = 3; i < a / 2 + 1; i += 2) if(a % i == 0) {
				flag = 0;
				break;
			}
			if(flag) a += 1;
			else {
				flag = 0;
				for(; flag == 0; a += 2) {
					flag = 1;
					for(int j = 3; j <= a / 2; j++) if(a % j == 0) {
						flag = 0;
						break;
					}
				}
			}
			break;
		}
	}
	return 0;
}
