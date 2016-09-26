clear 
clc

%DAQ support
%http://www.mathworks.com/matlabcentral/fileexchange/40749-getting-started-with-ni-mydaq
%http://www.mathworks.com/help/daq/index.html

%Grabs list of devices
daq.getDevices

% Now you should see a list of devices, of which we will select the
% myDAQ device. The following command will allow you to create a
% data acquisition session with the myDAQ device
s = daq.createSession('ni');


%    XfrontX    M1 M2
%      \ /       \ /
%      / \       / \
%     X   X     M3  M4
rotor1 = s.addAnalogInputChannel('myDAQ1', 'ai0', 'Voltage');
rotor2 = s.addAnalogInputChannel('myDAQ1', 'ai1', 'Voltage');
rotor3 = s.addAnalogInputChannel('myDAQ1', 'ai2', 'Voltage');
rotor4 = s.addAnalogInputChannel('myDAQ1', 'ai3', 'Voltage');

%Time stamped data
%[data, timestamps, triggerTime] = s.startForeground;

pos1 = [-1 -1 2 2];
pos2 = [19 19 2 2];
pos3 = [19 -1 2 2];
pos4 = [-1 19 2 2];

%for k = 1:100
%rotor1(k) = rand*10;
%rotor2(k) = rand*10;
%rotor3(k) = rand*10;
%rotor4(k) = rand*10;
%end

rectangle('Position',pos1,'Curvature',[1 1])
rectangle('Position',pos2,'Curvature',[1 1])
rectangle('Position',pos3,'Curvature',[1 1])
rectangle('Position',pos4,'Curvature',[1 1])
hold on %%%

x = ((rotor1 - rotor3)*(sqrt(2)/2)) + ((rotor2-rotor4)*(sqrt(2)/2)) + (rotor1-rotor4) + (rotor2-rotor3) + 10;
y = ((rotor4 - rotor2)*(sqrt(2)/2)) + ((rotor1-rotor3)*(sqrt(2)/2)) + (rotor1-rotor2) + (rotor4-rotor3) + 10;

axis equal

for k = 1:length(x)
    plot(x(k),y(k),'b-x')
    line(x(k),y(k))
    hold on %%%
    pause(.05)
end








