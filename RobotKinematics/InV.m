syms t1 t2 t3 t4 t5 t6 d1 d2 d3 d4 d5 d6 a3 a4;
syms nx ny nz ox oy oz ax ay az px py pz;
MDH=[t1   d1         0              0;
     t2  d2       0              -pi/2;
     t3  d3      a3        0;
     t4  d4         a4        0;
     t5  d5     0              pi/2;
     t6  d6       0            -pi/2];
 

 
%  d1=199;
%  d2=208.5;
%  d3=-173.5;
%  d4=121;
%  d5=120.179;
%  d6=104.5;
%  a3=809.779;
%  a4=719.175;
 
 offset=[-pi/2 -pi/2 0 pi/2 0 0];
 
T01=[cos(MDH(1,1))                 -sin(MDH(1,1))                 0               MDH(1,3);
     cos(MDH(1,4))*sin(MDH(1,1))    cos(MDH(1,4))*cos(MDH(1,1))  -sin(MDH(1,4))  -MDH(1,2)*sin(MDH(1,4));
     sin(MDH(1,4))*sin(MDH(1,1))    sin(MDH(1,4))*cos(MDH(1,1))   cos(MDH(1,4))   MDH(1,2)*cos(MDH(1,4));
     0                              0                             0               1];
T12=[cos(MDH(2,1))                 -sin(MDH(2,1))                 0               MDH(2,3);
     cos(MDH(2,4))*sin(MDH(2,1))    cos(MDH(2,4))*cos(MDH(2,1))  -sin(MDH(2,4))  -MDH(2,2)*sin(MDH(2,4));
     sin(MDH(2,4))*sin(MDH(2,1))    sin(MDH(2,4))*cos(MDH(2,1))   cos(MDH(2,4))   MDH(2,2)*cos(MDH(2,4));
     0                              0                             0               1];
T23=[cos(MDH(3,1))                 -sin(MDH(3,1))                 0               MDH(3,3);
     cos(MDH(3,4))*sin(MDH(3,1))    cos(MDH(3,4))*cos(MDH(3,1))  -sin(MDH(3,4))  -MDH(3,2)*sin(MDH(3,4));
     sin(MDH(3,4))*sin(MDH(3,1))    sin(MDH(3,4))*cos(MDH(3,1))   cos(MDH(3,4))   MDH(3,2)*cos(MDH(3,4));
     0                              0                             0               1];
T34=[cos(MDH(4,1))                 -sin(MDH(4,1))                 0               MDH(4,3);
     cos(MDH(4,4))*sin(MDH(4,1))    cos(MDH(4,4))*cos(MDH(4,1))  -sin(MDH(4,4))  -MDH(4,2)*sin(MDH(4,4));
     sin(MDH(4,4))*sin(MDH(4,1))    sin(MDH(4,4))*cos(MDH(4,1))   cos(MDH(4,4))   MDH(4,2)*cos(MDH(4,4));
     0                              0                             0               1];
T45=[cos(MDH(5,1))                 -sin(MDH(5,1))                 0               MDH(5,3);
     cos(MDH(5,4))*sin(MDH(5,1))    cos(MDH(5,4))*cos(MDH(5,1))  -sin(MDH(5,4))  -MDH(5,2)*sin(MDH(5,4));
     sin(MDH(5,4))*sin(MDH(5,1))    sin(MDH(5,4))*cos(MDH(5,1))   cos(MDH(5,4))   MDH(5,2)*cos(MDH(5,4));
     0                              0                             0               1];
T56=[cos(MDH(6,1))                 -sin(MDH(6,1))                 0               MDH(6,3);
     cos(MDH(6,4))*sin(MDH(6,1))    cos(MDH(6,4))*cos(MDH(6,1))  -sin(MDH(6,4))  -MDH(6,2)*sin(MDH(6,4));
     sin(MDH(6,4))*sin(MDH(6,1))    sin(MDH(6,4))*cos(MDH(6,1))   cos(MDH(6,4))   MDH(6,2)*cos(MDH(6,4));
     0                              0                             0               1];


mT=[nx ox ax px;
    ny oy ay py;
    nz oz az pz;
    0 0   0  1;    
];
% nx= modmyt06(1,1);
% ny=modmyt06(2,1);
% nz=modmyt06(3,1);
% ox= modmyt06(1,2);
% oy=modmyt06(2,2);
% oz=modmyt06(3,2);
% ax= modmyt06(1,3);
% ay=modmyt06(2,3);
% az=modmyt06(3,3);
% px= modmyt06(1,4);
% py=modmyt06(2,4);
% pz=modmyt06(3,4);

