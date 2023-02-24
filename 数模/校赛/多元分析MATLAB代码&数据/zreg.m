
clc, clear
xdata=xlsread('水污数据（回归）.xls');
xdata=xdata(2:end,2:end);
x=xdata(:,1:7);%读取自变量数据矩阵
y1=xdata(:,8);%读取因变量数据矩阵
y2=xdata(:,9);
reglm(y1,x)   


clc, clear
xdata=xlsread('水污数据（回归）.xls');
xdata=xdata(2:end,2:end);
x=xdata(:,1:7);%读取自变量数据矩阵
y1=xdata(:,8);%读取因变量数据矩阵
y2=xdata(:,9);
reglm(y1,x)  %逐步回归
inmodel=1:7;
stepwise(x,y1,inmodel)
b=lasso(x,y1)  %lasso回归   也可以用岭回归

cr=corr(x)   %查看自变量数据矩阵的相关系数矩阵

y2=xdata(:,9);
reglm(y2,x)
inmodel=1:7;
stepwise(x,y2,inmodel)

b=lasso(x,y2)  %lasso回归

%%%%主成分回归
xz=zscore(x);%数据标准化
[coeff,score,latent,tsquare,explained]=pca(xz)   %由观测数据矩阵作分析
z1=score(:,[1:5]);
reglm(y1,z1)%发现第二个主成分得分量对因变量影响不显著（p>0.05）,因而删除它！
z1=score(:,[1 3 4 5]);
reglm(y1,z1)

%若只考虑前三个主成分，则拟合优度大大降低
z1=score(:,[1:3]);
reglm(y1,z1)
%计算因变量对原始自变量的回归方程系数
xn=zscore(x);
yn=zscore(y1);
d=xn*coeff;
st=coeff(:,[1 3 4 5])*(d(:,[1 3 4 5])\yn);
st2=[mean(y1)-std(y1)*mean(x)./std(x)*st,std(y1)*st'./std(x)],

%直接考虑前三个主成分时的回归方程式
st=coeff(:,[1:3])*(d(:,[1:3])\yn);
st3=[mean(y1)-std(y1)*mean(x)./std(x)*st,std(y1)*st'./std(x)],





%偏最小二乘回归

%只考虑一个因变量时
mu=mean(xdata(:,1:8));sig=std(xdata(:,1:8)); %求均值和标准差
ab=zscore(xdata(:,1:8)); %数据标准化
a=ab(:,[1:7]);b1=ab(:,8);
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats]=plsregress(a,b1,7,'cv',10)%观测整体所有成分对的情况
ncomp=4; %根据整体情况，选择成分的对数
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats]=plsregress(a,b1,ncomp)
contr=cumsum(PCTVAR,2) %求累积贡献率
n=size(a,2); m=size(b1,2); %n是自变量的个数,m是因变量的个数
BETA2(1,:)=mu(n+1:end)-mu(1:n)./sig(1:n)*BETA([2:end],:).*sig(n+1:end); %原始数据回归方程的常数项
BETA2([2:n+1],:)=(1./sig(1:n))'*sig(n+1:end).*BETA([2:end],:) %计算原始自变量x1,...,xn的系数，每一列是一个回归方程


%考虑所有因变量时
mu=mean(xdata);sig=std(xdata); %求均值和标准差
ab=zscore(xdata); %数据标准化
a=ab(:,[1:7]);b=ab(:,8:9);
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats]=plsregress(a,b,7,'cv',10)%观测整体所有成分对的情况
contr=cumsum(PCTVAR,2)
ncomp=3; %根据整体情况，选择成分的对数
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats]=plsregress(a,b,ncomp)
contr=cumsum(PCTVAR,2) %求累积贡献率
n=size(a,2); m=size(b,2); %n是自变量的个数,m是因变量的个数
BETA3(1,:)=mu(n+1:end)-mu(1:n)./sig(1:n)*BETA([2:end],:).*sig(n+1:end); %原始数据回归方程的常数项
BETA3([2:n+1],:)=(1./sig(1:n))'*sig(n+1:end).*BETA([2:end],:) %计算原始自变量x1,...,xn的系数，每一列是一个回归方程





