function [reduced_data] = LDA(data,label,reduced_dim)

%B的对角线是特征值（已从小到大排序好），X的列是相应的特征向量
%data是数据，label是数据的标签，k是类别数
U = mean(data);
[M,N] = size(data);

k=length(unique(label));%%%样本集中有几类不同的样本
sb = 0;
sw = 0;
for i = 1:k
    number = find((i-1)==label);%%%找出label为i的样本
    m = length(number);
    u = mean(data(number,:));%%求均值
    sw = sw + cov(data(number,:));%%%求类内的散度，即类内部各点到中心点的距离
    sb = sb + (m/M)*(u-U)'*(u-U);%%%求类间的散度，即各类到样本中心点的距离代替
end

% v=inv(sw)*sb;
v = sb/sw;
[evec,eval]=eig(v);
W=v(:,1:reduced_dim);

reduced_data=data*W;
end

