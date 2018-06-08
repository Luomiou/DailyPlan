%概率密度：0.5*N(1,2)+0.5*N(5,1)
%%%%%%%%%%%%%%%%%%生成数据%%%%%%%%%%%%%%%%%%%%%%%%%%%%
u1=1;u2=5; %实验数据均值 
u=[u1 u2];        
covar=2;               %协方差
covar(:,:,2)=1;
p_c=[1 1];            %混合数据之间比例
N_c=1000;             %样本总数
[X,N] = build_mix_1D_gaussian( u,covar,p_c,N_c );
Y2 = 0.5*normpdf(X,u1,sqrt(covar(:,:,1)))+0.5*normpdf(X,u2,sqrt(covar(:,:,2)));
figure(1),
plot(X,Y2,'b.');



%%%%%%%%%%%%%%%%画概率直方图%%%%%%%%%%%%%%%%%%%%%%%%%%
width=0.3;        %样条宽度
[n]= hist(X,(max(X)-min(X))/width);          %样条数=(max(X)-min(X))/width，n:落在每个bin中样本的个数
pp = n /1000;        %每个bin样本的频率                  
figure(2),
% subplot(2,2,1);
bar(pp);
hold on;               



%%%%%%%%%%%%%将直方图拟合为概率密度曲线%%%%%%%%%%%%%%%%
% width=0.1;
% subplot(2,2,2);
% [n]= hist(X,(max(X)-min(X))/width);
% %样条数=(max(X)-min(X))/width
% pp = n/1000;        %频率
Y=[min(X):width:(max(X)-width)];
p = polyfit(Y,pp/width,12);       %对估计每个点的概率密度，并拟合概率密度曲线
f = polyval(p,Y);
figure(3)
plot(Y,f,'g.');
hold on;
plot(Y,pp/width,'r');  %频率/样条宽度（步长）
title('0.1');

