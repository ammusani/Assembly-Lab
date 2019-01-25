#include<stdio.h>
int main() {
	int a[50];
	a[0] = 2;
	int count = 1;
	for(int i = 3; i < 100; i += 2) {
		int flag = 1;
		for(int j = 3; j < i / 2 + 1; j++) if(i % j == 0) {
			flag = 0;
			break;
		}
		if(flag) {
			a[count] = i;
			count++;
		}
	}
	return 0;
}
