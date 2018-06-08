function y=smooth3d(X,x,h)
%取均匀函数时的parzen window方法，X为训练样本集，x为待测样本集
%返回值y为x对应的概率密度值的集合
n=length(x);
for i=1:n
    m=0;
    for j=1:length(X)
         m = m + gaussian3d(X(j,:),x(i,:),h);
    end
    y(i)= m/(length(X)*h*h);
end