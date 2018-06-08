% 利用pca对软木塞数据进行降维，降维后，利用KNN进行分类
% 然后通过验证第一主成分的识别率，然后实验验证维度降到多少时，分类效果最佳
% 观察是不是维度越高，分类效果越好呢
clear all;
clc;
data = xlsread('CORK_STOPPERS');
data1 = data(:,3:12);
label=data(:,2);
%%%%%%%%%%数据标准化处理%%%%%%
[M,N] = size(data1);
meanValue = mean(data1)';%求各维特征的均值
sd=std(data1)';%求标准差
  for s = 1:M
    for t = 1:N
      data1(s,t) = (data1(s,t) - meanValue(t))/sd(t);
    end
  end

k=5;
c_rate=0.99;
reduced_dim=2;
FinalData1 = PCA_1(data1,k);
FinalData2 = PCA_2(data1,c_rate);
reduced_data = LDA(data1,label,reduced_dim);