%J1
t11=atan2(d2+d3+d4,sqrt((py-d6*ay)^2+(d6*ax-px)^2-(d2+d3+d4)^2))-atan2(py-d6*ay,d6*ax-px);
t12=atan2(d2+d3+d4,-sqrt((py-d6*ay)^2+(d6*ax-px)^2-(d2+d3+d4)^2))-atan2(py-d6*ay,d6*ax-px);
%J5
t51=atan2(sqrt((ny*cos(t11)-nx*sin(t11))^2+(oy*cos(t11)-ox*sin(t11))^2),ay*cos(t11)-ax*sin(t11));
t52=atan2(-sqrt((ny*cos(t11)-nx*sin(t11))^2+(oy*cos(t11)-ox*sin(t11))^2),ay*cos(t11)-ax*sin(t11));
t53=atan2(sqrt((ny*cos(t12)-nx*sin(t12))^2+(oy*cos(t12)-ox*sin(t12))^2),ay*cos(t12)-ax*sin(t12));
t54=atan2(-sqrt((ny*cos(t12)-nx*sin(t12))^2+(oy*cos(t12)-ox*sin(t12))^2),ay*cos(t12)-ax*sin(t12));
%J6

% t61=atan2((ox*sin(t11)-oy*cos(t11))/sin(t51),(ny*cos(t11)-nx*sin(t11))/sin(t51));
% t62=atan2((ox*sin(t11)-oy*cos(t11))/sin(t52),(ny*cos(t11)-nx*sin(t11))/sin(t52));
% t63=atan2((ox*sin(t12)-oy*cos(t12))/sin(t53),(ny*cos(t12)-nx*sin(t12))/sin(t53));
% t64=atan2((ox*sin(t12)-oy*cos(t12))/sin(t54),(ny*cos(t12)-nx*sin(t12))/sin(t54));

%q234
%(1,3) (3,3)
% T16=T12*T23*T34*T45*T56;
% TT=inv(T01)*mT;
% t234_1=atan2(az/sin(t51),-(ax*cos(t11)+ay*sin(t11))/sin(t51));
% t234_2=atan2(az/sin(t52),-(ax*cos(t11)+ay*sin(t11))/sin(t52));
% t234_3=atan2(az/sin(t53),-(ax*cos(t12)+ay*sin(t12))/sin(t53));
% t234_4=atan2(az/sin(t54),-(ax*cos(t12)+ay*sin(t12))/sin(t54));

%J2  (1,4) (3,4)
% T15=T12*T23*T34*T45;
% TT=inv(T01)*mT*inv(T56);
% A_1=px*cos(t11)+py*sin(t11)-ay*d6*sin(t11)-ax*d6*cos(t11)-d5*sin(t234_1);
% A_2=px*cos(t11)+py*sin(t11)-ay*d6*sin(t11)-ax*d6*cos(t11)-d5*sin(t234_2);
% A_3=px*cos(t12)+py*sin(t12)-ay*d6*sin(t12)-ax*d6*cos(t12)-d5*sin(t234_3);
% A_4=px*cos(t12)+py*sin(t12)-ay*d6*sin(t12)-ax*d6*cos(t12)-d5*sin(t234_4);
% 
% B_1=pz-d1-az*d6-d5*cos(t234_1);
% B_2=pz-d1-az*d6-d5*cos(t234_2);
% B_3=pz-d1-az*d6-d5*cos(t234_3);
% B_4=pz-d1-az*d6-d5*cos(t234_4);

% t21=atan2(a4^2-a3^2-(A_1)^2-(B_1)^2,  sqrt(4*a3^2*((A_1)^2+(B_1)^2)-(a4^2-a3^2-(A_1)^2-(B_1)^2)^2))+atan2(A_1,B_1);
% t22=atan2(a4^2-a3^2-(A_1)^2-(B_1)^2,  -sqrt(4*a3^2*((A_1)^2+(B_1)^2)-(a4^2-a3^2-(A_1)^2-(B_1)^2)^2))+atan2(A_1,B_1);
% t23=atan2(a4^2-a3^2-(A_2)^2-(B_2)^2,  sqrt(4*a3^2*((A_2)^2+(B_2)^2)-(a4^2-a3^2-(A_2)^2-(B_2)^2)^2))+atan2(A_2,B_2);
% t24=atan2(a4^2-a3^2-(A_2)^2-(B_2)^2,  -sqrt(4*a3^2*((A_2)^2+(B_2)^2)-(a4^2-a3^2-(A_2)^2-(B_2)^2)^2))+atan2(A_2,B_2);
% t25=atan2(a4^2-a3^2-(A_3)^2-(B_3)^2,  sqrt(4*a3^2*((A_3)^2+(B_3)^2)-(a4^2-a3^2-(A_3)^2-(B_3)^2)^2))+atan2(A_3,B_3);
% t26=atan2(a4^2-a3^2-(A_3)^2-(B_3)^2,  -sqrt(4*a3^2*((A_3)^2+(B_3)^2)-(a4^2-a3^2-(A_3)^2-(B_3)^2)^2))+atan2(A_3,B_3);
% t27=atan2(a4^2-a3^2-(A_4)^2-(B_4)^2,  sqrt(4*a3^2*((A_4)^2+(B_4)^2)-(a4^2-a3^2-(A_4)^2-(B_4)^2)^2))+atan2(A_4,B_4);
% t28=atan2(a4^2-a3^2-(A_4)^2-(B_4)^2,  -sqrt(4*a3^2*((A_4)^2+(B_4)^2)-(a4^2-a3^2-(A_4)^2-(B_4)^2)^2))+atan2(A_4,B_4);






