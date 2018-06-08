function [A] = para_esti( perch_train,salmon_train )
%PARA_ESTI函数的意义在于求出训练样本的参数
%输入参数：perch_train——鲈鱼的训练样本
%         salmon_train——三文鱼的训练样本
%输出参数：A作为一个结构体，该结构体包括了对训练样本进行参数估计的结果
%         A.sigma_perch_train_length——鲈鱼训练样本长度的方差
%         A.mul_perch_train_length——鲈鱼训练样本长度的均值
%         A.sigma_perch_train_bri——鲈鱼训练样本亮度的方差
%         A.mul_perch_train_bri——鲈鱼训练样本亮度的均值
%         A.sigma_salmon_train_length——三文鱼训练样本长度的方差
%         A.mul_salmon_train_length——三文鱼训练样本长度的均值
%         A.sigma_salmon_train_bri——三文鱼训练样本亮度的方差
%         A.mul_salmon_train_bri——三文鱼训练样本亮度的均值
%perch的参数估计
A.mul_perch_train_length=mean(perch_train(:,1));
A.mul_perch_train_bri=mean(perch_train(:,2));
sum1_length=0;
sum1_bri=0;
for i=1:size(perch_train,1)
    sum1_length=sum1_length+(perch_train(i,1)-A.mul_perch_train_length)^2;
    sum1_bri=sum1_bri+(perch_train(i,2)-A.mul_perch_train_bri)^2;
end
A.sigma_perch_train_length=sqrt(sum1_length/(size(perch_train,1)-1));
A.sigma_perch_train_bri=sqrt(sum1_bri/(size(perch_train,1)-1));
%salmon的参数估计
A.mul_salmon_train_length=mean(salmon_train(:,1));
A.mul_salmon_train_bri=mean(salmon_train(:,2));
sum2_length=0;
sum2_bri=0;
for i=1:size(salmon_train,1)
    sum2_length=sum2_length+(salmon_train(i,1)-A.mul_salmon_train_length)^2;
    sum2_bri=sum2_bri+(salmon_train(i,2)-A.mul_salmon_train_bri)^2;
end
A.sigma_salmon_train_length=sqrt(sum2_length/(size(salmon_train,1)-1));
A.sigma_salmon_train_bri=sqrt(sum2_bri/(size(salmon_train,1)-1));
end

