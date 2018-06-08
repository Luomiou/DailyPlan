function [FinalData] = PCA_2(data,c_rate)

[m,n] = size(data);%%传入数据data
sig=cov(data);%协方差矩阵
[E,D] = eig(sig);%协方差矩阵的特征值特征向量，D的对角线是特征值，E是D对应的特征向量
eigenvalues = flipud(sort(diag(D)));%特征值从大 -> 小排序

%%%%%%%%%%%%求各个特征值占总体的比重，也就是特征值的贡献率
    summ=0;
    n=0;
for i=1:length(eigenvalues)  
    latent(i)=eigenvalues(i)./sum(eigenvalues);
    summ=summ+ latent(i);
    if(summ<=c_rate)
        n=n+1;
    end    
end   
eigenvector=fliplr(E);%特征向量按从大 -> 小排序
FinalData = data*eigenvector(:,1:n);%n维特征，选取前k个特征
end


    