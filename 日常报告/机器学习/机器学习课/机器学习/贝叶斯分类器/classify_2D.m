% function [Cow ] = classify_2D( perch_test,salmon_test,TY )
%CLASSIFY_2D函数：假设长度和亮度是互相完全独立的，得出鲈鱼和鲑鱼的二维分类器，计算分类结果的正确率和错误率
%输入参数： TY作为一个结构体，包含了鲈鱼和三文鱼的测试样本的类条件概率
%            y_perch_length: [5000x1 double]
%     y_per_vssalmon_length: [5000x1 double]
%               y_perch_bri: [5000x1 double]
%        y_per_vssalmon_bri: [5000x1 double]
%           y_salmon_length: [5000x1 double]
%      y_sal_vsperch_length: [5000x1 double]
%              y_salmon_bri: [5000x1 double]
%         y_sal_vsperch_bri: [5000x1 double]
%        perch_test和salmon_test分别是鲈鱼和三文鱼的测试样本
%输出参数：Cow作为一个结构体，鲈鱼和三文鱼的测试样本进行分类的正确率和错误率
%                           最终用鲈鱼和三文鱼分类正确率的均值作为该贝叶斯分类器的分类的准确率
p1=0.5;
p2=1-p1;
y_perch=TY.y_perch_length.*TY.y_perch_bri*p1./(TY.y_perch_length.*TY.y_perch_bri*p1+TY.y_per_vssalmon_length.*TY.y_per_vssalmon_bri*p2);
y_per_vssalmon=TY.y_per_vssalmon_length.*TY.y_per_vssalmon_bri*p2./(TY.y_perch_length.*TY.y_perch_bri*p1+TY.y_per_vssalmon_length.*TY.y_per_vssalmon_bri*p2);
%%%%%%%%%%%%%%
figure(4)
subplot(2,1,1);
plot3(perch_test(:,1),perch_test(:,2),y_perch,'b.')
hold on
plot3(perch_test(:,1),perch_test(:,2),y_per_vssalmon,'r*')
legend('p(鲈鱼|鲈鱼测试样本)','p(三文鱼|鲈鱼测试样本)');
xlabel('鲈鱼长度测试样本');
ylabel('鲈鱼亮度测试样本');
zlabel('后验概率');
title('后验概率三维散点图'); 
%利用三文鱼的5000个测试样本进行测试
y_salmon=TY.y_salmon_length.*TY.y_salmon_bri*p2./(TY.y_salmon_length.*TY.y_salmon_bri*p2+TY.y_sal_vsperch_length.*TY.y_sal_vsperch_bri*p1);%类条件概率乘积
y_sal_vsperch=TY.y_sal_vsperch_length.*TY.y_sal_vsperch_bri*p1./(TY.y_salmon_length.*TY.y_salmon_bri*p2+TY.y_sal_vsperch_length.*TY.y_sal_vsperch_bri*p1);
subplot(2,1,2);
plot3(salmon_test(:,1),salmon_test(:,2),y_salmon,'b.')
hold on
plot3(salmon_test(:,1),salmon_test(:,2),y_sal_vsperch,'r*')
legend('p(三文鱼|三文鱼测试样本)','p(鲈鱼|三文鱼测试样本)');
xlabel('三文鱼长度测试样本');
ylabel('三文鱼亮度测试样本');
zlabel('后验概率');
title('后验概率三维散点图');
%对测试样本进行分类，并计算分类的正确率和错误率
%鲈鱼的5000个测试样本
Ap=y_perch-y_per_vssalmon;
Cow.pc=sum(Ap(:)>0)/size(Ap,1);%分类的正确率
Cow.pw=sum(Ap(:)<=0)/size(Ap,1);%分类的错误率
%三文鱼的5000个测试样本
As=y_salmon-y_sal_vsperch;
Cow.sc=sum(As(:)>0)/size(As,1);%分类的正确率
Cow.sw=sum(As(:)<=0)/size(As,1);%分类的错误率sw
%为了与上次实验结果比较，该次实验的准确率是Tc
Cow.Tc=(Cow.sc+Cow.pc)/2;
% end

