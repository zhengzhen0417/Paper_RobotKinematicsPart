function t1=Hom2Pose_XYZ(R)
 
%R为3by3旋转矩阵
 
r11=R(1,1);r12=R(1,2);r13=R(1,3);
r21=R(2,1);r22=R(2,2);r23=R(2,3);
r31=R(3,1);r32=R(3,2);r33=R(3,3);
x=R(1,4);
y=R(2,4);
z=R(3,4);

 
%解方程组后得以下
%t1 = [1,1,1, -atan2(-r32, r33), -atan2(r31, sqrt(r32^2 + r33^2)),-atan2(-r21, r11);];

                                                                                                                                                                                                                                                                                                                                                                                       
t1 = [1,1,1, atan2(r32, r33), atan2(-r31, sqrt(r32^2 + r33^2)),atan2(r21, r11);];
t1=t1*180/pi;
t1(1)=x;
t1(2)=y;
t1(3)=z;

%t1= roundn(t1,-5);
end