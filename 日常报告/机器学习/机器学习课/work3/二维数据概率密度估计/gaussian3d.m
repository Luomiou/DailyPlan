function p = gaussian3d(x,y,h)
%�ж�x,y֮��ľ���
dis = (x-y)/h;
p = 1/(2*pi)*exp((-1/2)*dis*dis');
end