% function [Pos,P,S,TY] = classify(perch_test,salmon_test,A,C )
%CLASSIFY�������������ڷֱ���㳤�Ⱥ����ȵ�һά��������������������ܶ�ͼ�Լ���÷���������ȷ�ʺʹ�����
%���������perch_test��ʾ����Ĳ���������
%         salmon_test��ʾ������Ĳ���������
%A��Ϊһ���ṹ�壬�ýṹ������˶�ѵ���������в������ƵĽ��
%         A.sigma_perch_train_length��������ѵ���������ȵķ���
%         A.mul_perch_train_length��������ѵ���������ȵľ�ֵ
%         A.sigma_perch_train_bri��������ѵ���������ȵķ���
%         A.mul_perch_train_bri��������ѵ���������ȵľ�ֵ
%         A.sigma_salmon_train_length����������ѵ���������ȵķ���
%         A.mul_salmon_train_length����������ѵ���������ȵľ�ֵ
%         A.sigma_salmon_train_bri����������ѵ���������ȵķ���
%         A.mul_salmon_train_bri����������ѵ���������ȵľ�ֵ
%C��Ϊһ���ṹ�壬�����˼������������ʵ�ϵ��
%���������Pos��Ϊһ���ṹ�壬�����˼�������к������ֵ
%Pos = 
%           posterior_perch_length�������㳤�������ֵ��������ĺ������
%     posterior_pervssalmon_length�������㳤�������ֵ����������ĺ������
%              posterior_perch_bri�����������������ֵ��������ĺ������
%        posterior_pervssalmon_bri�����������������ֵ����������ĺ������
%          posterior_salmon_length���������㳤�������ֵ����������ĺ������
%      posterior_salvsperch_length���������㳤�������ֵ��������ĺ������
%             posterior_salmon_bri�������������������ֵ����������ĺ������
%         posterior_salvsperch_bri�������������������ֵ��������ĺ������
%          P��Ϊһ���ṹ�壬������������Ϊ���������������ȷ�ʺʹ�����
%          S��Ϊһ���ṹ�壬��������������Ϊ���������������ȷ�ʺʹ�����
%          TY��Ϊһ���ṹ�壬�����������������Ĳ�������������������
p1=0.5;
p2=1-p1;
%���������5000��������������
%����ĳ���
TY.y_perch_length=C.a_perch_train_length*gaussmf(perch_test(:,1),[A.sigma_perch_train_length A.mul_perch_train_length]);%������Ĳ��������ָ����������������
TY.y_per_vssalmon_length=C.a_salmon_train_length*gaussmf(perch_test(:,1),[A.sigma_salmon_train_length A.mul_salmon_train_length]);%������Ĳ��������ָ������������������
Pos.posterior_perch_length=TY.y_perch_length*p1./(TY.y_perch_length*p1+TY.y_per_vssalmon_length*p2);%������Ĳ��������ָ�����ĺ������
Pos.posterior_pervssalmon_length=TY.y_per_vssalmon_length*p2./(TY.y_perch_length*p1+TY.y_per_vssalmon_length*p2);%������Ĳ��������ָ�������ĺ������
figure(3)
subplot(2,2,1);
plot(perch_test(:,1),Pos.posterior_perch_length,'b.');
hold on
plot(perch_test(:,1),Pos.posterior_pervssalmon_length,'r*');
legend('p(����|�����������)','p(������|����������� )');
xlabel('���㳤�Ȳ�������');
ylabel('�������');
title('���� �����������');
%���������
TY.y_perch_bri=C.a_perch_train_bri*gaussmf(perch_test(:,2),[A.sigma_perch_train_bri A.mul_perch_train_bri]);%������Ĳ��������ָ����������������
TY.y_per_vssalmon_bri=C.a_salmon_train_bri*gaussmf(perch_test(:,2),[A.sigma_salmon_train_bri A.mul_salmon_train_bri]);%������Ĳ��������ָ������������������
Pos.posterior_perch_bri=TY.y_perch_bri*p1./(TY.y_perch_bri*p1+TY.y_per_vssalmon_bri*p2);%������Ĳ��������ָ�����ĺ������
Pos.posterior_pervssalmon_bri=TY.y_per_vssalmon_bri*p2./(TY.y_perch_bri*p1+TY.y_per_vssalmon_bri*p2);%������Ĳ��������ָ�������ĺ������
figure(3)
subplot(2,2,3);
plot(perch_test(:,2),Pos.posterior_perch_bri,'b.');
hold on
plot(perch_test(:,2),Pos.posterior_pervssalmon_bri,'r*');
legend('p(����|�����������)','p(������|�����������)');
xlabel('�������Ȳ�������');
ylabel('�������');
title('���� �����������');
%�����������5000��������������
%������ĳ���
TY.y_salmon_length=C.a_salmon_train_length*gaussmf(salmon_test(:,1),[A.sigma_salmon_train_length A.mul_salmon_train_length]);
TY.y_sal_vsperch_length=C.a_perch_train_length*gaussmf(salmon_test(:,1),[A.sigma_perch_train_length A.mul_perch_train_length]);
Pos.posterior_salmon_length=TY.y_salmon_length*p2./(TY.y_salmon_length*p2+TY.y_sal_vsperch_length*p1);
Pos.posterior_salvsperch_length=TY.y_sal_vsperch_length*p1./(TY.y_salmon_length*p2+TY.y_sal_vsperch_length*p1);
figure(3)
subplot(2,2,2);
plot(salmon_test(:,1),Pos.posterior_salmon_length,'b.');
hold on
plot(salmon_test(:,1),Pos.posterior_salvsperch_length,'r*');
legend('p(������|�������������)','p(����|�������������)');
xlabel('�����㳤�Ȳ�������');
ylabel('�������');
title('���� �����������');
%����������� 
TY.y_salmon_bri=C.a_salmon_train_bri*gaussmf(salmon_test(:,2),[A.sigma_salmon_train_bri A.mul_salmon_train_bri]);%������Ĳ��������ָ����������������
TY.y_sal_vsperch_bri=C.a_perch_train_bri*gaussmf(salmon_test(:,2),[A.sigma_perch_train_bri A.mul_perch_train_bri]);%������Ĳ��������ָ������������������
Pos.posterior_salmon_bri=TY.y_salmon_bri*p2./(TY.y_salmon_bri*p2+TY.y_sal_vsperch_bri*p1);%������Ĳ��������ָ�����ĺ������
Pos.posterior_salvsperch_bri=TY.y_sal_vsperch_bri*p1./(TY.y_salmon_bri*p2+TY.y_sal_vsperch_bri*p1);%������Ĳ��������ָ�������ĺ������
figure(3)
subplot(2,2,4);
plot(salmon_test(:,2),Pos.posterior_salmon_bri,'b.');
hold on
plot(salmon_test(:,2),Pos.posterior_salvsperch_bri,'r*');
legend('p(������|�������������)','p(����|�������������)','Location','East');
xlabel('���������Ȳ�������');
ylabel('�������');
title('���� �����������'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�Բ����������з��࣬������������ȷ�ʺʹ�����
%�����5000�����Ȳ�������
Ap_length=TY.y_perch_length-TY.y_per_vssalmon_length; % TY��Ϊһ���ṹ�壬����������
%���ھ���A���ҳ����������ֵ�ĸ������ø�������������ֵ��������ȷ��������
%���ھ���A���ҳ�С�������ֵ�ĸ������ø�������������ֵ�������Ĵ����������
P.pc_length=sum(Ap_length(:)>0)/size(Ap_length,1);%��ʾ�����㳤�Ȳ�����������Ϊ�����������������ȷ��
P.pw_length=sum(Ap_length(:)<0)/size(Ap_length,1);%��ʾ�����㳤�Ȳ�����������Ϊ��������������Ĵ�����
%����ʾ�Ѹ������㳤�ȣ�������ֵ�������������ĸ���ռ��
%�������5000�����Ȳ�������
As_length=TY.y_salmon_length-TY.y_sal_vsperch_length;
S.sc_length=sum(As_length(:)>0)/size(As_length,1);%��ʾ�������㳤�Ȳ�����������Ϊ�����������������ȷ��
S.sw_length=sum(As_length(:)<0)/size(As_length,1);
%�����5000�����Ȳ�������
Ap_bri=TY.y_perch_bri-TY.y_per_vssalmon_bri;
P.pc_bri=sum(Ap_bri(:)>0)/size(Ap_bri,1);%��ʾ���������Ȳ�����������Ϊ�����������������ȷ��
P.pw_bri=sum(Ap_bri(:)<0)/size(Ap_bri,1);
%�������5000�����Ȳ�������
As_bri=TY.y_salmon_bri-TY.y_sal_vsperch_bri;
S.sc_bri=sum(As_bri(:)>0)/size(As_bri,1);%��ʾ�������㳤�Ȳ�����������Ϊ�����������������ȷ��
S.sw_bri=sum(As_bri(:)<0)/size(As_bri,1)                   
;
% end

