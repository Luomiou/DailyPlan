%（使用ginput）
plot(Data_luyu(1:500,1),Data_luyu(1:500,2),'*')
hold on
plot(Data_guiyu(1:500,1),Data_guiyu(1:500,2),'r*')
legend('鲈鱼','鲑鱼');
%鲈鱼各属性均值
luyu_avg=mean(Data_luyu,1);
%鲑鱼各属性均值
guiyu_avg=mean(Data_guiyu,1);
%鲈鱼各属性方差
luyu_var=var(Data_luyu,1);
%鲑鱼各属性方差
guiyu_var=var(Data_guiyu,1);
P_Luyu=0.4;
P_Guiyu=0.6;
for i=1:10
    [x,y]=ginput(1);
    P_LY_length=1/(sqrt(2*pi)*luyu_var(1,1))*exp(-((x-luyu_avg(1,1))^2)/(2*luyu_var(1,1)^2));
    P_LY_light=1/(sqrt(2*pi)*luyu_var(1,2))*exp(-((x-luyu_avg(1,2))^2)/(2*luyu_var(1,2)^2));
    P_LY=P_Luyu*P_LY_length*P_LY_light;
    
    P_GY_length=1/(sqrt(2*pi)*guiyu_var(1,1))*exp(-((x-guiyu_avg(1,1))^2)/(2*guiyu_var(1,1)^2));
    P_GY_light=1/(sqrt(2*pi)*guiyu_var(1,2))*exp(-((x-guiyu_avg(1,2))^2)/(2*guiyu_var(1,2)^2));
    P_GY=P_Guiyu*P_GY_length*P_GY_light;
    
    if P_LY>P_GY
        disp('该样本是鲈鱼');
    else
        disp('该样本是鲑鱼');
    end
end
