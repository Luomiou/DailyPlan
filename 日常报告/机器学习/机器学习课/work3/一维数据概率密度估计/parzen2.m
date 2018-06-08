function y=parzen2(X,x,h)
%取高斯函数时的parzen window方法，X为训练样本集，x为待测样本集
%返回值y为x对应的概率密度值的集合
p=zeros(length(X),1);
for i=1:length(x)
    p=normpdf(X,x(i),h);
    y(i)=sum(p)/length(X);
end