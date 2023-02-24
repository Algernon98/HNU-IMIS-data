clc, clear

[x,textdata]=xlsread('�����ļ�9-4 ѧ�����Գɼ�.xlsx','a1:g53');
cr=corr(x)
%[coeff,latent,explained]=pcacov(cr)     %�����ϵ������������

[coeff,score,latent,tsquare]=pca(x)   %�ɹ۲����ݾ���������
percent_explained = 100*latent/sum(latent)  %�������ɷֽ��ͱ���
%xz=zscore(x);%���ݱ�׼��
%[coeff,score,latent,tsquare]=pca(xz)   %�ɹ۲����ݾ���������
Explained=100*latent/sum(latent)

result(1,:)={'����ֵ','������','�ۻ�������'};
result(2:7,1)=num2cell(latent);
result(2:7,2:3)=num2cell([percent_explained,cumsum(percent_explained)]) %�����2
stnum=textdata(2:end,1); %��ȡѧ�����
sumX=sum(x,2); %�����ܷ�
result1=cell(53,5);
result1(1,:)={'ѧ�����','�ܷ�','��һ���ɷֵ÷�y1','�ڶ����ɷֵ÷�y2','�ۺϵ÷�Scr'};
result1(2:end,1)=stnum;
Scr=0.61*score(:,1)+0.21*score(:,2);  %�������ɷ��ۺϵ÷�
result1(2:end,2:end)=num2cell([sumX,score(:,1:2),Scr]) %�����
xlswrite('pcaScr.xls',result1)

figure(1); %ǰ2�����ɷֵ��غ�ɢ��ͼ3
plot(coeff(:,1),coeff(:,2),'ko')
xlabel('��һ���ɷ��غ�')
ylabel('�ڶ����ɷ��غ�')
title('���ɷ��غ�ͼ')


figure(2); %ǰ2�����ɷֵĵ÷�ɢ��ͼ3
plot(score(:,1),score(:,2),'ko')
xlabel('��һ���ɷֵ÷�')
ylabel('�ڶ����ɷֵ÷�')
title('���ɷֵ÷�ͼ')
