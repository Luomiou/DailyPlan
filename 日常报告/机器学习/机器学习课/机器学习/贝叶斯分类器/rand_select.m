function [ perch_train,perch_test,salmon_train,salmon_test ] = rand_select( perch,salmon )
%RAND_SELECT������ʾ���ѡ��ѵ�������Ͳ�������
%                  �ú�����Ϊ�����������5000��ѵ��������5000����������
%���������perch������ʾ���ɵ���������
%         salmon������ʾ���ɵ�����������
%���������perch_train ������ʾ�����ѵ������
%         perch_test������ʾ����Ĳ�������
%         salmon_train������ʾ�������ѵ������
%         salmon_test������ʾ������Ĳ�������
m = 5000;  %����ѡ���ٸ�ֵ
n1=size(perch,1); % ����������ĸ��� 
n2=size(salmon,1);
perm1= randperm(n1); % ����������ݷ�Χ1-n1
perm2= randperm(n2);
INDEX1= perm1(1:m); % ѡ��ǰm����ΪIndex
perch_test= perch(INDEX1,:); 
INDEX2= perm1(m+1:n1); 
perch_train= perch(INDEX2,:); 
INDEX3= perm2(1:m); % ѡ��ǰm����ΪIndex
salmon_test=salmon(INDEX3,:);
INDEX4= perm2(m+1:n2); 
salmon_train= salmon(INDEX4,:);
end

