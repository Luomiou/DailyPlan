function n=inbar(x,y,h)
%ÅĞ¶Ïx,yÖ®¼äµÄ¾àÀë
if abs((x-y)/h)<1/2;
    n=1;
else
    n=0;
end
    