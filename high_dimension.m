%% (1)
clear;clc;
%----------------
syms rho v B 
assume(rho>0)
assume(1-abs(v)^2>0)
assume(rho,'real')
assume(v,'real')
assume(B,'real')
D=rho/sqrt(1-abs(v)^2);
m=rho*v/(1-abs(v)^2)+B^2*v-(v*B)*B;
E=rho/(1-abs(v)^2)+(1+abs(v)^2)/2*abs(B)^2-(v*B)^2/2;
U=[D,m,B,E];

syms rho_s v_s B_s
assume(rho_s>0)
assume(1-abs(v_s)^2>0)
assume(rho_s,'real')
assume(v_s,'real')
assume(B_s,'real')
D_s=rho_s/sqrt(1-abs(v_s)^2);
m_s=rho_s*v_s/(1-abs(v_s)^2)+B_s^2*v_s-(v_s*B_s)*B_s;
E_s=rho_s/(1-abs(v_s)^2)+(1+abs(v_s)^2)/2*abs(B_s)^2-(v_s*B_s)^2/2;
n_s=[-sqrt(1-abs(v_s)^2),-v_s,-(1-abs(v_s)^2)*B_s-(v_s*B_s)*v_s,1];
U_s=[D_s,m_s,B_s,E_s];

F=(U-U_s)*n_s.';
Check1=simplify(diff(F,rho))
Check2=simplify(diff(F,rho,2))

latex(Check1) % 方便在word输入公式

%% (2)
clear;clc;
%----------------
syms rho v B 
assume(rho>0)
assume(1-abs(v)^2>0)
assume(rho,'real')
assume(v,'real')
assume(B,'real')
D=rho/sqrt(1-abs(v)^2);
m=rho*v/(1-abs(v)^2)+B^2*v-(v*B)*B;
E=rho/(1-abs(v)^2)+(1+abs(v)^2)/2*abs(B)^2-(v*B)^2/2;
U=[D,m,B,E];

syms rho_s v_s B_s
assume(rho_s>0)
assume(1-abs(v_s)^2>0)
assume(rho_s,'real')
assume(v_s,'real')
assume(B_s,'real')
D_s=rho_s/sqrt(1-abs(v_s)^2);
m_s=rho_s*v_s/(1-abs(v_s)^2)+B_s^2*v_s-(v_s*B_s)*B_s;
E_s=rho_s/(1-abs(v_s)^2)+(1+abs(v_s)^2)/2*abs(B_s)^2-(v_s*B_s)^2/2;
n_s=[-sqrt(1-abs(v_s)^2),-v_s,-(1-abs(v_s)^2)*B_s-(v_s*B_s)*v_s,1];
U_s=[D_s,m_s,B_s,E_s];

F=(U-U_s)*n_s.';
F_rho_is_0=simplify(subs(F,rho,0))
latex(F_rho_is_0)






