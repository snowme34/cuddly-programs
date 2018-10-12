#include<iostream>
#include<fstream>
#include<string>
#include<vector>

using namespace std;

//todo
//safe code
//same name
//unsupported (ANSI) characters in filenames
int main() {
	ifstream dirr;//use dir commend output(stupid but simple)
	dirr.open("dirr.txt");//may be changed to dirr file
	string dirLine;
	
	//from dirr.txt
	vector<string> txtNames;
	int fileTotalNum = 0;
	
	string txtExtension(".txt");
	string beg("beg");
	string dirrS("dirr");
	if (dirr.is_open())
	{
		while (getline(dirr, dirLine))
		{
			if (dirLine.find(txtExtension) != string::npos) {//find a .txt in this line
				if (dirLine.find(dirrS) != string::npos) { continue; }//no dirr.txt
				fileTotalNum++;
				string::iterator itBeg;
				itBeg = dirLine.begin() + dirLine.find(beg);
				string tempName;
				for (itBeg; itBeg != dirLine.end(); itBeg++) {
					tempName += *itBeg;
				}
				txtNames.push_back(tempName);
			}
		}
	}
	else {
		return -1;
	}
	
	//process the file
	for (int fileNum = 0; fileNum < fileTotalNum; fileNum++) {
		ifstream fin;
		fin.open(txtNames[fileNum]);

		string stringToFind("Title: ");
		string fileLine;
		for (unsigned int i = 0; i < 50; i++) {//read the first 50 line of the file opened
			if (fin.eof()) { break; }
			getline(fin, fileLine);
			if (fileLine.find(stringToFind) != string::npos) {//true if stringToFind is a substring of tmp
				string::iterator it0, it1;
				it0 = fileLine.begin() + fileLine.find(stringToFind);
				it1 = it0 + stringToFind.size();
				fileLine.erase(it0, it1);
				fileLine += ".txt";
				ifstream input;
				input.open(txtNames[fileNum]);
				ofstream output(fileLine);
				output << input.rdbuf();
				input.close();
				output.close();
				break;
			}
		}
		fin.close();
	}
	dirr.close();
	return 0;

}

/*int m() {//single file
	cout << "Please type in the number of files to be processed(1):" << endl;
	int fileTotalNum;
	cin >> fileTotalNum;
	cout << "Please type the name of file to be processed:" << endl;
	string txtNames;
	cin >> txtNames;
	for (int fileNum = 0; fileNum < fileTotalNum; fileNum++) {
		ifstream fin;
		fin.open(txtNames);

		string stringToFind("Title: ");
		string fileLine;
		for (unsigned int i = 0; i < 50; i++) {//read the first 50 line of the file opened
			if (fin.eof()) { break; }
			getline(fin, fileLine);
			if (fileLine.find(stringToFind) != string::npos) {//true if stringToFind is a substring of tmp
				string::iterator it0, it1;
				it0 = fileLine.begin() + fileLine.find(stringToFind);//will work?
				it1 = it0 + stringToFind.size();
				fileLine.erase(it0, it1);
				fileLine += ".txt";
				ifstream input;
				input.open(txtNames);
				ofstream output(fileLine);
				output << input.rdbuf();
				input.close();
				output.close();
				break;
			}
		}
		fin.close();
	}
	//dirr.close();
	return 0;
}*/