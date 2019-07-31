%joint angles in radians
joint1_val = -2;
joint2_val = 2;
joint3_val = -0.5;

%Forward kinematics
F0 = T(0,0,0)*RY(joint1_val);
F1 = F0*T(10,0,0)*RY(joint2_val);
F2 = F1*T(7,0,0)*RY(joint3_val);
F3 = F2*T(5,0,0);
 
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
axis([-5 15 -5 5 -5 20])
grid on;
hold off
