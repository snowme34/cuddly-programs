#include<fstream>
#include<iostream>
#include<string>
using namespace std;
int main()
{
	ifstream fin;
	fin.open("in.txt");
	ofstream fout;
	fout.open("out.txt");
	if (fin.is_open())
	{
		string line;
		while (!fin.eof())
		{
			fin >> line;
			int cont = 0;
			for (auto tmp : line)
			{
				if (tmp == '.')
				{
					cont++;
				}
			}
			if (cont >= 3)//find an ip address
			{
				fout << line << '\n';
			}
			else {
				continue;
			}
		}
		fin.close();
	} else {
		fout << "Unable to open file" << endl;
		return -1;
	}
	fout.close();
	return 0;
}