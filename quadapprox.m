clear all;
clc;
syms x;
fprintf('METODE QUADRATIC APPROXIMATION\n');
f=2*x^sin(0.5*x)-cos(0.25*x)^(5*x);%(x^2-4)^2/8-1;
x0=0.3;
x2=2.25;
x1=(x0+x2)/2;

% plot
xp=x0:0.001:x2;
fp=double(subs(f,xp));
plot(xp,fp);
hold on;

eps=0.001;
delx=1;
fprintf('=======================================\n');
fprintf('it|   x0   |   x1   |   x2   |   x3   |\n');
fprintf('=======================================\n');
i=1;
while eps<delx
    f0=double(subs(f,x0));
    f1=double(subs(f,x1));
    f2=double(subs(f,x2));
    x3=(f0*(x1^2-x2^2)+f1*(x2^2-x0^2)+f2*(x0^2-x1^2))/(2*(f0*(x1-x2)+f1*(x2-x0)+f2*(x0-x1)));
    f3=double(subs(f,x3));
    fprintf('%3i|   %5.3f|   %5.3f|   %5.3f|   %5.3f|\n',i,x0,x1,x2,x3);

%     pt=plotabc(f,x0,x1,x2);
%     ff=pt(1)*x^2+pt(2)*x+pt(3);
%     yp=double(subs(ff,xp));
%     plot(xp,yp,'-g');
%     hold on;

    %plot
    plot(xp,fp,'-b');
    hold on;
    plot(x1,f1,'*r',x3,f3,'*r');
    hold off;
    pause(0.2);
    delx=abs(x2-x0);
    if x3<x1
        if f3<f1
            x2=x1;
            x1=x3;
        else
            x0=x3;
        end
    else
        if f3<=f1
            x0=x1;
            x1=x3;
        else
            x2=x3;
        end
    end
    i=i+1;
end
fprintf('Jadi minimumnya berada di x= %5.3f dengan nilai minimumnya %5.3f\n',x0,double(subs(f,x0)));