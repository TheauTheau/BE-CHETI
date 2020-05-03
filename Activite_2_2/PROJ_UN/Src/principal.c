	
int tab[64];

int DFT(int, unsigned short *);

extern unsigned short TabSig[64];

int main(void){

	for (int j=0; j<64; j++){
		tab[j] = DFT(j, TabSig);
	}

	while (1) {}

}
