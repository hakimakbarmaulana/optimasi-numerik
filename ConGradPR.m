clear all;
clc;
tic;
syms x y alpha0;
fprintf('Metode Conjugate Gradient Polak-Ribiere');
f=x^2-x*y-4*x+y^2-y;
x0=[1;2];
gradf=jacobian(f)';
p0=-subs(gradf,[x;y],x0);
eps=1e-6;
i=1;
normgradf1=1;
fprintf('\ni         x1         fidouble         norm\n');
while normgradf1>eps
    gradf0=subs(gradf,[x;y],x0);
    x1=x0+alpha0*p0;
    falpha0=subs(f,[x;y],x1);
    dfalpha0=diff(falpha0,alpha0);
    a0min=solve(dfalpha0);
    a0min=double(a0min);
    
    x1=subs(x1,alpha0,a0min);
    f1=subs(f,[x;y],x1);
    gradf1=subs(gradf,[x;y],x1);
    p1=-gradf1+((gradf1'*(gradf1-gradf0))/(gradf0'*gradf0))*p0;
    normgradf1=norm(gradf1);
    fprintf('%3d     (%5.5f,%5.5f)     %5.5f     %5.5f\n',i,double(x1),double(f1),double(normgradf1));
    x0=x1;
    p0=p1;
    i=i+1;
end
ezsurf(f);
hold on;
plot3(x1(1,1),x1(2,1),f1,'*r');
toc;