% function [C,Y] = K_cp(perch_train,salmon_train)
%K_CP��������Ҫ���ܾ���ͨ����õĲ�������ֵ����ȡѵ������������������ֵ
%���������perch_train,salmon_train�ֱ��ʾ������������ѵ������
%��������� Y��Ϊһ���ṹ�壬�ýṹ�������ѵ������������������ֵ
%           Y.y_perch_train_length��������ѵ���������ȶ�Ӧ������������
%           Y.y_perch_train_bri��������ѵ���������ȶ�Ӧ������������
%           Y.y_salmon_train_length����������ѵ���������ȶ�Ӧ������������
%           Y.y_salmon_train_bri����������ѵ���������ȶ�Ӧ������������
%          C��Ϊһ���ṹ�壬�����˼������������ʵ�ϵ��
%����perch������������
%����ĳ���
[A] = para_esti( perch_train,salmon_train );
C.a_perch_train_length=1/(sqrt(2*pi)*A.sigma_perch_train_length);
Y.y_perch_train_length=C.a_perch_train_length*gaussmf(perch_train(:,1),[A.sigma_perch_train_length A.mul_perch_train_length]);
%���������
C.a_perch_train_bri=1/(sqrt(2*pi)*A.sigma_perch_train_bri);
Y.y_perch_train_bri=C.a_perch_train_bri*gaussmf(perch_train(:,2),[A.sigma_perch_train_bri A.mul_perch_train_bri]);
%������salmon������������
%������ĳ���
C.a_salmon_train_length=1/(sqrt(2*pi)*A.sigma_salmon_train_length);
Y.y_salmon_train_length=C.a_salmon_train_length*gaussmf(salmon_train(:,1),[A.sigma_salmon_train_length A.mul_salmon_train_length]);
%�����������
C.a_salmon_train_bri=1/(sqrt(2*pi)*A.sigma_salmon_train_bri);
Y.y_salmon_train_bri=C.a_salmon_train_bri*gaussmf(salmon_train(:,2),[A.sigma_salmon_train_bri A.mul_salmon_train_bri]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%���������������ܶ�ͼ
figure(2);
subplot(2,1,1);
plot(perch_train(:,1),Y.y_perch_train_length,'b.');
hold on
plot(perch_train(:,2),Y.y_perch_train_bri,'r*');
legend('perch length','perch brightness');
xlabel('perch ��������');
ylabel('perch ���������������ܶ�');
title('perch �����������ܶ�����');
subplot(2,1,2);
plot(salmon_train(:,1),Y.y_salmon_train_length,'b.');
hold on
plot(salmon_train(:,2),Y.y_salmon_train_bri,'r*');
legend('salmon length','salmon brightness');
xlabel('salmon ��������');
ylabel('salmon ���������������ܶ�');
title('salmon �����������ܶ�����');
% end

