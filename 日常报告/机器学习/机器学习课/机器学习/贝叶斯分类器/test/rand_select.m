function [luyu_train,luyu_test,wayu_train,wayu_test]=rand_select(luyu,wayu)
%RAND_SELECT������ʾ���ѡ��ѵ�������Ͳ�������
%         �ú�����Ϊ�����������5000��ѵ��������5000����������
%���������luyu������ʾ���ɵ���������
%         wayu������ʾ���ɵ�����������
%���������luyu_train ������ʾ�����ѵ������
%         luyu_test������ʾ����Ĳ�������
%         wayu_train������ʾ�������ѵ������
%         wayu_test������ʾ������Ĳ�������
m=5000;%ѡȡ���ٸ�ֵ
n1=size(luyu,1);%���ٸ�����
n2=size(wayu,1);
perm1=randperm(n1);
perm2=randperm(n2);
INDEX1=perm1(1:m);%ѡȡǰm����ΪIndex
luyu_test=luyu(INDEX1,:);
INDEX2=perm1(m+1:n1);
luyu_train=luyu(INDEX2,:);
INDEX3= perm2(1:m); % ѡ��ǰm����ΪIndex
wayu_test=wayu(INDEX3,:);
INDEX4= perm2(m+1:n2); 
wayu_train= wayu(INDEX4,:);
end
