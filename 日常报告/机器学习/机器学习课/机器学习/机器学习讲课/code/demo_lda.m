%���ÿ����ṩ���ݣ��Ȼ�����άɢ��ͼ��Ȼ����LDA�������ݽ���2ά
%���һ���ɢ��ͼ����ԭ����ͼ�Աȣ�����ά��ı仯��
clear all;
clc;
% %%%%%%%%%%���ݱ�׼������//��һ������
% meanValue = mean(data)';%���ά�����ľ�ֵ
% sd=std(data)';%���׼��
%   for s = 1:m
%     for t = 1:n
%       data(s,t) = (data(s,t) - meanValue(t))/sd(t);
%     end
%   end
data = xlsread('data');
label = xlsread('labels');
reduced_dim= 2;
reduced_data = LDA(data,label,reduced_dim);

figure('name','ԭʼ����');
scatter3(data(:,1),data(:,2),data(:,3),7,label);

figure('name','��ά����');
scatter(reduced_data(:,1),reduced_data(:,2),7,label);