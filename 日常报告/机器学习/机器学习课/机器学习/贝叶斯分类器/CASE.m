 function [ Pp,Ss] = CASE(constant)
%CASE3������ʾ��Э��������ǷǶԽ���,������������Э���������ͬ�����£����ɵı�Ҷ˹�������Ľ��
%���������mul_perch��������ľ�ֵ
%         sigma_perch��������ķ���
%         mul_salmon����������ľ�ֵ
%         sigma_salmon����������ķ���
%���������Pp��Ϊһ���ṹ�壬��ʾ��perch_test��Ϊ���������ķ����׼ȷ�ʺʹ�����
% pc������ʾperch_test��Ϊ���������ķ����׼ȷ��
% pw������ʾperch_test��Ϊ���������ķ���Ĵ�����
%         Ss��Ϊһ���ṹ�壬��ʾ��salmon_test��Ϊ���������ķ����׼ȷ�ʺʹ�����
% pc������ʾperch_test��Ϊ���������ķ����׼ȷ��
% pw������ʾperch_test��Ϊ���������ķ���Ĵ�����
%case3:Э��������ǷǶԽ���,������������Э���������ͬ
%case4:������������Э��������ǶԽ��󣬵�������Э�������ͬ
%case5:������������Э��������ǷǶԽ��󣬵�������Э�������ͬ����һ��������
switch(constant)
    case 3
    mul_salmon=[150,120];sigma_salmon=[30,-15;-15,50];
    mul_perch=[170,90];sigma_perch=[30,-15;-15,50];
    case 4
    mul_perch=[170,90];sigma_perch=[35,0;0,35];   
    mul_salmon=[150,120];sigma_salmon=[28,0;0,28];
    case 5
    mul_perch=[170,90];sigma_perch=[38,-9;-9,40];
    mul_salmon=[150,120];sigma_salmon=[40,-13;-13,30];
end
perch=mvnrnd(mul_perch,sigma_perch,10000);%z = mvnrnd(mu,sigma,n):������ά��̬�������muΪ����������sigmaΪЭ�������nΪ��ģ��
salmon=mvnrnd(mul_salmon,sigma_salmon,10000);
[ perch_train,perch_test,salmon_train,salmon_test ] = rand_select( perch,salmon );%���ɲ���������ѵ������
%����perch��salmon��ɢ��ͼ    
figure(1);
scatter(perch(:,1),perch(:,2),'r','.');
xlabel('��������');
ylabel('��������');
hold on
scatter(salmon(:,1),salmon(:,2),'b','.');
legend('perch ����','salmon ������');
title('perch��salmon��ɢ��ͼ');
mul_perch_train=mean(perch_train);
sigma_perch_train=cov(perch_train);
%salmon��ѵ������
mul_salmon_train=mean(salmon_train);
sigma_salmon_train=cov(salmon_train);                           
%��ú������(ȥ����ν�ĳ�����
%�����������ָ���������
A_perch=ones(size(perch_train,1),2);
B_perch=[mul_perch_train(:,1)*A_perch(:,1),mul_perch_train(:,2)*A_perch(:,2)];
%��������Ĳ�������
p_p=-0.5*(perch_test-B_perch)*inv(sigma_perch_train)*(perch_test-B_perch)';
y_perch=diag(p_p);%��ȡ�Խ�Ԫ��,��������ൽ����ĺ������
%����������Ĳ�������
s_p=-0.5*(salmon_test-B_perch)*inv(sigma_perch_train)*(salmon_test-B_perch)';
y_sal_vsperch=diag(s_p);%����������ൽ�������ĺ������
%�����������ָ�����������
A_salmon=ones(size(salmon_train,1),2);
B_salmon=[mul_salmon_train(:,1)*A_salmon(:,1),mul_salmon_train(:,2)*A_salmon(:,2)];
%��������Ĳ�������
p_s=-0.5*(perch_test-B_salmon)*inv(sigma_salmon_train)*(perch_test-B_salmon)';
y_per_vssalmon=diag(p_s);%��ȡ�Խ�Ԫ��,��������ൽ������ĺ������
%����������Ĳ�������
s_s=-0.5*(salmon_test-B_salmon)*inv(sigma_salmon_train)*(salmon_test-B_salmon)';
y_salmon=diag(s_s);%����������ൽ�������ĺ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�����������׼ȷ�ʺʹ�����
%������Ϊ��������������������
A_p=y_perch-y_per_vssalmon;
Pp.pc=(sum(A_p(:)>0))/size(A_p,1);
Pp.pw=(sum(A_p(:)<=0))/size(A_p,1);
%��������Ϊ��������������������
A_s=y_salmon-y_sal_vsperch;
Ss.sc=(sum(A_s(:)>0))/size(A_s,1);
Ss.sw=(sum(A_s(:)<=0))/size(A_s,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�������ͼ��  
figure(2)
subplot(2,1,1);
plot3(perch_test(:,1),perch_test(:,2),y_perch,'b.');
hold on
plot3(perch_test(:,1),perch_test(:,2),y_per_vssalmon,'r*'); 
legend('p(����|�����������)','p(������|�����������)');
xlabel('���㳤�Ȳ�������');
ylabel('�������Ȳ�������');
zlabel('�б���ֵ');
title('��άɢ��ͼ'); 
subplot(2,1,2);
plot3(salmon_test(:,1),salmon_test(:,2),y_salmon,'b.');
hold on
plot3(salmon_test(:,1),salmon_test(:,2),y_sal_vsperch,'r*'); 
legend('p(������|�������������)','p(����|�������������)');
xlabel('�����㳤�Ȳ�������');
ylabel('���������Ȳ�������');
zlabel('�б���ֵ');
title('��άɢ��ͼ'); 
% end

