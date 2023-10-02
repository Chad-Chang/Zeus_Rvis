robot = rigidBodyTree;


db = 0.015;
d1 = 0.145;d2 = -0.135;d3 = 0.490 ;d4 = 0.135; d5 = 0.370; d6 = 0.100;d7 = 0.065;
th1 = 0;th2 = 0;th3 = 0;th4 = 0;th5 = 0;th6 = 0;th6 = 0;
% th1 = deg2rad(0.193);th2 = deg2rad(-0.142);th3 = deg2rad(0.074);th4 = -deg2rad(0.131);th5 = deg2rad(0.039-90); th6 = -deg2rad(0.001);
th_off1 =pi/2 ;th_off2 = pi; th_off3 = pi; th_off4 = pi;th_off5 = pi; th_off6 = pi;%th_off7 = pi/2;
th_off7 = 0;
alp1 =pi/2 ;alp2 =pi/2 ;alp3 =pi/2 ;alp4 =pi/2 ;alp5 =pi/2 ;alp6 =pi/2 ; alp7 = 0;

tform_base = dh(0,db,0,0);
tform0 = dh(th1+th_off1,d1,0,alp1);
tform1 = dh(th2+th_off2,d2,0,alp2);
tform2 = dh(th_off3,d3,0,alp3);
tform3 = dh(th3+th_off4,d4,0,alp4);
tform4 = dh(th4+th_off5,d5,0,alp5);
tform5 = dh(th5+th_off6,d6,0,alp6);
tform6 = dh(th6+th_off7,d7,0,alp7);

total_tf = tform0*tform1*tform2*tform3*tform4*tform5*tform6

body_base = rigidBody('body_base');
fix_b = rigidBodyJoint('fix_b','revolute');
setFixedTransform(fix_b,tform_base); 
body_base.Joint = fix_b;
addBody(robot,body_base,'base'); % 로봇의 시작점이 base와 붙어있다.


body1 = rigidBody('body1');
jnt1 = rigidBodyJoint('jnt1','revolute');
setFixedTransform(jnt1,tform0); 
body1.Joint = jnt1;
addBody(robot,body1,'body_base'); % 로봇의 시작점이 base와 붙어있다.

body2 = rigidBody('body2');
fix1 = rigidBodyJoint('fix1','fixed');
setFixedTransform(fix1,tform1); 
body2.Joint = fix1;
addBody(robot,body2,'body1'); % 로봇의 시작점이 base와 붙어있다.

body3 = rigidBody('body3');
jnt2 = rigidBodyJoint('jnt2','revolute');
setFixedTransform(jnt2,tform2); 
body3.Joint = jnt2;
addBody(robot,body3,'body2'); % 로봇의 시작점이 base와 붙어있다.


body4 = rigidBody('body4');
jnt4 = rigidBodyJoint('jnt4','revolute');
setFixedTransform(jnt4,tform3); 
body4.Joint = jnt4;
addBody(robot,body4,'body3'); % 로봇의 시작점이 base와 붙어있다.

body5 = rigidBody('body5');
jnt5 = rigidBodyJoint('jnt5','revolute');
setFixedTransform(jnt5,tform4); 
body5.Joint = jnt5;
addBody(robot,body5,'body4'); % 로봇의 시작점이 base와 붙어있다.

body6 = rigidBody('body6');
jnt6 = rigidBodyJoint('jnt6','revolute');
setFixedTransform(jnt6,tform5); 
body6.Joint = jnt6;
addBody(robot,body6,'body5'); % 로봇의 시작점이 base와 붙어있다.

body7 = rigidBody('body7');
endeffector = rigidBodyJoint('endeffector','fixed');
setFixedTransform(endeffector,tform6); 
body7.Joint = endeffector;
addBody(robot,body7,'body6'); % 로봇의 시작점이 base와 붙어있다.

% endeffector = rigidBody('endeffector');
% addBody(robot,endeffector,'body7');

Cconfig = homeConfiguration(robot);

% Cconfig(1).JointPosition = pi/2;
% Cconfig(2).JointPosition = pi/2;
% Cconfig(3).JointPosition = pi/2;
% Cconfig(4).JointPosition = pi/2;
% Cconfig(5).JointPosition = pi/2;
% Cconfig(6).JointPosition = pi/2;

%hello

show(robot,Cconfig);
hold on
