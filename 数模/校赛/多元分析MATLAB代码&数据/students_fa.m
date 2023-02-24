clc, clear
[x,textdata]=xlsread('�����ļ�9-4 ѧ�����Գɼ�.xlsx','a1:g53');
cr=corr(x)  %�����ϵ������

[v,e]=eig(cr)   % ���ϵ�����������������������
[lambda,psi,t,stats,F]=factoran(x,2)    %�����غ����������ӵķ����ת����ģ�ͼ�����Ϣ��ͳ����
%[lambda,psi,t,stats]=factoran(x,2,'delta',0)     %���ⷽ���½�Ϊ0

Contribute=100*sum(lambda.^2)/6    %���㹱���ʣ������غ������Ԫ��֮�ͳ���ά��
Cumcon=cumsum(Contribute)   %�����ۼƹ�����


stnum=textdata(2:end,1); %��ȡѧ�����
sumX=sum(x,2); %�����ܷ�
result1=cell(53,4);
stnum=textdata(2:53,1); %��ȡѧ�����
sumX=sum(x,2); %�����ܷ�
result0=num2cell([lambda,psi]);
head={'����','����f1','����f2','���ⷽ��'};
varname={'��ѧ����','�ߵȴ���','������','΢�ּ���','�������','��ֵ����'}' ;
result2=[head;varname,result0]   %�����4
result3=cell(53,5);
result3(1,:)={'ѧ�����','�ܷ�','����f1�÷�','����f2�÷�','�ۺ����ӵ÷�Fy'};
result3(2:end,1)=stnum;
Fy=0.41*F(:,1)+0.33*F(:,2)  %���������ۺϵ÷�
result3(2:end,2:end)=num2cell([sumX,F(:,1:2),Fy])  %�����
xlswrite('faScr.xls',result3)

figure(1);%�����ӵ÷�ɢ��ͼ4
plot(F(:,1),F(:,2),'ro')  
xlabel('���������ӵ÷�')
ylabel('���վ����ӵ÷�')
gname(stnum)   %����ʽ��עѧ�����



