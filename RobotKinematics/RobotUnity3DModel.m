%扬天修改型R20 机器人DH模型 在Unity3d中使用的模型，尺寸和实际尺寸有差异
%工具参数为0 0 60 0 0 0 所以加了60
% offset        d           a               theta
MDH=[-pi/2      197.30      0              0;
     -pi/2      200         0             -pi/2;
     0          -174.5      809.2          0;
     pi/2       128.8       720.2          0;
    0           113         0              pi/2;
     pi/2      104.5     0             -pi/2];
 

 
L1 = Link('d',  197.30, 'a',0,         'alpha', 0,      'offset',-pi/2, 'modified');   %Link 类函数
L2 = Link('d',  200,    'a',0,         'alpha', -pi/2,  'offset',-pi/2,'modified');
L3 = Link('d', -174.5,  'a',809.2,     'alpha',0,       'offset',0,     'modified');
L4 = Link('d', 128.8,   'a',720.2,     'alpha', 0,      'offset',pi/2,  'modified');
L5 = Link('d', 113 ,    'a',0,         'alpha', pi/2,   'offset',0,     'modified');
L6 = Link('d', 104.5,'a',0,        'alpha', -pi/2,  'offset',pi/2,   'modified');
robot=SerialLink([L1,L2,L3,L4,L5,L6]);   %SerialLink 类函数
%robot.plot([deg2rad(-6.75),deg2rad(-5.48),deg2rad(-117.13),deg2rad(44.60),deg2rad(90.08),deg2rad(35.49)]);%251.48 798.41 540.30 -168.08 1.32 132.09
% robot.display();  %Link 类函数
robot.teach()
modt06=robot.fkine([deg2rad(-7.45),deg2rad(-43.24),deg2rad(-91.40),deg2rad(44.60),deg2rad(76),deg2rad(35.49)]); %工具箱正解函数
%modmyt06=myfkine(deg2rad(-6.75),deg2rad(-5.48),deg2rad(-117.13),deg2rad(44.60),deg2rad(90.08),deg2rad(35.49))   ;%手写的正解函数
modmyt06=myfkine(MDH,deg2rad(-7.45),deg2rad(-43.24),deg2rad(-91.40),deg2rad(44.60),deg2rad(76),deg2rad(35.49)) %手写的正解函数
 %pos22= tr2rpy(modmyt06,'xyz','deg')
 Hom2Pose_XYZ(modmyt06);
%手写反解
inv06=mymodikine(MDH,modmyt06);

 inv06deg=inv06*180/pi
% res=zeros(8,6);
% %反解验算
% for i=1:8       
%     hom= myfkine(MDH,inv06(i,1),inv06(i,2),inv06(i,3),inv06(i,4),inv06(i,5),inv06(i,6));    
%     pos= tr2rpy(hom,'xyz','deg');
%     res(i,1:3)=hom(1:3,4);
%     res(i,4:6)=pos(1,3:-1:1);   
% end
% res
% zxy= Rotr(3,deg2rad(312.9401))*Rotr(1,deg2rad(0.0293))*Rotr(2,deg2rad(180.0845))
 xyz=Rotr(1,deg2rad(1.8360))*Rotr(2,deg2rad(166.1185))*Rotr(3,deg2rad(312.7115));
% zyx=Rotr(3,deg2rad(312.9401))*Rotr(2,deg2rad(180.0845))*Rotr(1,deg2rad(0.0293))
%xyz=Rotr(1,deg2rad(179.9707105453))*Rotr(2,deg2rad(-0.084511108298116))*Rotr(3,deg2rad(-132.939999023956))

