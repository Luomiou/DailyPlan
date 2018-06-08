%pro2:���ÿ����ṩ���ݣ��Ȼ�����άɢ��ͼ��Ȼ����pca��ά�������ݽ���2ά
%���һ���ɢ��ͼ����ԭ����ͼ�Աȣ�����ά��ı仯��
clear all;
clc;
% %%%%%%%%%%���ݱ�׼������
% meanValue = mean(data)';%���ά�����ľ�ֵ
% sd=std(data)';%���׼��
%   for s = 1:m
%     for t = 1:n
%       data(s,t) = (data(s,t) - meanValue(t))/sd(t);
%     end
%   end
data = xlsread('data');
label = xlsread('labels');

figure('name','ԭʼ����');
scatter3(data(:,1),data(:,2),data(:,3),7,label);

finald1 = PCA_1(data,2);
figure('name','��ά����1');
scatter(finald1(:,1),finald1(:,2),7,label);

finald2 = PCA_2(data,0.9);
figure('name','��ά����2');
scatter(finald2(:,1),finald2(:,2),7,label);

%%%%%%%%  PCA����  %%%%
%     score�����ɵ�nά�ӹ�������ݴ���score�
%           ���Ƕ�ԭʼ���ݽ��еķ������������µ�����ϵ�»�õ����ݡ�
%           ����nά���ݰ��������ɴ�С���С������ڸı�����ϵ������£��ֶ�nά��������
%     coef����ϵ������cofe= xת����score
%     latent����һά��������ÿһ�������Ƕ�Ӧscore����Ӧά�Ĺ����ʣ���Ϊ������nά������������n�����ݡ�
%            �ɴ�С���У���ΪscoreҲ�ǰ��������ɴ�С���У���

    %%%%%%%%%%%%%%%%%%%%%%
[coef,score,latent,t2] = princomp(data);
figure('name','��ά����3');
scatter(score(:,1),score(:,2),7,label);