%J23
% t23_1=atan2(-(B_1+a3*sin(t21)),A_1-a3*cos(t21));
% t23_2=atan2(-(B_1+a3*sin(t22)),A_1-a3*cos(t22));
% t23_3=atan2(-(B_2+a3*sin(t23)),A_2-a3*cos(t23));
% t23_4=atan2(-(B_2+a3*sin(t24)),A_2-a3*cos(t24));
% t23_5=atan2(-(B_3+a3*sin(t25)),A_3-a3*cos(t25));
% t23_6=atan2(-(B_3+a3*sin(t26)),A_3-a3*cos(t26));
% t23_7=atan2(-(B_4+a3*sin(t27)),A_4-a3*cos(t27));
% t23_8=atan2(-(B_4+a3*sin(t28)),A_4-a3*cos(t28));
%J3
% t31=t23_1-t21;
% t32=t23_2-t22;
% t33=t23_3-t23;
% t34=t23_4-t24;
% t35=t23_5-t25;
% t36=t23_6-t26;
% t37=t23_7-t27;
% t38=t23_8-t28;

%J4
% t41=t234_1-t23_1;
% t42=t234_1-t23_2;
% t43=t234_2-t23_3;
% t44=t234_2-t23_4;
% t45=t234_3-t23_5;
% t46=t234_3-t23_6;
% t47=t234_4-t23_7;
% t48=t234_4-t23_8;


clc;
%q1=rad2deg(t11)
%q1=rad2deg(t12)
% rad2deg(t51);
% rad2deg(t52);
% rad2deg(t53);
% rad2deg(t54);

% rad2deg(t61);
% rad2deg(t62)
% rad2deg(t63)
% rad2deg(t64)

% rad2deg(t234_1);
% rad2deg(t234_2);
% rad2deg(t234_3);
% rad2deg(t234_4);
% 
% rad2deg(t21);
% rad2deg(t22);
% rad2deg(t23)
% rad2deg(t24)
% rad2deg(t25)
% rad2deg(t26)
% rad2deg(t27)
% rad2deg(t28)

% rad2deg(t31);
% rad2deg(t32);
% 
% 
% rad2deg(t41);
% rad2deg(t42);
% ikine_t=[t11 t21 t31 t41 t51 t61;
%           t11 t22 t32 t42 t51 t61;
%           t11 t23 t33 t43 t52 t62;
%           t11 t24 t34 t44 t52 t62
%           t12 t25 t35 t45 t53 t63;
%           t12 t26 t36 t46 t53 t63;
%           t12 t27 t37 t47 t54 t64;
%           t12 t28 t38 t48 t54 t64];
% 
% ikine_t(1,:)=ikine_t(1,:)-offset;
% ikine_t(2,:)=ikine_t(2,:)-offset;
% ikine_t(3,:)=ikine_t(3,:)-offset;
% ikine_t(4,:)=ikine_t(4,:)-offset;
% ikine_t(5,:)=ikine_t(5,:)-offset;
% ikine_t(6,:)=ikine_t(6,:)-offset;
% ikine_t(7,:)=ikine_t(7,:)-offset;
% ikine_t(8,:)=ikine_t(8,:)-offset;
% 
%  ikine_t=wrapToPi(ikine_t);
% 
% ikine_t=rad2deg(ikine_t)

T16=T12*T23*T34*T45*T56;
TT=inv(T01)*mT;

simplify(T16)
simplify(TT)
s1= simplify( TT(2,3))
s2=simplify( TT(2,3))

s11= simplify(T16(2,3))
s22=simplify(T16(2,4))

