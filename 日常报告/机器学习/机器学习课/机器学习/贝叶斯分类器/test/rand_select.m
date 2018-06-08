function [luyu_train,luyu_test,wayu_train,wayu_test]=rand_select(luyu,wayu)
%RAND_SELECT函数表示随机选择训练样本和测试样本
%         该函数是为了让随机生成5000个训练样本和5000个测试样本
%输入参数：luyu——表示生成的鲈鱼样本
%         wayu——表示生成的三文鱼样本
%输出参数：luyu_train ——表示鲈鱼的训练样本
%         luyu_test——表示鲈鱼的测试样本
%         wayu_train——表示三文鱼的训练样本
%         wayu_test——表示三文鱼的测试样本
m=5000;%选取多少个值
n1=size(luyu,1);%多少个鲈鱼
n2=size(wayu,1);
perm1=randperm(n1);
perm2=randperm(n2);
INDEX1=perm1(1:m);%选取前m个作为Index
luyu_test=luyu(INDEX1,:);
INDEX2=perm1(m+1:n1);
luyu_train=luyu(INDEX2,:);
INDEX3= perm2(1:m); % 选出前m个作为Index
wayu_test=wayu(INDEX3,:);
INDEX4= perm2(m+1:n2); 
wayu_train= wayu(INDEX4,:);
end
