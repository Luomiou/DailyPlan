%利用课堂提供数据，先画出三维散点图，然后用LDA，将数据降到2维
%并且画出散点图，与原数据图对比，看降维后的变化。
clear all;
clc;
% %%%%%%%%%%数据标准化处理//归一化处理
% meanValue = mean(data)';%求各维特征的均值
% sd=std(data)';%求标准差
%   for s = 1:m
%     for t = 1:n
%       data(s,t) = (data(s,t) - meanValue(t))/sd(t);
%     end
%   end
data = xlsread('data');
label = xlsread('labels');
reduced_dim= 2;
reduced_data = LDA(data,label,reduced_dim);

figure('name','原始数据');
scatter3(data(:,1),data(:,2),data(:,3),7,label);

figure('name','降维数据');
scatter(reduced_data(:,1),reduced_data(:,2),7,label);