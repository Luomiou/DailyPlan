function p = gaussian(x,y,h)
%�ж�x,y֮��ľ���
dis = (x-y)/h;
p = 1/((2*pi)^(1/2))*exp((-1/2)*dis*dis);
end