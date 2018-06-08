% function [C,Y] = K_cp(perch_train,salmon_train)
%K_CP函数的主要功能就是通过获得的参数估计值，获取训练样本的类条件概率值
%输入参数：perch_train,salmon_train分别表示鲈鱼和三文鱼的训练样本
%输出参数： Y作为一个结构体，该结构体包含了训练样本的类条件概率值
%           Y.y_perch_train_length——鲈鱼训练样本长度对应的类条件概率
%           Y.y_perch_train_bri——鲈鱼训练样本亮度对应的类条件概率
%           Y.y_salmon_train_length——三文鱼训练样本长度对应的类条件概率
%           Y.y_salmon_train_bri——三文鱼训练样本亮度对应的类条件概率
%          C作为一个结构体，包含了计算类条件概率的系数
%鲈鱼perch的类条件概率
%鲈鱼的长度
[A] = para_esti( perch_train,salmon_train );
C.a_perch_train_length=1/(sqrt(2*pi)*A.sigma_perch_train_length);
Y.y_perch_train_length=C.a_perch_train_length*gaussmf(perch_train(:,1),[A.sigma_perch_train_length A.mul_perch_train_length]);
%鲈鱼的亮度
C.a_perch_train_bri=1/(sqrt(2*pi)*A.sigma_perch_train_bri);
Y.y_perch_train_bri=C.a_perch_train_bri*gaussmf(perch_train(:,2),[A.sigma_perch_train_bri A.mul_perch_train_bri]);
%三文鱼salmon的类条件概率
%三文鱼的长度
C.a_salmon_train_length=1/(sqrt(2*pi)*A.sigma_salmon_train_length);
Y.y_salmon_train_length=C.a_salmon_train_length*gaussmf(salmon_train(:,1),[A.sigma_salmon_train_length A.mul_salmon_train_length]);
%三文鱼的亮度
C.a_salmon_train_bri=1/(sqrt(2*pi)*A.sigma_salmon_train_bri);
Y.y_salmon_train_bri=C.a_salmon_train_bri*gaussmf(salmon_train(:,2),[A.sigma_salmon_train_bri A.mul_salmon_train_bri]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%绘制类条件概率密度图
figure(2);
subplot(2,1,1);
plot(perch_train(:,1),Y.y_perch_train_length,'b.');
hold on
plot(perch_train(:,2),Y.y_perch_train_bri,'r*');
legend('perch length','perch brightness');
xlabel('perch 样本数据');
ylabel('perch 样本类条件概率密度');
title('perch 类条件概率密度曲线');
subplot(2,1,2);
plot(salmon_train(:,1),Y.y_salmon_train_length,'b.');
hold on
plot(salmon_train(:,2),Y.y_salmon_train_bri,'r*');
legend('salmon length','salmon brightness');
xlabel('salmon 样本数据');
ylabel('salmon 样本类条件概率密度');
title('salmon 类条件概率密度曲线');
% end

