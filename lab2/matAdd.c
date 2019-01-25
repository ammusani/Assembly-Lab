#include<stdio.h>
int main() {
	int n = 12;
	int a[n][n];
	int b[n][n];
	int c[n][n];
	int k = 1;
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < n; j++) {
			a[i][j] = 0;
			b[i][j] = 0;
			a[i][j] += k;
			k += i + j;
			b[i][j] += k;
			c[i][j] = a[i][j] + b[i][j];
			k++;
		}
	}
	return 0;
}		 
