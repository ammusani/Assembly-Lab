#include<iostream>
#include <cinttypes>
#include<unordered_map>
#include<unordered_set>
#include<numeric>
#include<map>
#include<vector>
#include<string>
#include<cctype>
#include<cmath>
#include<ctime>
#include<queue>
#include<fstream>
#include<algorithm>
#include<climits>
#include<assert.h>
#include<cstring>
#include<iterator>
#include<stack>
#include<cstdlib>
#include<set>
#include<cstdio>
#include<bitset>
#include<tuple>
#include<iomanip>
#include<cstdint>
#define mod 1000000007
#define boast ios_base::sync_with_stdio(false);cin.tie(NULL)
#define outl(n) printf("%lld\n",n)
#define outs(n) printf("%lld ",n)
#define out(n) printf("%lld",n)
#define line printf("\n")
#define no_ans printf("-1\n")
#define zerol printf("0\n")
#define zeros printf("0 ")
#define zero printf("0")
#define mid (l+r)/2
#define usual int64_t i,j,k,a,b,c,n,m,x,y,z,x1,y1,z1,x2,y2,z2,l,r
#define G(a,b) get<a>(b)
#define mem(a) memset(a,0,sizeof(a))
#define mem1(a) memset(a,-1,sizeof(a))
#define all(a) a.begin(),a.end()
#define calc_time() cout<<(double)clock()/CLOCKS_PER_SEC<<endl
#define deb(a) cout<<a<<":::"<<endl
using namespace std;
const int64_t N=1e5+7,M=2e5+7;
int64_t IX=1e18,IN=-1e14;
int64_t ten[]={1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000,10000000000,100000000000,1000000000000,10000000000000};
vector<int64_t> s_match,prime_v,factorial;
set<int64_t> prime_s;
int64_t scan(int64_t &a,int64_t &b=IX,int64_t &c=IX){
    scanf("%lld",&a);
    if(b!=IX)
        scan(b,c);
    return a;
}
int64_t Q(int64_t a,int64_t b,int64_t c){
    if(b==0){
        return (int64_t)1;
    }
    if(b&1){
        return (Q(a,b-1,c)*a)%c;
    }
    int64_t value=Q(a,b>>1,c);
    return (value*value)%c;
}
int64_t power(int64_t a,int64_t b,int64_t c){
    if(b==0)
        return 1;
    else if(b%2==1)
        return (a*power(a,b-1,c))%c;
    int64_t value=power(a,b/2,c)%c;
    return (value*value)%c;
}
void find_prime(int64_t n){
    vector<bool> visited(n,1);
    int64_t i,j;
    for(i=2;i<n;i++){
        if(visited[i]){
            prime_v.push_back(i);
            prime_s.insert(i);
            for(j=2*i;j<n;j+=i)
                visited[j]=0;
        }
    }
}
void fact(int64_t n){
    factorial.push_back((int64_t)1);
    int64_t i;
    for(i=1;i<=n;i++){
        factorial.push_back(factorial.back()*i);
    }
}
int64_t inverse(int64_t a){
    return power(a,mod-2,mod)%mod;
}
int64_t gcd(int64_t a,int64_t b){
    if(a<b){
        swap(a,b);
    }
    if(b==0){
        return a;
    }
    return gcd(b,a%b);
}
int64_t extend_gcd(int64_t a,int64_t b,int64_t &x,int64_t &y){
    if(b==0){
        x=1;
        y=0;
        return a;
    }
    int64_t p,q,ans;
    ans=extend_gcd(b,a%b,p,q);
    y=p-(a/b)*q;
    x=q;
    return ans;
}
int64_t lcm(int64_t a,int64_t b){
    return (a*b)/gcd(a,b);
}
int64_t MAXI(int64_t a1,int64_t a2,int64_t a3,int64_t a4=IN,int64_t a5=IN,int64_t a6=IN,int64_t a7=IN){
    return max(a1,max(a2,max(a3,max(a4,max(a5,max(a6,a7))))));
}
bool K_matcher(string p,string q){
    int64_t i,k,num[N],flag=0;
    num[0]=-1;
    k=-1;
    for(i=1;i<p.size();i++){
        while(k>-1&&p[k+1]!=p[i])
            k=num[k];
        if(p[k+1]==p[i])
            k++;
        num[i]=k;
    }
    k=-1;
    for(i=0;i<q.size();i++){
        while(k>-1&&p[k+1]!=q[i])
            k=num[k];
        if(p[k+1]==q[i])
            k++;
        if(k==p.size()-1){
            s_match.push_back(i-p.size()+1);
            //cout<<"match found at"<<i-p.size()+1<<endl;
            k=num[k];
            flag=1;
        }
    }
    if(flag)
        return 1;
    else
        return 0;

}
int64_t X[]={1,0,-1,0},Y[]={0,-1,0,1};


