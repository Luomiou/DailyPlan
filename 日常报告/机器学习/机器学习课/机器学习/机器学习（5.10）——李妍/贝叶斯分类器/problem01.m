%上帝扮演者
%用自己设定的均值和方差，用正态分布别生成鲈鱼（1类）和鲑鱼（2类）的10000个样本的长度和亮度数据集
%鲈鱼的相关数据——长度和亮度
%鲈鱼的长度
pmu_length=180;
psigma_length=10;
perch_length=180+10*randn(10000,1);
%鲈鱼的亮度
pmu_bri=100;
psigma_bri=30;
perch_bri=100+30*randn(10000,1);
%三文鱼的相关数据--长度和亮度
%三文鱼的长度
smu_length=150;
ssigma_length=8;
salmon_length=150+8*randn(10000,1);
%三文鱼的亮度
smu_bri=160;
ssigma_bri=15;
salmon_bri=160+15*randn(10000,1);
perch=[perch_length,perch_bri];
salmon=[salmon_length,salmon_bri];
%随机选取5000做训练样本，5000做测试样本，画出散点图。
[ perch_train,perch_test,salmon_train,salmon_test ] = rand_select( perch,salmon );
figure(1);%figure是建立图形的意思，系统自动从1，2，3，4...来建立图形，数字代表第几幅图形
scatter(perch_length,perch_bri,'r','.');
xlabel('样本长度');
ylabel('样本亮度');
hold on %hold on 是保存axes内图像用的,新画的图像不覆盖原图像
scatter(salmon_length,salmon_bri,'b','+');
legend('perch 鲈鱼','salmon 三文鱼');
title('perch和salmon的散点图');
