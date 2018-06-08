%用自己设定的均值和方差，用正态分布别生成鲈鱼（1类）和鲑鱼（2类）的10000个样本的长度数据集
%鲈鱼的长度
bri=100+30*randn(10000,1);
luyu_mu_length=180;
luyu_sigma_length=10;
luyu_length=180+10*randn(10000,1);
luyu=[luyu_length,bri];
%鲑鱼的长度，鲑鱼即三文鱼
wayu_mu_length=150;
wayu_sigma_length=8;
wayu_length=150+8*randn(10000,1);
wayu=[wayu_length,bri];
%随机选取5000做训练样本，5000做测试样本，画出散点图
[luyu_train,luyu_test,wayu_train,wayu_test]=rand_select(luyu,wayu);
figure(1);%figure是建立图形的意思，系统自动从1，2，3，4...来建立图形，数字代表第几幅图形
scatter(luyu_length,bri,'r','.');
hold on
scatter(wayu_length,bri,'g','+');
legend('perch 鲈鱼','salmon 三文鱼');
title('perch和salmon的散点图');