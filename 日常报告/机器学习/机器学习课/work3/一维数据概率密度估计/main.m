%样本数相同，不同h值的比较
%%parzen窗口
clear;
[X,Y,x1,y1,x2,y2]=make_data(1,sqrt(2),4,1,1000);%生成1000个训练样本
yy1=parzen(X,X,0.1);                            %h=0.1  
yy2=parzen(X,X,0.3);                            %h=0.3
yy3=parzen(X,X,0.5);                            %h=0.5  
%plot(X,Y,'r.',X,yy1,'g.',X,yy2,'y.',X,yy3,'b.');%画图
%legend('原始曲线','h = 0.1','h = 0.3','h=0.5')   %画图
clear;
%%%平滑核
[X,Y,x1,y1,x2,y2]=make_data(1,sqrt(2),4,1,1000);%生成1000个训练样本
yy1=smooth(X,X,0.1);                            %h=0.1  
yy2=smooth(X,X,0.3);                            %h=0.3
yy3=smooth(X,X,0.5);                            %h=0.5  
plot(X,Y,'r.',X,yy1,'g.',X,yy2,'y.',X,yy3,'b.');
legend('原始曲线','h = 0.1','h = 0.3','h=0.5')%画图

%相同h值，训练样本数不同的比较
clear;
h=0.3;
[X1,Y1,x1,y1,x2,y2]=make_data(1,sqrt(2),2,1,100);%生成100个样本
yy1=parzen(X1,X1,h);
[X2,Y2,x1,y1,x2,y2]=make_data(1,sqrt(2),2,1,1000);%生成1000个样本
yy2=parzen(X2,X1,h);                              %对之前的100个样本进行重新计算
[X3,Y3,x1,y1,x2,y2]=make_data(1,sqrt(2),2,1,10000);%生成10000个样本
yy3=parzen(X3,X1,h);
%plot(X2,Y2,'r.',X1,yy1,'g.',X1,yy2,'b.',X1,yy3,'y.')%画图
%legend('原始曲线','h = 0.1','h = 0.3','h=0.5');

%N=1000,h=0.3时，两种方法的比较
% clear;
[X,Y,x1,y1,x2,y2]=make_data(1,sqrt(2),2,1,1000);%生成1000个样本
 %yy1=parzen(X,X,0.3);                            %第一种方法
 %yy2=parzen2(X,X,0.3);                           %第二种方法
 %plot(X,Y,'r.',X,yy1,'g.',X,yy2,'b.');           %画图
 %legend('原始曲线','矩形窗','正态窗')
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
legend('分类成功','分类失败')
    