%�ϵ۰�����
%���Լ��趨�ľ�ֵ�ͷ������̬�ֲ����������㣨1�ࣩ�����㣨2�ࣩ��10000�������ĳ��Ⱥ��������ݼ�
%�����������ݡ������Ⱥ�����
%����ĳ���
pmu_length=180;
psigma_length=10;
perch_length=180+10*randn(10000,1);
%���������
pmu_bri=100;
psigma_bri=30;
perch_bri=100+30*randn(10000,1);
%��������������--���Ⱥ�����
%������ĳ���
smu_length=150;
ssigma_length=8;
salmon_length=150+8*randn(10000,1);
%�����������
smu_bri=160;
ssigma_bri=15;
salmon_bri=160+15*randn(10000,1);
perch=[perch_length,perch_bri];
salmon=[salmon_length,salmon_bri];
%���ѡȡ5000��ѵ��������5000����������������ɢ��ͼ��
[ perch_train,perch_test,salmon_train,salmon_test ] = rand_select( perch,salmon );
figure(1);%figure�ǽ���ͼ�ε���˼��ϵͳ�Զ���1��2��3��4...������ͼ�Σ����ִ���ڼ���ͼ��
scatter(perch_length,perch_bri,'r','.');
xlabel('��������');
ylabel('��������');
hold on %hold on �Ǳ���axes��ͼ���õ�,�»���ͼ�񲻸���ԭͼ��
scatter(salmon_length,salmon_bri,'b','+');
legend('perch ����','salmon ������');
title('perch��salmon��ɢ��ͼ');
