clc, clear

[x,textdata]=xlsread('数据文件9-4 学生考试成绩.xlsx','a1:g53');
cr=corr(x)
%[coeff,latent,explained]=pcacov(cr)     %由相关系数矩阵作分析

[coeff,score,latent,tsquare]=pca(x)   %由观测数据矩阵作分析
percent_explained = 100*latent/sum(latent)  %计算主成分解释比例
%xz=zscore(x);%数据标准化
%[coeff,score,latent,tsquare]=pca(xz)   %由观测数据矩阵作分析
Explained=100*latent/sum(latent)

result(1,:)={'特征值','贡献率','累积贡献率'};
result(2:7,1)=num2cell(latent);
result(2:7,2:3)=num2cell([percent_explained,cumsum(percent_explained)]) %输出表2
stnum=textdata(2:end,1); %提取学生编号
sumX=sum(x,2); %计算总分
result1=cell(53,5);
result1(1,:)={'学生序号','总分','第一主成分得分y1','第二主成分得分y2','综合得分Scr'};
result1(2:end,1)=stnum;
Scr=0.61*score(:,1)+0.21*score(:,2);  %计算主成分综合得分
result1(2:end,2:end)=num2cell([sumX,score(:,1:2),Scr]) %输出表
xlswrite('pcaScr.xls',result1)

figure(1); %前2个主成分的载荷散点图3
plot(coeff(:,1),coeff(:,2),'ko')
xlabel('第一主成分载荷')
ylabel('第二主成分载荷')
title('主成分载荷图')


figure(2); %前2个主成分的得分散点图3
plot(score(:,1),score(:,2),'ko')
xlabel('第一主成分得分')
ylabel('第二主成分得分')
title('主成分得分图')
