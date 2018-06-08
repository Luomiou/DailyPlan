%��ʹ��ginput��
plot(Data_luyu(1:500,1),Data_luyu(1:500,2),'*')
hold on
plot(Data_guiyu(1:500,1),Data_guiyu(1:500,2),'r*')
legend('����','����');
%��������Ծ�ֵ
luyu_avg=mean(Data_luyu,1);
%��������Ծ�ֵ
guiyu_avg=mean(Data_guiyu,1);
%��������Է���
luyu_var=var(Data_luyu,1);
%��������Է���
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
        disp('������������');
    else
        disp('������������');
    end
end
