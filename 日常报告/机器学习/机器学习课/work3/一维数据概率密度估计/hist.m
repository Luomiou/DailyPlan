function [ y ] = hist( X,h )
%HIST �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
n=length(X);
[n_1]= hist(X,(max(X)-min(X))/h);%n_1Ϊÿ��bin����ĸ���
for i=1:n
    y(i)=n_1/(n*h);
end

end

