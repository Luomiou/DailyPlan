function [ perch_train,perch_test,salmon_train,salmon_test ] = rand_select( perch,salmon )
%RAND_SELECT函数表示随机选择训练样本和测试样本
%                  该函数是为了让随机生成5000个训练样本和5000个测试样本
%输入参数：perch——表示生成的鲈鱼样本
%         salmon——表示生成的三文鱼样本
%输出参数：perch_train ——表示鲈鱼的训练样本
%         perch_test——表示鲈鱼的测试样本
%         salmon_train——表示三文鱼的训练样本
%         salmon_test——表示三文鱼的测试样本
m = 5000;  %你想选多少个值
n1=size(perch,1); % 整个数据组的个数 
n2=size(salmon,1);
perm1= randperm(n1); % 随机产生数据范围1-n1
perm2= randperm(n2);
INDEX1= perm1(1:m); % 选出前m个作为Index
perch_test= perch(INDEX1,:); 
INDEX2= perm1(m+1:n1); 
perch_train= perch(INDEX2,:); 
INDEX3= perm2(1:m); % 选出前m个作为Index
salmon_test=salmon(INDEX3,:);
INDEX4= perm2(m+1:n2); 
salmon_train= salmon(INDEX4,:);
end

