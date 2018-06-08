clc
clear
Data = xlsread('Fish.xlsx');%0代表鲈鱼，1代表鲑鱼
Data_luyu = Data(1:500,1:2);
Data_guiyu = Data(501:1000,1:2);
%鲈鱼各属性均值
luyu_avg=mean(Data_luyu,1);
%鲑鱼各属性均值
guiyu_avg=mean(Data_guiyu,1);
%鲈鱼各属性方差
luyu_var=var(Data_luyu,1);
%鲑鱼各属性方差
guiyu_var=var(Data_guiyu,1);
%鲈鱼均值方差信息
message_luyu=[luyu_avg,luyu_var];
%鲑鱼均值方差信息
message_guiyu=[guiyu_avg,guiyu_var];
p_luyu=0.4;
p_guiyu=0.6;
for i=1:500
   x5(i,1)=( 1/sqrt(2*pi*luyu_var(1,1)))*exp(-((Data_luyu(i,1)-luyu_avg(1,1))^2)/(2*luyu_var(1,1)));
   y5(i,1)=( 1/sqrt(2*pi*luyu_var(1,2)))*exp(-((Data_luyu(i,2)-luyu_avg(1,2))^2)/(2*luyu_var(1,2)));
   x6(i,1)=( 1/sqrt(2*pi*luyu_var(1,1)))*exp(-((Data_guiyu(i,1)-guiyu_avg(1,1))^2)/(2*guiyu_var(1,1)));
   y6(i,1)=( 1/sqrt(2*pi*luyu_var(1,2)))*exp(-((Data_guiyu(i,2)-guiyu_avg(1,2))^2)/(2*guiyu_var(1,2)));
end
% 产生维高斯分布数据
%x1=normrnd(message_luyu(1,1),sqrt(message_luyu(1,3)),2000,1);
%y1=normrnd(message_luyu(1,2),sqrt(message_luyu(1,4)),2000,1);
%x2=normrnd(message_guiyu(1,1),sqrt(message_guiyu(1,3)),2000,1);
%y2=normrnd(message_guiyu(1,2),sqrt(message_guiyu(1,4)),2000,1);

Sigma1=cov(x5,y5);
Sigma2=cov(x6,y6);
% 产生网格数据并处理 
x=0:0.5:10; %x、y根据均值方差来确定，原则是确保图形完整的呈现在画面中
y=0:0.5:10;
[X,Y]=meshgrid(x,y); 
p1=mvnpdf([X(:),Y(:)],luyu_avg,Sigma1);
P1=reshape(p1,size(X));%改变概率密度矩阵形状
p2=mvnpdf([X(:),Y(:)],guiyu_avg,Sigma2);
P2=reshape(p2,size(X)); 
%画图
mesh(X,Y,P1);
hold on
mesh(X,Y,P2);



