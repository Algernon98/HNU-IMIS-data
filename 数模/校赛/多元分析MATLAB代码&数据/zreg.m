
clc, clear
xdata=xlsread('ˮ�����ݣ��ع飩.xls');
xdata=xdata(2:end,2:end);
x=xdata(:,1:7);%��ȡ�Ա������ݾ���
y1=xdata(:,8);%��ȡ��������ݾ���
y2=xdata(:,9);
reglm(y1,x)   


clc, clear
xdata=xlsread('ˮ�����ݣ��ع飩.xls');
xdata=xdata(2:end,2:end);
x=xdata(:,1:7);%��ȡ�Ա������ݾ���
y1=xdata(:,8);%��ȡ��������ݾ���
y2=xdata(:,9);
reglm(y1,x)  %�𲽻ع�
inmodel=1:7;
stepwise(x,y1,inmodel)
b=lasso(x,y1)  %lasso�ع�   Ҳ��������ع�

cr=corr(x)   %�鿴�Ա������ݾ�������ϵ������

y2=xdata(:,9);
reglm(y2,x)
inmodel=1:7;
stepwise(x,y2,inmodel)

b=lasso(x,y2)  %lasso�ع�

%%%%���ɷֻع�
xz=zscore(x);%���ݱ�׼��
[coeff,score,latent,tsquare,explained]=pca(xz)   %�ɹ۲����ݾ���������
z1=score(:,[1:5]);
reglm(y1,z1)%���ֵڶ������ɷֵ÷����������Ӱ�첻������p>0.05��,���ɾ������
z1=score(:,[1 3 4 5]);
reglm(y1,z1)

%��ֻ����ǰ�������ɷ֣�������Ŷȴ�󽵵�
z1=score(:,[1:3]);
reglm(y1,z1)
%�����������ԭʼ�Ա����Ļع鷽��ϵ��
xn=zscore(x);
yn=zscore(y1);
d=xn*coeff;
st=coeff(:,[1 3 4 5])*(d(:,[1 3 4 5])\yn);
st2=[mean(y1)-std(y1)*mean(x)./std(x)*st,std(y1)*st'./std(x)],

%ֱ�ӿ���ǰ�������ɷ�ʱ�Ļع鷽��ʽ
st=coeff(:,[1:3])*(d(:,[1:3])\yn);
st3=[mean(y1)-std(y1)*mean(x)./std(x)*st,std(y1)*st'./std(x)],





%ƫ��С���˻ع�

%ֻ����һ�������ʱ
mu=mean(xdata(:,1:8));sig=std(xdata(:,1:8)); %���ֵ�ͱ�׼��
ab=zscore(xdata(:,1:8)); %���ݱ�׼��
a=ab(:,[1:7]);b1=ab(:,8);
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats]=plsregress(a,b1,7,'cv',10)%�۲��������гɷֶԵ����
ncomp=4; %�������������ѡ��ɷֵĶ���
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats]=plsregress(a,b1,ncomp)
contr=cumsum(PCTVAR,2) %���ۻ�������
n=size(a,2); m=size(b1,2); %n���Ա����ĸ���,m��������ĸ���
BETA2(1,:)=mu(n+1:end)-mu(1:n)./sig(1:n)*BETA([2:end],:).*sig(n+1:end); %ԭʼ���ݻع鷽�̵ĳ�����
BETA2([2:n+1],:)=(1./sig(1:n))'*sig(n+1:end).*BETA([2:end],:) %����ԭʼ�Ա���x1,...,xn��ϵ����ÿһ����һ���ع鷽��


%�������������ʱ
mu=mean(xdata);sig=std(xdata); %���ֵ�ͱ�׼��
ab=zscore(xdata); %���ݱ�׼��
a=ab(:,[1:7]);b=ab(:,8:9);
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats]=plsregress(a,b,7,'cv',10)%�۲��������гɷֶԵ����
contr=cumsum(PCTVAR,2)
ncomp=3; %�������������ѡ��ɷֵĶ���
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats]=plsregress(a,b,ncomp)
contr=cumsum(PCTVAR,2) %���ۻ�������
n=size(a,2); m=size(b,2); %n���Ա����ĸ���,m��������ĸ���
BETA3(1,:)=mu(n+1:end)-mu(1:n)./sig(1:n)*BETA([2:end],:).*sig(n+1:end); %ԭʼ���ݻع鷽�̵ĳ�����
BETA3([2:n+1],:)=(1./sig(1:n))'*sig(n+1:end).*BETA([2:end],:) %����ԭʼ�Ա���x1,...,xn��ϵ����ÿһ����һ���ع鷽��





