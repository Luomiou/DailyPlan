function [ y ] = hist( X,h )
%HIST 此处显示有关此函数的摘要
%   此处显示详细说明
n=length(X);
[n_1]= hist(X,(max(X)-min(X))/h);%n_1为每个bin里面的个数
for i=1:n
    y(i)=n_1/(n*h);
end

end

