function [X,Y,x1,y1,x2,y2]= make_data(m1,c1,m2,c2,n)
%生成多峰高斯分布数据，均值分别为m1,m2,方差分别为，c1,c2
%返回值x1,y1,x2,y2,为分别计算的两组样本及其概率密度,X,Y为合成之后的
x1=normrnd(m1,c1,n/2,1);
x2=normrnd(m2,c2,n/2,1);
X(1:n/2,1)=x1;
X(n/2+1:n,1)=x2;
y1=normpdf(x1,m1,c1);
y2=normpdf(x2,m2,c2);
Y=0.5*normpdf(X,m1,c1)+0.5*normpdf(X,m2,c2);
