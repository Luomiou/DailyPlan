clc
clear
Data = xlsread('Fish.xlsx');%0代表鲈鱼，1代表鲑鱼
Data_luyu = Data(1:500,1:2);
Data_guiyu = Data(501:1000,1:2);
%鲈鱼各属性均值
luyu_avg=mean(Data_luyu,1);
%鲑鱼各属性均值
guiyu_avg=mean(Data_guiyu,1);

Sigma1=cov(Data_luyu(:,1),Data_luyu(:,2));
Sigma2=cov(Data_guiyu(:,1),Data_guiyu(:,2));
x=-5:0.1:15;
y=-5:0.1:15;
[X,Y]=meshgrid(x,y); 
p1=mvnpdf([X(:),Y(:)],luyu_avg,Sigma1);
P1=reshape(p1,size(X));%改变概率密度矩阵形状
p2=mvnpdf([X(:),Y(:)],guiyu_avg,Sigma2);
P2=reshape(p2,size(X)); 
%画图
mesh(X,Y,P1);
hold on
mesh(X,Y,P2);