%��������ͬ����ͬhֵ�ıȽ�
%%parzen����
clear;
[X,Y,x1,y1,x2,y2]=make_data(1,sqrt(2),4,1,1000);%����1000��ѵ������
yy1=parzen(X,X,0.1);                            %h=0.1  
yy2=parzen(X,X,0.3);                            %h=0.3
yy3=parzen(X,X,0.5);                            %h=0.5  
%plot(X,Y,'r.',X,yy1,'g.',X,yy2,'y.',X,yy3,'b.');%��ͼ
%legend('ԭʼ����','h = 0.1','h = 0.3','h=0.5')   %��ͼ
clear;
%%%ƽ����
[X,Y,x1,y1,x2,y2]=make_data(1,sqrt(2),4,1,1000);%����1000��ѵ������
yy1=smooth(X,X,0.1);                            %h=0.1  
yy2=smooth(X,X,0.3);                            %h=0.3
yy3=smooth(X,X,0.5);                            %h=0.5  
plot(X,Y,'r.',X,yy1,'g.',X,yy2,'y.',X,yy3,'b.');
legend('ԭʼ����','h = 0.1','h = 0.3','h=0.5')%��ͼ

%��ͬhֵ��ѵ����������ͬ�ıȽ�
clear;
h=0.3;
[X1,Y1,x1,y1,x2,y2]=make_data(1,sqrt(2),2,1,100);%����100������
yy1=parzen(X1,X1,h);
[X2,Y2,x1,y1,x2,y2]=make_data(1,sqrt(2),2,1,1000);%����1000������
yy2=parzen(X2,X1,h);                              %��֮ǰ��100�������������¼���
[X3,Y3,x1,y1,x2,y2]=make_data(1,sqrt(2),2,1,10000);%����10000������
yy3=parzen(X3,X1,h);
%plot(X2,Y2,'r.',X1,yy1,'g.',X1,yy2,'b.',X1,yy3,'y.')%��ͼ
%legend('ԭʼ����','h = 0.1','h = 0.3','h=0.5');

%N=1000,h=0.3ʱ�����ַ����ıȽ�
% clear;
[X,Y,x1,y1,x2,y2]=make_data(1,sqrt(2),2,1,1000);%����1000������
 %yy1=parzen(X,X,0.3);                            %��һ�ַ���
 %yy2=parzen2(X,X,0.3);                           %�ڶ��ַ���
 %plot(X,Y,'r.',X,yy1,'g.',X,yy2,'b.');           %��ͼ
 %legend('ԭʼ����','���δ�','��̬��')
%yy3=hist(X,X,0.3)
%plot(X,yy3)
for i=1:1000
    if abs(X(i,1)-1)<=abs(X(i,1)-5)
        scatter(X(i,1),Y(i,1),'g.')
        hold on 
    else
        scatter(X(i,1),Y(i,1),'r*')
        hold on
    end
end
legend('����ɹ�','����ʧ��')
    