clear all;
clc;
syms x;
fprintf('METODE GOLDEN SEARCH\n');
fprintf('Fungsi f(x)=(x^2-4)^2/8-1\n');
fprintf('Nilai xL=0\n');
fprintf('Nilai xU=3\n');
f=x^5+x^4-3*x^3-5;
xL=0;
xU=2;
% plot
x0=0:0.001:3;
f0=double(subs(f,x0));
plot(x0,f0);
hold on;
r=(-1+sqrt(5))/2;
eps=1e-4;
fprintf('=======================================\n');
fprintf('it|   xL   |   x1   |   x2   |   xU   |\n');
fprintf('=======================================\n');
i=1;
while eps<xU-xL
    d=r*(xU-xL);
    x1=xL+d;
    x2=xU-d;
    f1=double(subs(f,x1));
    f2=double(subs(f,x2));
    fprintf('%3i|   %5.3f|   %5.3f|   %5.3f|   %5.3f|\n',i,xL,x1,x2,xU);
    if f1<f2
        xL=x2;
    else
        xU=x1;
    end
    
    plot(x0,f0,'-b');
    hold on;
    plot(x1,f1,'*r',x2,f2,'*r');
    hold off;
    pause(0.5);
    i=i+1;
end
fprintf('Jadi minimumnya berada di x= %5.3f dengan nilai minimumnya %5.3f\n',xL,double(subs(f,xL)));

