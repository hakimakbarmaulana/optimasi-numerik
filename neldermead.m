clear all;
clc;
syms x;
syms y;
fprintf('Metode Nelder Mead');
f=x^3-y-x*y-6*x+y^2;%x^2-x*y-4*x+y^2-y;
k=1;
v1=[1,0];
v2=[0,0];
v3=[0,1];
eps=4e-5;
fprintf('\n|        u               v               w\n')
while norm(v2-v1)>eps
    d=[v1;v2;v3];
    z1=subs(f,[x,y],v1);
    z2=subs(f,[x,y],v2);
    z3=subs(f,[x,y],v3);
    z=[z1 z2 z3];
   for i=1:2
       for j=1:2
           if z(j)>z(j+1)
               t1=z(j);
               t2=d(j,:);
               z(j)=z(j+1);
               d(j,:)=d(j+1,:);
               z(j+1)=t1;
               d(j+1,:)=t2;
           end
       end
   end
   u=d(1,:);
   v=d(2,:);
   w=d(3,:);
   fprintf('%3d (%5.3f,%5.3f)   (%5.3f,%5.3f)   (%5.3f,%5.3f)\n',k,u(1),u(2),v(1),v(2),w(1),w(2));
   m=(u+v)/2;
   r=2*m-w;%m+(m-w)
   fu=subs(f,[x,y],u);
   fv=subs(f,[x,y],v);
   fr=subs(f,[x,y],r);
   if fr>fu && fr<fv %fu<fr<fv
       w=r;
   elseif fr<fu %extend
           e=3*m-2*w;%m+2*(m-w)
           fe=subs(f,[x,y],e);
           if fe<fr
               w=e;
           else
               w=r;
           end
   else %fr>fv contract
       ci=(w+m)/2;
       co=(m+r)/2;
       fci=subs(f,[x,y],ci);
       fco=subs(f,[x,y],co);
       if fci<min(fco,fv)
           w=ci;
       elseif fco<min(fci,fv)
           w=co;
       else %shrinkage
           v=(u+v)/2;
           w=(w+u)/2;
       end
   end
   v1=u;
   v2=v;
   v3=w;
   k=k+1;
   fu=subs(f,[x,y],u);
   fv=subs(f,[x,y],v);
   fw=subs(f,[x,y],w);
   ezsurf(f);
   hold on;
   plot3([u(1) v(1) w(1)],[u(2) v(2) w(2)],[fu fv fw],'m*','markerfacecolor','r');
   hold off;
   pause(0.1);
end
fprintf('\nJadi nilai minimumnya berada di titik (%5.3f,%5.3f) dengan nilai %5.3f\n',u(1),u(2),double(fu))