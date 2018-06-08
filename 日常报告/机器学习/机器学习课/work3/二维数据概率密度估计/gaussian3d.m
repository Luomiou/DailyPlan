function p = gaussian3d(x,y,h)
%ÅĞ¶Ïx,yÖ®¼äµÄ¾àÀë
dis = (x-y)/h;
p = 1/(2*pi)*exp((-1/2)*dis*dis');
end