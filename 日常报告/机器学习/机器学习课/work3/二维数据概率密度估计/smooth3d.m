function y=smooth3d(X,x,h)
%ȡ���Ⱥ���ʱ��parzen window������XΪѵ����������xΪ����������
%����ֵyΪx��Ӧ�ĸ����ܶ�ֵ�ļ���
n=length(x);
for i=1:n
    m=0;
    for j=1:length(X)
         m = m + gaussian3d(X(j,:),x(i,:),h);
    end
    y(i)= m/(length(X)*h*h);
end