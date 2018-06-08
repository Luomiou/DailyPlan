u1=[3 2];
u2=[7 4];%�趨ÿ�����ݾ�ֵ
u3=[2 5];
covar=[2 0;0 2];%Э�������
x=-2:0.5:8;
y=-2:0.5:8;
[x,y]=meshgrid(x,y);
xy=[x(:) y(:)];
% ���������ܶȺ���
p1=mvnpdf(xy,u1,covar);
p2=mvnpdf(xy,u2,covar);
p3=mvnpdf(xy,u3,covar);

f1=reshape(p1,size(x));
f2=reshape(p2,size(x));
f3=reshape(p3,size(x));

subplot(2,1,1);
v=[0 10];   %����ɫ��������ֳ�ʮ�ȷ�
caxis(v);   %caxis ��ɫӳ��ָ�����ֵ����Сֵ������ɫ��Χ
a=ones(21,21);
a=8*a;   %����Ϊred
surfc(x,y,f1,a);

hold on;
v=[0 10];   %����ɫ��������ֳ�ʮ�ȷ�
caxis(v);
b=ones(20,20);
b=5*b;    %����Ϊgreen
surfc(x,y,f2',b);
hold on;
v=[0 10];   %����ɫ��������ֳ�ʮ�ȷ�
caxis(v);
c=ones(20,20);
c=1.5*c;   %����Ϊblue
surfc(x,y,f3,c);

subplot(2,1,2);
%���ȸ���
contour(x,y,f1,'r');
hold on;
contour(x,y,f2,'g');
hold on;
contour(x,y,f3,'b');
hold on;
ezplot('-1/4*((8*x+4*y)-52)',[31/7 10 -4 29/7]);%������
hold on;
ezplot('-1/4*((-10*x+2*y)+36)',[31/7 10 29/7 12]);
hold on;
ezplot('-1/4*((-2*x+6*y)-16)',[-4 31/7 -4 29/7]);