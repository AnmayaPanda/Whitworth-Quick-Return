%A program to Simulate Whiworth Quick Return Mechanism
clear all
close all
clc

%User Input
fprintf('%50snn','Whitworth Quick Return Mechanism');
r = input('Enter the number of Revolutionn');
len = 40;
len1 = 20;
len2 = 10;
len4 = 56;
len5 = 20;

%Default Values
ct =1;
   
%Mechanism
for theta1 = 0:0.1:r*2*pi
    len3 = sqrt(((len1)^2 + (len2)^2 + 2*(len1)*(len2)*sin(theta1)));
    theta2 = acos((len2)*cos(theta1) / (len3));
    theta3 = asin(-1*(len4*sin(theta2) - len) / (len5));
    len6 = (len4)*cos(theta2) - (len5)*cos(theta3);
   
    %Plotting
    figure(1)
    plot([0,0],[0,len],'--.k','LineWidth',0.5);
    hold on
    plot([-60,60],[40,40],'--.k','LineWidth',0.5);
    viscircles([0,len1],len2,'LineStyle','--','LineWidth',0.5,'Color','k');
    plot([0,len2*cos(theta1)],[len1,len1+len2*sin(theta1)],'o-','LineWidth',2);
    plot([0,len4*cos(theta2)],[0,len4*sin(theta2)],'o-','LineWidth',2);
    plot([len4*cos(theta2),len6],[len4*sin(theta2),len],'o-','LineWidth',2);
   
    %Tool
    plot([len6+5,len6+5],[len-2,len+2],'k','LineWidth',1);
    plot([len6-5,len6-5],[len-2,len+2],'k','LineWidth',1);
    plot([len6+5,len6-5],[len+2,len+2],'k','LineWidth',1);
    plot([len6-5,len6+5],[len-2,len-2],'k','LineWidth',1);
    plot([len6-5,len6-6],[len-2,len-4],'k','LineWidth',1);
    plot([len6-6,len6-1],[len-4,len-2],'k','LineWidth',1);
   
    %Material
    plot([-40,-50],[33.5,33.5],'k','LineWidth',13);
    plot([-40,-50],[33.5,33.5],'k','LineWidth',13);
    plot([-40,-40],[33.5,33.5],'k','LineWidth',13);
    plot([-50,-50],[33.5,33.5],'k','LineWidth',13);
   
    title('Whitworth Quick Return Mechanism');
    hold off
    axis(gca,'equal');
    axis([-60,60,-10,80]);
    A(ct) = getframe(gcf);
    ct=ct+1;
pause(0.1)
end
             
%Making Video
movie(A);
videofile = VideoWriter('Whitworth Quick Return Mechanism.avi','Uncompressed AVI');
open(videofile);
writeVideo(videofile, A);
close(videofile);
