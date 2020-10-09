%扬天修改型R20 机器人DH模型
L1 = Link('d',  199, 'a', 0, 'alpha', 0,'offset',-pi/2,'modified');   %Link 类函数
L2 = Link('d',  208.5, 'a',0, 'alpha', -pi/2,'offset',-pi/2,'modified');
L3 = Link('d', -173.5, 'a', 809.779, 'alpha',0,'offset',0,'modified');
L4 = Link('d', 121, 'a', 719.175, 'alpha', 0,'offset',pi/2,'modified');
L5 = Link('d', 120.179 , 'a', 0, 'alpha', pi/2,'modified');
L6 = Link('d', 104.5, 'a', 0,  'alpha', -pi/2,'offset',pi/2,'modified');
robot=SerialLink([L1,L2,L3,L4,L5,L6]);   %SerialLink 类函数
 robot.plot([deg2rad(-6.75),deg2rad(-5.48),deg2rad(-117.13),deg2rad(44.60),deg2rad(90.08),deg2rad(35.49)]);%251.48 798.41 540.30 -168.08 1.32 132.09
% robot.display();  %Link 类函数
robot.teach

%modt06=robot.fkine([deg2rad(-6.75),deg2rad(-5.48),deg2rad(-117.13),deg2rad(44.60),deg2rad(90.08),deg2rad(35.49)]); %工具箱正解函数
modmyt06=myfkine(deg2rad(-6.75),deg2rad(-5.48),deg2rad(-117.13),deg2rad(44.60),deg2rad(90.08),deg2rad(35.49))   ;    %手写的正解函数
%手写反解
inv06=mymodikine(modmyt06);
inv06deg=inv06*180/pi
res=zeros(8,6);
%反解验算
for i=1:8       
    hom= myfkine(inv06(i,1),inv06(i,2),inv06(i,3),inv06(i,4),inv06(i,5),inv06(i,6));    
    pos= tr2rpy(hom,'xyz','deg');
    res(i,1:3)=hom(1:3,4);
    res(i,4:6)=pos(1,3:-1:1);   
end
res