map<string,string> mapping,mapping_address;
map<string,bool> flag;
vector<string> get_strings(string s,int64_t index){
    vector<string> v;
    string r="";
    int64_t i;
    s=s+",";
    for(i=index;i<s.size();i++){
        if(s[i]==','){
            v.push_back(r);
            r="";
        }
        else{
            r=r+string(1,s[i]);
        }
    }
    return v;
}
bool saved_registers(string s){
    int64_t i;
    for(i=10;i<=17;i++){
        if(s=="#"+to_string(i)){
            return true;
        }
    }
    return false;
}
bool temperory_registers(string s){
    int64_t i;
    for(i=0;i<=9;i++){
        if(s=="#"+to_string(i)){
            return true;
        }
    }
    return false;
}
bool argument_registers(string s){
    int64_t i;
    for(i=20;i<=23;i++){
        if(s=="#"+to_string(i)){
            return true;
        }
    }
    return false;
}
int64_t convert(string s){
    int64_t i,j=0,start=0;
    if(s[0]=='-'){
        start=1;
    }
    for(i=start;i<s.size();i++){
        j=j*10+(s[i]-'0');
    }
    if(!start){
        return j;
    }
    else{
        return -j;
    }
}
vector<string> break_into_string(string s){
    string r;
    int64_t i;
    vector<string> v;
    for(i=0;i<s.size();i++){
        if(s[i]=='('){
            break;
        }
        r=r+string(1,s[i]);
    }
    if(r==""){
        v.push_back("0");
    }
    else{
        v.push_back(r);
    }
    r="";
    for(++i;i<s.size();i++){
        if(s[i]==')'){
            break;
        }
        r=r+string(1,s[i]);
    }
    v.push_back(r);
    return v;
}
int main(){
    ifstream fin;
    ofstream fout;
    fin.open("input.txt");
    fout.open("output.cpp");
    int64_t i;
    string s,r;
    int64_t mflo,mfhi;
    vector<string> v,u;
    fout<<"#include<iostream>"<<endl;
    fout<<"using namespace std;"<<endl;
    fout<<"int main(){"<<endl;
    for(i=0;i<32;i++){
        s="#"+to_string(i);
        fout<<"int "<<"v"+to_string(i)<<"=0"<<";"<<endl;
        fout<<"int *"<<"a"+to_string(i)<<"=new int[107];"<<endl;     
        mapping[s]="v"+to_string(i);                            // is a string here that will denote a variable here
        flag[s]=0;
        mapping_address[s]="a"+to_string(i);
    }
    fout<<"int mfhi;"<<endl;
    fout<<"int mflo;"<<endl;
    while(getline(fin,s)){
        r="";
        for(i=0;i<s.size();i++){
            if(s[i]==' '){
                break;
            }
            r=r+string(1,s[i]);
        }
        int64_t space_index=i;
        v=get_strings(s,++i);
        if(r=="ADD"){
            //add the check function for temperory and argument registers
            assert(argument_registers(v[0])||temperory_registers(v[0]));
            if(v.size()==2){
                if(flag[v[1]]){
                    fout<<mapping_address[v[0]]<<"="<<mapping_address[v[1]]<<";"<<endl;
                    flag[v[0]]=1;
                }
                else{
                    fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<";"<<endl;
                }
            }
            else if(v.size()==3){
                if(flag[v[1]]){
                    fout<<mapping_address[v[0]]<<"="<<mapping_address[v[1]]<<"+"<<mapping[v[2]]<<";"<<endl;
                    flag[v[0]]=1;
                }
                else{
                    fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"+"<<mapping[v[2]]<<";"<<endl;
                }
            }
        }
        else if(r=="ADDS"){
            //check for saved registers
            assert(saved_registers(v[0]));
            if(v.size()==2){
                if(flag[v[1]]){
                    fout<<mapping_address[v[0]]<<"="<<mapping_address[v[1]]<<";"<<endl;
                    flag[v[0]]=1;
                }
                else{
                    fout<<mapping[v[0]]<<"="<<mapping[v[0]]<<";"<<endl;
                }
            }
            else if(v.size()==3){
                if(flag[v[1]]){
                    fout<<mapping_address[v[0]]<<"="<<mapping_address[v[1]]<<"+"<<mapping[v[2]]<<";"<<endl;
                    flag[v[0]]=1;
                }
                else{
                    fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"+"<<mapping[v[2]]<<";"<<endl;
                }
            }
        }
        else if(r=="SUB"){
            //check for temperory and argument registers
            assert(argument_registers(v[0])||temperory_registers(v[0]));
            if(v.size()==3){
                if(flag[v[1]]){
                    fout<<mapping_address[v[0]]<<"="<<mapping_address[v[1]]<<"-"<<mapping[v[2]]<<";"<<endl;
                    flag[v[0]]=1;
                }
                else{
                    fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"-"<<mapping[v[2]]<<";"<<endl;
                }
            }
        }
        else if(r=="SUBS"){
            //check for saved registers
            assert(saved_registers(v[0]));
            if(v.size()==3){
                if(flag[v[1]]){
                    fout<<mapping_address[v[0]]<<"="<<mapping_address[v[1]]<<"-"<<mapping[v[2]]<<";"<<endl;
                    flag[v[0]]=1;
                }
                else{
                    fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"-"<<mapping[v[2]]<<";"<<endl;
                }
            }
        }
        else if(r=="MUL"){
            //check for temperory and argument registers
            assert(argument_registers(v[0])||temperory_registers(v[0]));
            assert(!flag[v[1]]&&!flag[v[2]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"*"<<mapping[v[2]]<<";"<<endl;
        }
        else if(r=="MULS"){
            //check for saved registers
            assert(saved_registers(v[0]));
            assert(!flag[v[1]]&&!flag[v[2]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"*"<<mapping[v[2]]<<";"<<endl;
        }
        else if(r=="DIV"){
            //check for temperory and argument registers
            assert(argument_registers(v[0])||temperory_registers(v[0]));
            if(v.size()==2){
                assert(!flag[v[0]]&&!flag[v[1]]);
                fout<<"mfhi="<<mapping[v[0]]<<"%"<<mapping[v[1]]<<";"<<endl;
                fout<<"mflo="<<mapping[v[0]]<<"/"<<mapping[v[0]]<<";"<<endl;
            }
            else if(v.size()==3){
                assert(!flag[v[1]]&&!flag[v[2]]);
                fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"/"<<mapping[v[2]]<<";"<<endl;
            }
        }
        else if(r=="DIVS"){
            //check for saved registers
            assert(saved_registers(v[0]));
            assert(!flag[v[1]]&&!flag[v[2]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"/"<<mapping[v[2]]<<";"<<endl;
        }
        else if(r=="AND"){
            //check for temperory and argument registers
            assert(argument_registers(v[0])||temperory_registers(v[0]));
            assert(!flag[v[1]]&&!flag[v[2]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"&"<<mapping[v[2]]<<";"<<endl;
        }
        else if(r=="ANDS"){
            //check for saved registers
            assert(saved_registers(v[0]));
            assert(!flag[v[1]]&&!flag[v[2]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"&"<<mapping[v[2]]<<";"<<endl;
        }
        else if(r=="OR"){
            //check for temperory and argument registers
            assert(argument_registers(v[0])||temperory_registers(v[0]));
            assert(!flag[v[1]]&&!flag[v[2]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"|"<<mapping[v[2]]<<";"<<endl;
        }
        else if(r=="ORS"){
            //check for saved registers
            assert(!flag[v[1]]&&!flag[v[2]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"|"<<mapping[v[2]]<<";"<<endl;
        }
        else if(r=="XOR"){
            //check for temperory and argument registers
            assert(argument_registers(v[0])||temperory_registers(v[0]));
            assert(!flag[v[1]]&&!flag[v[2]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"^"<<mapping[v[2]]<<";"<<endl;
        }
        else if(r=="XORS"){
            //check for saved registers
            assert(saved_registers(v[0]));
            assert(!flag[v[1]]&&!flag[v[2]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"^"<<mapping[v[2]]<<";"<<endl;
        }
        else if(r=="NOT"){
            //check for temeperory and argument registers
            assert(argument_registers(v[0])||temperory_registers(v[0]));
            assert(!flag[v[1]]);
            fout<<mapping[v[0]]<<"=~"<<mapping[v[1]]<<";"<<endl;
        }
        else if(r=="NOTS"){
            //check for saved registers
            assert(saved_registers(v[0]));
            assert(!flag[v[1]]);
            fout<<mapping[v[0]]<<"=~"<<mapping[v[1]]<<";"<<endl;
        }
        else if(r=="MFHI"){
            fout<<mapping[v[0]]<<"=mfhi;"<<endl;
        }
        else if(r=="MFLO"){
            fout<<mapping[v[0]]<<"=mflo;"<<endl;
        }
        else if(r=="SLT"){
            assert(!flag[v[1]]&&!flag[v[2]]);
            fout<<mapping[v[0]]<<"=("<<mapping[v[1]]<<"<"<<mapping[v[2]]<<");"<<endl;   
        }
        else if(r=="ADDI"){
            assert(!flag[v[1]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"+"<<"("<<convert(v[2])<<")"<<";"<<endl;
        }
        else if(r=="MULI"){
            assert(!flag[v[1]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"*"<<"("<<convert(v[2])<<")"<<";"<<endl;
        }
        else if(r=="ANDI"){
            assert(!flag[v[1]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"&"<<"("<<convert(v[2])<<")"<<";"<<endl;
        }
        else if(r=="ORI"){
            assert(!flag[v[1]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"|"<<"("<<convert(v[2])<<")"<<";"<<endl;
        }
        else if(r=="XORI"){
            assert(!flag[v[1]]);
            fout<<mapping[v[0]]<<"="<<mapping[v[1]]<<"^"<<"("<<convert(v[2])<<")"<<";"<<endl;
        }
        else if(r=="SLTI"){
            assert(!flag[v[1]]);
            fout<<mapping[v[0]]<<"=("<<mapping[v[1]]<<"<"<<"("<<convert(v[2])<<")"<<");"<<endl;
        }
        else if(r=="SLL"){
            assert(!flag[v[1]]);
            fout<<mapping[v[0]]<<"=("<<mapping[v[1]]<<"<<"<<"("<<convert(v[2])<<")"<<";"<<endl;
        }
        else if(r=="SRL"){
            assert(!flag[v[1]]);
            fout<<mapping[v[0]]<<"=("<<mapping[v[1]]<<">>"<<"("<<convert(v[2])<<")"<<";"<<endl;
        }
        else if(r=="LA"){
            assert(!flag[v[1]]);
            fout<<mapping_address[v[0]]<<"=&"<<mapping[v[1]]<<";"<<endl;
            flag[v[0]]=1;
        }
        else if(r=="LW"){
            u=break_into_string(v[1]);
            assert(flag[u[1]]);
            fout<<mapping[v[0]]<<"="<<mapping_address[u[1]]<<"["<<stoi(u[0])<<"]"<<";"<<endl;
        }
        else if(r=="print"){
            if(!flag[v[0]]);
            fout<<"cout<<"<<mapping[v[0]]<<"<<endl;"<<endl;
        }
        else if(r=="SW"){
            u=break_into_string(v[1]);
            assert(flag[u[1]]);
            fout<<mapping_address[u[1]]<<"["<<stoi(u[0])<<"]"<<"="<<mapping[v[0]]<<endl;
        }
        else if(r=="J"){
            fout<<"goto "<<v[0]<<";"<<endl;
        }
        else if(r=="BEQ"){
            fout<<"if("<<mapping[v[0]]<<"=="<<mapping[v[1]]<<"){"<<endl;
            fout<<"goto "<<v[2]<<";"<<endl;
            fout<<"}"<<endl;
        }
        else{
            fout<<r<<";"<<endl;
        }
    }
    fout<<"}"<<endl;
    /*s="g++ -o output output.cpp";
    system(s.c_str());
    s="./output";
	system(s.c_str());
    s="g++ -c output.cpp";
    system(s.c_str());
    s="rm output.cpp";
    system(s.c_str());*/
    return 0;
}