% function [Cow ] = classify_2D( perch_test,salmon_test,TY )
%CLASSIFY_2D���������賤�Ⱥ������ǻ�����ȫ�����ģ��ó����������Ķ�ά���������������������ȷ�ʺʹ�����
%��������� TY��Ϊһ���ṹ�壬�����������������Ĳ�������������������
%            y_perch_length: [5000x1 double]
%     y_per_vssalmon_length: [5000x1 double]
%               y_perch_bri: [5000x1 double]
%        y_per_vssalmon_bri: [5000x1 double]
%           y_salmon_length: [5000x1 double]
%      y_sal_vsperch_length: [5000x1 double]
%              y_salmon_bri: [5000x1 double]
%         y_sal_vsperch_bri: [5000x1 double]
%        perch_test��salmon_test�ֱ��������������Ĳ�������
%���������Cow��Ϊһ���ṹ�壬�����������Ĳ����������з������ȷ�ʺʹ�����
%                           ����������������������ȷ�ʵľ�ֵ��Ϊ�ñ�Ҷ˹�������ķ����׼ȷ��
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
legend('p(����|�����������)','p(������|�����������)');
xlabel('���㳤�Ȳ�������');
ylabel('�������Ȳ�������');
zlabel('�������');
title('���������άɢ��ͼ'); 
%�����������5000�������������в���
y_salmon=TY.y_salmon_length.*TY.y_salmon_bri*p2./(TY.y_salmon_length.*TY.y_salmon_bri*p2+TY.y_sal_vsperch_length.*TY.y_sal_vsperch_bri*p1);%���������ʳ˻�
y_sal_vsperch=TY.y_sal_vsperch_length.*TY.y_sal_vsperch_bri*p1./(TY.y_salmon_length.*TY.y_salmon_bri*p2+TY.y_sal_vsperch_length.*TY.y_sal_vsperch_bri*p1);
subplot(2,1,2);
plot3(salmon_test(:,1),salmon_test(:,2),y_salmon,'b.')
hold on
plot3(salmon_test(:,1),salmon_test(:,2),y_sal_vsperch,'r*')
legend('p(������|�������������)','p(����|�������������)');
xlabel('�����㳤�Ȳ�������');
ylabel('���������Ȳ�������');
zlabel('�������');
title('���������άɢ��ͼ');
%�Բ����������з��࣬������������ȷ�ʺʹ�����
%�����5000����������
Ap=y_perch-y_per_vssalmon;
Cow.pc=sum(Ap(:)>0)/size(Ap,1);%�������ȷ��
Cow.pw=sum(Ap(:)<=0)/size(Ap,1);%����Ĵ�����
%�������5000����������
As=y_salmon-y_sal_vsperch;
Cow.sc=sum(As(:)>0)/size(As,1);%�������ȷ��
Cow.sw=sum(As(:)<=0)/size(As,1);%����Ĵ�����sw
%Ϊ�����ϴ�ʵ�����Ƚϣ��ô�ʵ���׼ȷ����Tc
Cow.Tc=(Cow.sc+Cow.pc)/2;
% end

