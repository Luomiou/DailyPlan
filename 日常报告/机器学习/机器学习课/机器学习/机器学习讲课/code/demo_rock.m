% ����pca����ľ�����ݽ��н�ά����ά������KNN���з���
% Ȼ��ͨ����֤��һ���ɷֵ�ʶ���ʣ�Ȼ��ʵ����֤ά�Ƚ�������ʱ������Ч�����
% �۲��ǲ���ά��Խ�ߣ�����Ч��Խ����
clear all;
clc;
data = xlsread('CORK_STOPPERS');
data1 = data(:,3:12);
label=data(:,2);
%%%%%%%%%%���ݱ�׼������%%%%%%
[M,N] = size(data1);
meanValue = mean(data1)';%���ά�����ľ�ֵ
sd=std(data1)';%���׼��
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