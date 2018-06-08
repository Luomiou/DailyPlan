%data是传入数据，k为选取前k个特征成分
%FinalData是降维后得到的数据
function [FinalData] = PCA_1(data,k)

[m,n] = size(data);%%传入数据data
sig=cov(data);%协方差矩阵
[E,D] = eig(sig);%协方差矩阵的特征值特征向量，D的对角线是特征值，E是D对应的特征向量
eigenvalues = flipud(sort(diag(D)));%特征值从大 -> 小排序
eigenvector=fliplr(E);%特征向量按从大 -> 小排序
FinalData = data*eigenvector(:,1:k);%n维特征，选取前k个特征
end