function [reduced_data] = LDA(data,label,reduced_dim)

%B�ĶԽ���������ֵ���Ѵ�С��������ã���X��������Ӧ����������
%data�����ݣ�label�����ݵı�ǩ��k�������
U = mean(data);
[M,N] = size(data);

k=length(unique(label));%%%���������м��಻ͬ������
sb = 0;
sw = 0;
for i = 1:k
    number = find((i-1)==label);%%%�ҳ�labelΪi������
    m = length(number);
    u = mean(data(number,:));%%���ֵ
    sw = sw + cov(data(number,:));%%%�����ڵ�ɢ�ȣ������ڲ����㵽���ĵ�ľ���
    sb = sb + (m/M)*(u-U)'*(u-U);%%%������ɢ�ȣ������ൽ�������ĵ�ľ������
end

% v=inv(sw)*sb;
v = sb/sw;
[evec,eval]=eig(v);
W=v(:,1:reduced_dim);

reduced_data=data*W;
end

