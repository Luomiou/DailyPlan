function y=parzen2(X,x,h)
%ȡ��˹����ʱ��parzen window������XΪѵ����������xΪ����������
%����ֵyΪx��Ӧ�ĸ����ܶ�ֵ�ļ���
p=zeros(length(X),1);
for i=1:length(x)
    p=normpdf(X,x(i),h);
    y(i)=sum(p)/length(X);
end