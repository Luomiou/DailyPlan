% function [Pos,P,S,TY] = classify(perch_test,salmon_test,A,C )
%CLASSIFY函数的意义在于分别计算长度和亮度的一维分类结果，画出后验概率密度图以及获得分类结果的正确率和错误率
%输入参数：perch_test表示鲈鱼的测试样本集
%         salmon_test表示三文鱼的测试样本集
%A作为一个结构体，该结构体包括了对训练样本进行参数估计的结果
%         A.sigma_perch_train_length——鲈鱼训练样本长度的方差
%         A.mul_perch_train_length——鲈鱼训练样本长度的均值
%         A.sigma_salmon_train_length——三文鱼训练样本长度的方差
%         A.mul_salmon_train_length——三文鱼训练样本长度的均值
%C作为一个结构体，包含了计算类条件概率的系数
%输出参数：Pos作为一个结构体，包含了计算的所有后验概率值
%Pos = 
%           posterior_perch_length——鲈鱼长度样本分到鲈鱼类别的后验概率
%     posterior_pervssalmon_length——鲈鱼长度样本分到三文鱼类别的后验概率

%          posterior_salmon_length——三文鱼长度样本分到三文鱼类别的后验概率
%      posterior_salvsperch_length——三文鱼长度样本分到鲈鱼类别的后验概率

%          P作为一个结构体，包含了鲈鱼作为测试样本分类的正确率和错误率
%          S作为一个结构体，包含了三文鱼作为测试样本分类的正确率和错误率
%          TY作为一个结构体，包含了鲈鱼和三文鱼的测试样本的类条件概率
p1=0.5;
p2=1-p1;
%利用鲈鱼的5000个测试样本集合
%鲈鱼的长度
TY.y_perch_length=C.a_perch_train_length*gaussmf(perch_test(:,1),[A.sigma_perch_train_length A.mul_perch_train_length]);%将鲈鱼的测试样本分给鲈鱼的类条件概率
TY.y_per_vssalmon_length=C.a_salmon_train_length*gaussmf(perch_test(:,1),[A.sigma_salmon_train_length A.mul_salmon_train_length]);%将鲈鱼的测试样本分给三文鱼的类条件概率
Pos.posterior_perch_length=TY.y_perch_length*p1./(TY.y_perch_length*p1+TY.y_per_vssalmon_length*p2);%将鲈鱼的测试样本分给鲈鱼的后验概率
Pos.posterior_pervssalmon_length=TY.y_per_vssalmon_length*p2./(TY.y_perch_length*p1+TY.y_per_vssalmon_length*p2);%将鲈鱼的测试样本分给三文鱼的后验概率
figure(3)
subplot(2,2,1);
plot(perch_test(:,1),Pos.posterior_perch_length,'b.');
hold on
plot(perch_test(:,1),Pos.posterior_pervssalmon_length,'r*');
legend('p(鲈鱼|鲈鱼测试样本)','p(三文鱼|鲈鱼测试样本 )');
xlabel('鲈鱼长度测试样本');
ylabel('后验概率');
title('长度 后验概率曲线');

%利用三文鱼的5000个测试样本集合
%三文鱼的长度
TY.y_salmon_length=C.a_salmon_train_length*gaussmf(salmon_test(:,1),[A.sigma_salmon_train_length A.mul_salmon_train_length]);
TY.y_sal_vsperch_length=C.a_perch_train_length*gaussmf(salmon_test(:,1),[A.sigma_perch_train_length A.mul_perch_train_length]);
Pos.posterior_salmon_length=TY.y_salmon_length*p2./(TY.y_salmon_length*p2+TY.y_sal_vsperch_length*p1);
Pos.posterior_salvsperch_length=TY.y_sal_vsperch_length*p1./(TY.y_salmon_length*p2+TY.y_sal_vsperch_length*p1);
figure(3)
subplot(2,2,2);
plot(salmon_test(:,1),Pos.posterior_salmon_length,'b.');
hold on
plot(salmon_test(:,1),Pos.posterior_salvsperch_length,'r*');
legend('p(三文鱼|三文鱼测试样本)','p(鲈鱼|三文鱼测试样本)');
xlabel('三文鱼长度测试样本');
ylabel('后验概率');
title('长度 后验概率曲线');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%对测试样本进行分类，并计算分类的正确率和错误率
%鲈鱼的5000个长度测试样本
Ap_length=TY.y_perch_length-TY.y_per_vssalmon_length; % TY作为一个结构体，类条件概率
%若在矩阵A中找出大于零的数值的个数，该个数表明将鲈鱼分到鲈鱼的正确的样本数
%若在矩阵A中找出小于零的数值的个数，该个数表明将鲈鱼分到三文鱼的错误的样本数
P.pc_length=sum(Ap_length(:)>0)/size(Ap_length,1);%表示以鲈鱼长度测试样本集作为分类样本，分类的正确率
P.pw_length=sum(Ap_length(:)<0)/size(Ap_length,1);%表示以鲈鱼长度测试样本集作为分类样本，分类的错误率
%即表示把根据鲈鱼长度，把鲈鱼分到三文鱼的样本的个数占比 
%三文鱼的5000个长度测试样本
As_length=TY.y_salmon_length-TY.y_sal_vsperch_length;
S.sc_length=sum(As_length(:)>0)/size(As_length,1);%表示以三文鱼长度测试样本集作为分类样本，分类的正确率
S.sw_length=sum(As_length(:)<0)/size(As_length,1);
% end

