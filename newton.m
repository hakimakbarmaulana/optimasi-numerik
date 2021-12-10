clear all;
clc;
tic;
syms x y alpha0;
fprintf('METODE NEWTON');
% f=x^4-12*x^2-4*x+y^4-16*y^2-5*y-20*cos(x-2.5)*cos(y-2.9);
% x0=[0;-1];
f=x^2-x*y-4*x+y^2-y;
x0=[1;2];
gradf=jacobian(f);
hesf=hessian(f);
eps=1e-6;
i=1;
normgradf1=1;
fprintf('\ni         x1         fidouble         norm\n');
while normgradf1>eps
    gradf0=subs(gradf,[x;y],x0);
    hesf0=subs(hesf,[x;y],x0);
    x1=double(x0)-double(inv(hesf0)*gradf0');
%     x1=x0-alpha0*double(inv(hesf0)*gradf0');
%     falpha0=subs(f,[x;y],x1);
%     dfalpha0=diff(falpha0,alpha0);
%     a0min=solve(dfalpha0);
%     a0min=double(a0min);
%     x1=subs(x1,alpha0,a0min);
    
    f1=subs(f,[x;y],x1);
    gradf1=subs(gradf,[x;y],x1);
    normgradf1=norm(gradf1);
    fprintf('%3d     (%5.5f,%5.5f)     %5.5f     %5.5f\n',i,double(x1),double(f1),double(normgradf1));
    x0=x1;
    i=i+1;
end
ezsurf(f);
hold on;
plot3(x1(1,1),x1(2,1),f1,'*r');
toc;