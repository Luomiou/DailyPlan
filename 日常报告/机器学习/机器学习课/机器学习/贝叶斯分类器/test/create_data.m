%���Լ��趨�ľ�ֵ�ͷ������̬�ֲ����������㣨1�ࣩ�����㣨2�ࣩ��10000�������ĳ������ݼ�
%����ĳ���
bri=100+30*randn(10000,1);
luyu_mu_length=180;
luyu_sigma_length=10;
luyu_length=180+10*randn(10000,1);
luyu=[luyu_length,bri];
%����ĳ��ȣ����㼴������
wayu_mu_length=150;
wayu_sigma_length=8;
wayu_length=150+8*randn(10000,1);
wayu=[wayu_length,bri];
%���ѡȡ5000��ѵ��������5000����������������ɢ��ͼ
[luyu_train,luyu_test,wayu_train,wayu_test]=rand_select(luyu,wayu);
figure(1);%figure�ǽ���ͼ�ε���˼��ϵͳ�Զ���1��2��3��4...������ͼ�Σ����ִ���ڼ���ͼ��
scatter(luyu_length,bri,'r','.');
hold on
scatter(wayu_length,bri,'g','+');
legend('perch ����','salmon ������');
title('perch��salmon��ɢ��ͼ');