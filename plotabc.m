function y=plotabc(f,x0,x1,x2)
f0=double(subs(f,x0));
f1=double(subs(f,x1));
f2=double(subs(f,x2));
b=[f0;f1;f2];
A=[x0^2 x0 1
   x1^2 x1 1
   x2^2 x2 1];
t=A\b;
y=t;