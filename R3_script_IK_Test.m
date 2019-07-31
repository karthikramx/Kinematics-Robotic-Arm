%joint values in radians
joint1_val = -2;
joint2_val = 2;
joint3_val = -0.5;

%Link lengths
L=[10,7,5];

%Inverse Kinematics *comment this section to perform only forward
%kinematics
x = 5;   %x position 
z = 10;    %z position
phi = 0;  %end effector orientation     
[JA] = R2_IK(x,z,L,phi,-1); %inverse kinematic function
offset=[0 0 0];             %offset to match up FK and IK
dmt = [-1 -1 -1];           %direction matrix to match up FK and IK
JA = JA+offset;
JA = JA.*dmt;
joint1_val = JA(1);       
joint2_val = JA(2);
joint3_val = JA(3);

%Forward Kinematics
F0 = T(0,0,0)*RY(joint1_val);
F1 = F0*T(L(1),0,0)*RY(joint2_val);
F2 = F1*T(L(2),0,0)*RY(joint3_val);
F3 = F2*T(L(3),0,0);

%plotting
hold on;
plot_line(F0,F1);
plot_line(F1,F2);
plot_line(F2,F3);

plot_transformation_frame(F0); %plots the transformation frame
plot_transformation_frame(F1); %plots the transformation frame
plot_transformation_frame(F2); %plots the transformation frame
plot_transformation_frame(F3); %plots the transformation frame

axis equal;
xlabel('x');
ylabel('y');
zlabel('z');
axis([-10 10 -5 5 -5 20])
grid on;
hold off
