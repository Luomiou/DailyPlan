 function [ Pp,Ss] = CASE(constant)
%CASE3函数表示在协方差矩阵是非对角阵,鲈鱼和三文鱼的协方差矩阵相同条件下，生成的贝叶斯分类器的结果
%输入参数：mul_perch——鲈鱼的均值
%         sigma_perch——鲈鱼的方差
%         mul_salmon——三文鱼的均值
%         sigma_salmon——三文鱼的方差
%输出参数：Pp作为一个结构体，表示当perch_test作为测试样本的分类的准确率和错误率
% pc——表示perch_test作为测试样本的分类的准确率
% pw——表示perch_test作为测试样本的分类的错误率
%         Ss作为一个结构体，表示当salmon_test作为测试样本的分类的准确率和错误率
% pc——表示perch_test作为测试样本的分类的准确率
% pw——表示perch_test作为测试样本的分类的错误率
%case3:协方差矩阵是非对角阵,鲈鱼和三文鱼的协方差矩阵相同
%case4:鲈鱼和三文鱼的协方差矩阵都是对角阵，但是两者协方差矩阵不同
%case5:鲈鱼和三文鱼的协方差矩阵都是非对角阵，但是两者协方差矩阵不同（更一般的情况）
switch(constant)
    case 3
    mul_salmon=[150,120];sigma_salmon=[30,-15;-15,50];
    mul_perch=[170,90];sigma_perch=[30,-15;-15,50];
    case 4
    mul_perch=[170,90];sigma_perch=[35,0;0,35];   
    mul_salmon=[150,120];sigma_salmon=[28,0;0,28];
    case 5
    mul_perch=[170,90];sigma_perch=[38,-9;-9,40];
    mul_salmon=[150,120];sigma_salmon=[40,-13;-13,30];
end
perch=mvnrnd(mul_perch,sigma_perch,10000);%z = mvnrnd(mu,sigma,n):产生多维正态随机数，mu为期望向量，sigma为协方差矩阵，n为规模。
salmon=mvnrnd(mul_salmon,sigma_salmon,10000);
[ perch_train,perch_test,salmon_train,salmon_test ] = rand_select( perch,salmon );%生成测试样本和训练样本
%绘制perch和salmon的散点图    
figure(1);
scatter(perch(:,1),perch(:,2),'r','.');
xlabel('样本长度');
ylabel('样本亮度');
hold on
scatter(salmon(:,1),salmon(:,2),'b','.');
legend('perch 鲈鱼','salmon 三文鱼');
title('perch和salmon的散点图');
mul_perch_train=mean(perch_train);
sigma_perch_train=cov(perch_train);
%salmon的训练样本
mul_salmon_train=mean(salmon_train);
sigma_salmon_train=cov(salmon_train);                           
%获得后验概率(去掉所谓的常量）
%将测试样本分给鲈鱼的类别
A_perch=ones(size(perch_train,1),2);
B_perch=[mul_perch_train(:,1)*A_perch(:,1),mul_perch_train(:,2)*A_perch(:,2)];
%利用鲈鱼的测试样本
p_p=-0.5*(perch_test-B_perch)*inv(sigma_perch_train)*(perch_test-B_perch)';
y_perch=diag(p_p);%提取对角元素,将鲈鱼分类到鲈鱼的后验概率
%利用三文鱼的测试样本
s_p=-0.5*(salmon_test-B_perch)*inv(sigma_perch_train)*(salmon_test-B_perch)';
y_sal_vsperch=diag(s_p);%将三文鱼分类到鲈鱼类别的后验概率
%将测试样本分给三文鱼的类别
A_salmon=ones(size(salmon_train,1),2);
B_salmon=[mul_salmon_train(:,1)*A_salmon(:,1),mul_salmon_train(:,2)*A_salmon(:,2)];
%利用鲈鱼的测试样本
p_s=-0.5*(perch_test-B_salmon)*inv(sigma_salmon_train)*(perch_test-B_salmon)';
y_per_vssalmon=diag(p_s);%提取对角元素,将鲈鱼分类到三文鱼的后验概率
%利用三文鱼的测试样本
s_s=-0.5*(salmon_test-B_salmon)*inv(sigma_salmon_train)*(salmon_test-B_salmon)';
y_salmon=diag(s_s);%将三文鱼分类到鲈鱼类别的后验概率
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%计算分类结果的准确率和错误率
%鲈鱼作为测试样本，分类结果如下
A_p=y_perch-y_per_vssalmon;
Pp.pc=(sum(A_p(:)>0))/size(A_p,1);
Pp.pw=(sum(A_p(:)<=0))/size(A_p,1);
%三文鱼作为测试样本，分类结果如下
A_s=y_salmon-y_sal_vsperch;
Ss.sc=(sum(A_s(:)>0))/size(A_s,1);
Ss.sw=(sum(A_s(:)<=0))/size(A_s,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%绘制相关图例  
figure(2)
subplot(2,1,1);
plot3(perch_test(:,1),perch_test(:,2),y_perch,'b.');
hold on
plot3(perch_test(:,1),perch_test(:,2),y_per_vssalmon,'r*'); 
legend('p(鲈鱼|鲈鱼测试样本)','p(三文鱼|鲈鱼测试样本)');
xlabel('鲈鱼长度测试样本');
ylabel('鲈鱼亮度测试样本');
zlabel('判别函数值');
title('三维散点图'); 
subplot(2,1,2);
plot3(salmon_test(:,1),salmon_test(:,2),y_salmon,'b.');
hold on
plot3(salmon_test(:,1),salmon_test(:,2),y_sal_vsperch,'r*'); 
legend('p(三文鱼|三文鱼测试样本)','p(鲈鱼|三文鱼测试样本)');
xlabel('三文鱼长度测试样本');
ylabel('三文鱼亮度测试样本');
zlabel('判别函数值');
title('三维散点图'); 
% end

