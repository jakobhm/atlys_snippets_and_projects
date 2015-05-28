#include <iostream>
#include <vector>
#include <cctype>

using namespace std;

typedef vector<unsigned char> Vec;


int main(int argc, char** arcv)
{
	int err = 0;
	try{
		Vec bytes;	
		for(unsigned int i = 1; i < argc; ++i)
		{
			unsigned char c1= toupper(arcv[i][0]);
			unsigned char c2= toupper(arcv[i][1]); 
			if( 48 <= c1 )		c1 -= 48;
			else throw "Ungültige Zahl!";
			if( 48 <= c2 )	  	c2 -= 48;
			else throw "Ungültige Zahl!";

			if( 17 <= c1 )		c1 -= 7;
			if( 17 <= c2 )	  	c2 -= 7;
		
			if( 15 <  c1 || 15 < c2 ) 
				throw "Ungültige Zahl!";

			bytes.push_back(c1*0x10 + c2);		
		}
		if( bytes.size() % 2 )	bytes.push_back(0);

		cout << "Die Eingabe war OK!"  << endl;

		unsigned int sum = 0;
		for(unsigned int i = 0; i < bytes.size()/2; ++i)
		{
			sum += bytes[2*i]*0x100 + bytes[2*i+1];
		}

		cout << "Die Summe ist: " << hex << sum << endl;  
		while( sum / 0x10000 ) 
			sum = (sum / 0x10000) + (sum % 0x10000);
	
		const char *answer = (~sum % 0x10000) == 0 ? "Paket OK!!" : "Paket fehlerhaft!!";
		cout << endl << answer << endl;
		cout << "Checksum = " << hex << ~sum % 0x10000 << endl;
	}
	catch(const char * e)
	{
		err = 1;
		cerr << "ERROR: " << e << endl;
	}

	return err;
}
