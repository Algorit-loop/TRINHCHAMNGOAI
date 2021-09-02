#include <iostream>
#include <vector>
#include <stdio.h>
using namespace std;
int n , a[100009];
pair <int,int> trace[100009];
long long dp[100009];
int main()
{
    freopen("CAU3.INP","r",stdin);
    freopen("CAU3.ANS","w",stdout);
    cin >> n;
    for (int i = 1; i <= n; i++) cin >> a[i];
    for (int i = n; i >= 1; i--){
        long long vlad = 0;
        for (int w = i; w <= i + 2; w++){
            vlad = vlad + a[w];
            if (dp[i] < dp[i + (w - i + 1)*2] + vlad){
                dp[i] = dp[i + (w - i + 1)*2] + vlad;
                trace[i] = {i + (w - i + 1)*2,w - i + 1};
            }
        }
    }
    cout << dp[1] << "\n";
    /*
    vector <int> V;
    int pos = 1;
    while (pos <= n){
        for (int i = pos; i <= pos + trace[pos].second - 1; i++)
            V.push_back(i);
        pos = trace[pos].first;
    }
    for (auto x : V) cout << x << " ";
    */
    return 0;
}
