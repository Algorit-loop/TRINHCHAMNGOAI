#include <bits/stdc++.h>
// #include <io.h>
#define ll long long
#define foru(i,a,n) for(int i=a; i<=n; i++)
using namespace std;
const int N = 1e5 + 10;
string name = "CAU3";
string dirI, dirO, dirA, fin, fou, fas;
ifstream cinINP, cinOUT, cinANS;
int a[N] , n;
long long ans = 0;
int main(){
	//Doc thu muc test cham do themis cung cap
    getline(cin, dirI);
    getline(cin, dirO);
    // getline(cin, dirA);

    //Tep input cua test
    fin = dirI + name + ".inp";
    //Tep ra cua thi sinh
    fou = dirO + name + ".out";
    //Tep ra cua test
    fas = dirA + name + ".ans";

    //       Doc va xu ly input cua test nay
    //----------DOC FILE INP---------------
    cinINP.open(fin);
        cinINP >> n;
        for (int i = 1; i <= n; i++) cinINP >> a[i];
   	cinINP.close();
   	//-------------------------------------
   	//----------DOC FILE ANS---------------
   	cinANS.open(fas);
        cinANS >> ans;
    cinANS.close();
    //-------------------------------------
    // Doc file output thi sinh
    if(_access(fou.c_str(), 0)==-1){
        cout <<"Thi sinh khong co file output\n0";
        return 0;
    }
    //----------DOC FILE OUT---------------
    cinOUT.open(fou);
        int u , x;
        cinOUT >> u;
        if (u != ans){
            cout << "SAI SO TIEN\n0";
            return 0;
        }
        vector <int> contain;
        while (cinOUT >> x){
            contain.push_back(x);
            if (x < 1 || x > n){
                cout << "Truy vet sai\n" << 0.5;
                return 0;
            }
        }
        long long h = 0;
        for (auto v : contain) h = h + a[v];
        if (h != ans){
            cout << "Truy vet sai\n" << 0.5;
        }
        else cout << "DUNG ROI, CHUC MUNG BAN\n" << 1.0;
    cinOUT.close();
    //-------------------------------------
    return 1;
}
