%pro2:利用课堂提供数据，先画出三维散点图，然后用pca降维，将数据降到2维
%并且画出散点图，与原数据图对比，看降维后的变化。
clear all;
clc;
% %%%%%%%%%%数据标准化处理
% meanValue = mean(data)';%求各维特征的均值
% sd=std(data)';%求标准差
%   for s = 1:m
%     for t = 1:n
%       data(s,t) = (data(s,t) - meanValue(t))/sd(t);
%     end
%   end
data = xlsread('data');
label = xlsread('labels');

figure('name','原始数据');
scatter3(data(:,1),data(:,2),data(:,3),7,label);

finald1 = PCA_1(data,2);
figure('name','降维数据1');
scatter(finald1(:,1),finald1(:,2),7,label);

finald2 = PCA_2(data,0.9);
figure('name','降维数据2');
scatter(finald2(:,1),finald2(:,2),7,label);

%%%%%%%%  PCA解释  %%%%
%     score：生成的n维加工后的数据存在score里。
%           它是对原始数据进行的分析，进而在新的坐标系下获得的数据。
%           将这n维数据按贡献率由大到小排列。（即在改变坐标系的情况下，又对n维数据排序）
%     coef：是系数矩阵，cofe= x转换成score
%     latent：是一维列向量，每一个数据是对应score里相应维的贡献率，因为数据有n维所以列向量有n个数据。
%            由大到小排列（因为score也是按贡献率由大到小排列）。

    %%%%%%%%%%%%%%%%%%%%%%
[coef,score,latent,t2] = princomp(data);
figure('name','降维数据3');
scatter(score(:,1),score(:,2),7,label);