%修改型的PUMA560
L1 = Link('d',  0, 'a', 0, 'alpha', 0,'offset',pi/2,'modified');   %Link 类函数
L2 = Link('d',  0.149, 'a',0, 'alpha', -pi/2,'offset',0,'modified');
L3 = Link('d', 0, 'a', 0.430, 'alpha',0,'offset',-pi/2,'modified');
L4 = Link('d', 0.433, 'a', 0.020, 'alpha', -pi/2,'offset',0,'modified');
L5 = Link('d', 0, 'a', 0, 'alpha', pi/2,'modified');
L6 = Link('d', 0, 'a', 0,  'alpha', -pi/2,'modified');
robot=SerialLink([L1,L2,L3,L4,L5,L6]);   %SerialLink 类函数
robot.display();  %Link 类函数
robot.teach()
% modt06=robot.fkine([0,0,pi/2,0,0,pi/2]) %工具箱正解函数
