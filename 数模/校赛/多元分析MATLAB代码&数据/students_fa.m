clc, clear
[x,textdata]=xlsread('数据文件9-4 学生考试成绩.xlsx','a1:g53');
cr=corr(x)  %求相关系数矩阵

[v,e]=eig(cr)   % 相关系数矩阵的特征根与特征向量
[lambda,psi,t,stats,F]=factoran(x,2)    %因子载荷阵，特殊因子的方差，旋转矩阵，模型检验信息的统计量
%[lambda,psi,t,stats]=factoran(x,2,'delta',0)     %特殊方差下界为0

Contribute=100*sum(lambda.^2)/6    %计算贡献率，因子载荷阵的列元素之和除以维数
Cumcon=cumsum(Contribute)   %计算累计贡献率


stnum=textdata(2:end,1); %提取学生编号
sumX=sum(x,2); %计算总分
result1=cell(53,4);
stnum=textdata(2:53,1); %提取学生编号
sumX=sum(x,2); %计算总分
result0=num2cell([lambda,psi]);
head={'变量','因子f1','因子f2','特殊方差'};
varname={'数学分析','高等代数','概率论','微分几何','抽象代数','数值分析'}' ;
result2=[head;varname,result0]   %输出表4
result3=cell(53,5);
result3(1,:)={'学生序号','总分','因子f1得分','因子f2得分','综合因子得分Fy'};
result3(2:end,1)=stnum;
Fy=0.41*F(:,1)+0.33*F(:,2)  %计算因子综合得分
result3(2:end,2:end)=num2cell([sumX,F(:,1:2),Fy])  %输出表
xlswrite('faScr.xls',result3)

figure(1);%画因子得分散点图4
plot(F(:,1),F(:,2),'ro')  
xlabel('基础课因子得分')
ylabel('开闭卷因子得分')
gname(stnum)   %交互式标注学生序号



