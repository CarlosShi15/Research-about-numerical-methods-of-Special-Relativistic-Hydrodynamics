% the three variables and the constant C
%----------------------
v=2*rand(1,1e6)-1;
rho=1./rand(1,1e6)-1;
p=1./rand(1,1e6)-1;
C1=1./rand(1,1e6)+1;
C2=2;

% the other three variables
%------------
D=rho./sqrt(1-v.^2);
m1=(rho+C1.*p).*v./(1-v.^2);
E1=(rho+C1.*p)./(1-v.^2)-p;
m2=(rho+C2.*p).*v./(1-v.^2);
E2=(rho+C2.*p)./(1-v.^2)-p;

% what we need to check
%------------
t=2*rand(1,1e6)-1;
D_c=D.*(1+t.*v);
m_c1=m1.*(1+t.*v)+t.*p;
E_c1=E1+t.*m1;
m_c2=m2.*(1+t.*v)+t.*p;
E_c2=E2+t.*m2;


Check1=E_c1-sqrt(D_c.^2+m_c1.^2);
Check2=E_c2-sqrt(D_c.^2+m_c2.^2);
find(Check1<=0&Check2<=0)

%% proof of the question one(symbolic)
clear;clc;
%-------------------first proof E_hat>0!
syms rho p v c t
assume(rho>0)
assume(p>0)
assume(v<1&v>-1)
assume(c>=2)
assume(t<1&t>-1)
D=rho/sqrt(1-v^2);
m=(rho+c*p)*v/(1-v^2);
E=(rho+c*p)/(1-v^2)-p;
D_hat=D*(1+t*v);
m_hat=m*(1+t*v)+t*p;
E_hat=E+t*m;

Check=E_hat^2-m_hat^2-D_hat^2;
Check1=simplify(Check);
fac=factor(Check1);
latex(fac);
Check2=simplify(Check1/(p/(1-v^2)));   % a*rho+b*p+f

rho_coefficients=simplify(diff(Check2,rho,1));
latex(rho_coefficients);
p_coefficients=simplify(diff(Check2,p,1));
latex(p_coefficients);

remain=simplify(Check2-rho_coefficients*rho-p_coefficients*p);
%--------------------------------------

E1=simplify(E_hat);
factor(E1)

%% problem 2
clear;clc;
syms rho p v C x
assume(rho>0)
assume(p>0);
assume(v>-1&v<1);
D=rho/sqrt(1-v^2);
m=(rho+C*p)*v/(1-v^2);
E=(rho+C*p)/(1-v^2)-p;
assume(D>0);
assume(E>sqrt(D^2+m^2));
f=C*x+m^2/(E+x)+D*sqrt(1-m^2/(E+x)^2)-E-x;

%---------------
%-------value of random pick

rho_value=1./rand(1,15)-1;
p_value=1./rand(1,15)-1;
v_value=2*rand(1,15)-1;
C_value=1./rand(1,15)+1-eps; 

for i=1:length(v_value)
func=subs(f,[rho,p,v,C],[rho_value(i),p_value(i),v_value(i),C_value(i)]);
fplot(func,[0,0.3],'LineWidth',0.3)
ylim([-1,1])
hold on
grid on

end

%% problem 3----------random
clear;clc;
syms rho p v C x
assume(rho>0);
assume(p>0);
assume(v>-1&v<1);
D=rho/sqrt(1-v^2);
m=(rho+C*p)*v/(1-v^2);
E=(rho+C*p)/(1-v^2)-p;
assume(D>0);
assume(E>sqrt(D^2+m^2));


rho_value=1./rand(1,1e3)-1;
p_value=1./rand(1,1e3)-1;
v_value=2*rand(1,1e3)-1;
C_value=1./rand(1,1e3)+1-eps;   

func=C*p+m^2/(E+p)+D*sqrt(1-m^2/(E+p)^2)-E-p;

Check=zeros(1,length(rho_value));
for i=1:length(rho_value)
    Check(i)=subs(func,[rho,p,v,C],[rho_value(i),p_value(i),v_value(i),C_value(i)]);
end

sum(Check);



%% problem 3----------symbolic proof
clear;clc;
syms rho p v C x
assume(rho>0);
assume(p>0);
assume(v>-1&v<1);
D=rho/sqrt(1-v^2);
m=(rho+C*p)*v/(1-v^2);
E=(rho+C*p)/(1-v^2)-p;
assume(D>0);
assume(E>sqrt(D^2+m^2));

F=C*p+m^2/(E+p)+D*sqrt(1-m^2/(E+p)^2)-E-p
latex(F)

%% problem 4--------- no code