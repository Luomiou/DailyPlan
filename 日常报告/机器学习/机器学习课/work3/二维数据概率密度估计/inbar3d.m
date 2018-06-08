function n = inbar3d(x,y,h)
%ÅĞ¶Ïx,yÖ®¼äµÄ¾àÀë
m = length(x);
n = 1;
% sig = 1;
for i = 1:m
    if abs((x(i)-y(i))/h)>1/2;  
%         sig = 0;
        n = 0;        
        break;
    end      
end

% if (sig == 1) &&( i == m);
%         n = 1;
% end



    