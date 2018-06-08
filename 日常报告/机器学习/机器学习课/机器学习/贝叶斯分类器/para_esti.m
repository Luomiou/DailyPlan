function [A] = para_esti( perch_train,salmon_train )
%PARA_ESTI�����������������ѵ�������Ĳ���
%���������perch_train���������ѵ������
%         salmon_train�����������ѵ������
%���������A��Ϊһ���ṹ�壬�ýṹ������˶�ѵ���������в������ƵĽ��
%         A.sigma_perch_train_length��������ѵ���������ȵķ���
%         A.mul_perch_train_length��������ѵ���������ȵľ�ֵ
%         A.sigma_perch_train_bri��������ѵ���������ȵķ���
%         A.mul_perch_train_bri��������ѵ���������ȵľ�ֵ
%         A.sigma_salmon_train_length����������ѵ���������ȵķ���
%         A.mul_salmon_train_length����������ѵ���������ȵľ�ֵ
%         A.sigma_salmon_train_bri����������ѵ���������ȵķ���
%         A.mul_salmon_train_bri����������ѵ���������ȵľ�ֵ
%perch�Ĳ�������
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
%salmon�Ĳ�������
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