%% (4) ---random analysis
clear;clc;
%----------------
syms rho v1 v2 v3 B1 B2 B3
assume(rho>0)
assume(rho,'real')
assume(v1,'real')
assume(v2,'real')
assume(v3,'real')
assume(B1,'real')
assume(B2,'real')
assume(B3,'real')
v=[v1,v2,v3];
B=[B1,B2,B3];
assume(1-v*v.'>0)
D=rho/sqrt(1-v*v.');
m=rho*v/(1-v*v.')+B*B.'*v-(v*B.')*B;
E=rho/(1-v*v.')+(1+v*v.')/2*(B*B.')-(v*B.')^2/2;
U=[D,m,B,E];

%----------------
syms rho_s v1_s v2_s v3_s B1_s B2_s B3_s
assume(rho_s>0)
assume(rho_s,'real')
assume(v1_s,'real')
assume(v2_s,'real')
assume(v3_s,'real')
assume(B1_s,'real')
assume(B2_s,'real')
assume(B3_s,'real')
v_s=[v1_s,v2_s,v3_s];
B_s=[B1_s,B2_s,B3_s];
assume(1-v_s*v_s.'>0)
D_s=rho_s/sqrt(1-v_s*v_s.');
m_s=rho_s*v_s/(1-v_s*v_s.')+B_s*B_s.'*v_s-(v_s*B_s.')*B_s;
E_s=rho_s/(1-v_s*v_s.')+(1+v_s*v_s.')/2*(B_s*B_s.')-(v_s*B_s.')^2/2;
n_s=[-sqrt(1-v_s*v_s.'),-v_s,-(1-v_s*v_s.')*B_s-(v_s*B_s.')*v_s,1];
U_s=[D_s,m_s,B_s,E_s];

F=(U-U_s)*n_s.';
Check1=simplify(diff(F,rho,1));

Check2=simplify(diff(F,rho,2));

Check3=simplify(subs(F,rho,0));

%create values
rho_value=1./rand(1,1e3)-1;
r_value=rand(1,1e3);
phi_value=2*pi*rand(1,1e3);
theta_value=2*pi*rand(1,1e3);
v1_value=r_value.*sin(phi_value).*cos(theta_value);
v2_value=r_value.*sin(phi_value).*sin(theta_value);
v3_value=r_value.*cos(phi_value);
B1_value=(2*rand(1,1e3)-1).*(1./rand(1,1e3));
B2_value=(2*rand(1,1e3)-1).*(1./rand(1,1e3));
B3_value=(2*rand(1,1e3)-1).*(1./rand(1,1e3));

rho_s_value=1./rand(1,1e3)-1;
r_s_value=rand(1,1e3);
phi_s_value=2*pi*rand(1,1e3);
theta_s_value=2*pi*rand(1,1e3);
v1_s_value=r_s_value.*sin(phi_s_value).*cos(theta_s_value);
v2_s_value=r_s_value.*sin(phi_s_value).*sin(theta_s_value);
v3_s_value=r_s_value.*cos(phi_s_value);
B1_s_value=(2*rand(1,1e3)-1).*(1./rand(1,1e3));
B2_s_value=(2*rand(1,1e3)-1).*(1./rand(1,1e3));
B3_s_value=(2*rand(1,1e3)-1).*(1./rand(1,1e3));

value=zeros(1,length(rho_s_value));
for i=1:length(r_s_value)
value(i)=subs(Check1,[rho,v1,v2,v3,B1,B2,B3,rho_s,v1_s,v2_s,v3_s,B1_s,B2_s,B3_s],[rho_value(i),v1_value(i),v2_value(i),v3_value(i),B1_value(i),B2_value(i),B3_value(i),rho_s_value(i),v1_s_value(i),v2_s_value(i),v3_s_value(i),B1_s_value(i),B2_s_value(i),B3_s_value(i)]);
end
Check1_random=sum(find(value<=0))     % one order diff

value_twopartial=zeros(1,length(rho_s_value));
for i=1:length(r_s_value)
value_twopartial(i)=subs(Check2,[rho,v1,v2,v3,B1,B2,B3,rho_s,v1_s,v2_s,v3_s,B1_s,B2_s,B3_s],[rho_value(i),v1_value(i),v2_value(i),v3_value(i),B1_value(i),B2_value(i),B3_value(i),rho_s_value(i),v1_s_value(i),v2_s_value(i),v3_s_value(i),B1_s_value(i),B2_s_value(i),B3_s_value(i)]);
end
Check2_random=sum(value_twopartial)  % two order diff


value_rhois0=zeros(1,length(rho_s_value));
for i=1:length(r_s_value)
value_rhois0(i)=subs(Check3,[v1,v2,v3,B1,B2,B3,rho_s,v1_s,v2_s,v3_s,B1_s,B2_s,B3_s],[v1_value(i),v2_value(i),v3_value(i),B1_value(i),B2_value(i),B3_value(i),rho_s_value(i),v1_s_value(i),v2_s_value(i),v3_s_value(i),B1_s_value(i),B2_s_value(i),B3_s_value(i)]);
end
Check3_random=sum(find(value_rhois0<0))


value_F=zeros(1,length(rho_s_value));
 for i=1:length(r_s_value)
 value_F(i)=subs(F,[rho,v1,v2,v3,B1,B2,B3,rho_s,v1_s,v2_s,v3_s,B1_s,B2_s,B3_s],[rho_value(i),v1_value(i),v2_value(i),v3_value(i),B1_value(i),B2_value(i),B3_value(i),rho_s_value(i),v1_s_value(i),v2_s_value(i),v3_s_value(i),B1_s_value(i),B2_s_value(i),B3_s_value(i)]);
 end
 Check4_random=sum(find(value_F<0))


%% (4) ----symbolic prove
clear;clc;
%----------------
syms rho v1 v2 v3 B1 B2 B3
assume(rho>0)
assume(rho,'real')
assume(v1,'real')
assume(v2,'real')
assume(v3,'real')
assume(B1,'real')
assume(B2,'real')
assume(B3,'real')
v=[v1,v2,v3];
B=[B1,B2,B3];
assume(1-v*v.'>0)
D=rho/sqrt(1-v*v.');
m=rho*v/(1-v*v.')+B*B.'*v-(v*B.')*B;
E=rho/(1-v*v.')+(1+v*v.')/2*(B*B.')-(v*B.')^2/2;
U=[D,m,B,E];

%----------------
syms rho_s v1_s v2_s v3_s B1_s B2_s B3_s
assume(rho_s>0)
assume(rho_s,'real')
assume(v1_s,'real')
assume(v2_s,'real')
assume(v3_s,'real')
assume(B1_s,'real')
assume(B2_s,'real')
assume(B3_s,'real')
v_s=[v1_s,v2_s,v3_s];
B_s=[B1_s,B2_s,B3_s];
assume(1-v_s*v_s.'>0)
D_s=rho_s/sqrt(1-v_s*v_s.');
m_s=rho_s*v_s/(1-v_s*v_s.')+B_s*B_s.'*v_s-(v_s*B_s.')*B_s;
E_s=rho_s/(1-v_s*v_s.')+(1+v_s*v_s.')/2*(B_s*B_s.')-(v_s*B_s.')^2/2;
n_s=[-sqrt(1-v_s*v_s.'),-v_s,-(1-v_s*v_s.')*B_s-(v_s*B_s.')*v_s,1];
U_s=[D_s,m_s,B_s,E_s];

F=(U-U_s)*n_s.';

%---------------------------------------------(1)
F_simple=simplify(F);
Check1=simplify(diff(F,rho,1)); % check the one order partial derivation
latex(Check1);
Check2=simplify(diff(F,rho,2)); % check the two order partial derivation

Check3=simplify(subs(F_simple,rho,0));
equation=collect(Check3,B1)==0;
solution=simplify(solve(equation,B1));
isreal(solution(1))
isreal(solution(2))