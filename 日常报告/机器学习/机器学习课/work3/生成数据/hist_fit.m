%�����ܶȣ�0.5*N(1,2)+0.5*N(5,1)
%%%%%%%%%%%%%%%%%%��������%%%%%%%%%%%%%%%%%%%%%%%%%%%%
u1=1;u2=5; %ʵ�����ݾ�ֵ 
u=[u1 u2];        
covar=2;               %Э����
covar(:,:,2)=1;
p_c=[1 1];            %�������֮�����
N_c=1000;             %��������
[X,N] = build_mix_1D_gaussian( u,covar,p_c,N_c );
Y2 = 0.5*normpdf(X,u1,sqrt(covar(:,:,1)))+0.5*normpdf(X,u2,sqrt(covar(:,:,2)));
figure(1),
plot(X,Y2,'b.');



%%%%%%%%%%%%%%%%������ֱ��ͼ%%%%%%%%%%%%%%%%%%%%%%%%%%
width=0.3;        %�������
[n]= hist(X,(max(X)-min(X))/width);          %������=(max(X)-min(X))/width��n:����ÿ��bin�������ĸ���
pp = n /1000;        %ÿ��bin������Ƶ��                  
figure(2),
% subplot(2,2,1);
bar(pp);
hold on;               



%%%%%%%%%%%%%��ֱ��ͼ���Ϊ�����ܶ�����%%%%%%%%%%%%%%%%
% width=0.1;
% subplot(2,2,2);
% [n]= hist(X,(max(X)-min(X))/width);
% %������=(max(X)-min(X))/width
% pp = n/1000;        %Ƶ��
Y=[min(X):width:(max(X)-width)];
p = polyfit(Y,pp/width,12);       %�Թ���ÿ����ĸ����ܶȣ�����ϸ����ܶ�����
f = polyval(p,Y);
figure(3)
plot(Y,f,'g.');
hold on;
plot(Y,pp/width,'r');  %Ƶ��/������ȣ�������
title('0.1');

