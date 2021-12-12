function display(ePic)
% display sensor informations
%
% display(ePic)
%
% Results :
%   ePic            :   updated ePicKernel object
%
% Parameters :
%   ePic            :   ePicKernel object

disp '------------- ePic Kernel v2.3 updated by Jiacheng Chen -------------';
disp ' ';
disp '-----> sensors informations :'
disp 'Accelerometers : '
disp (ePic.value.accel);
disp 'Proximity sensors : '
disp (ePic.value.proxi);
disp 'Light sensors : '
disp (ePic.value.ambient);
disp 'Microphones : '
disp (ePic.value.micro);
disp 'Motor speed : '
disp (ePic.value.speed);
disp 'E-puck2 Selector Position: '
disp (ePic.value.selector);
disp 'E-puck2 gyro:'
disp(ePic.value.gyro);
disp 'E-puck2 floor:'
disp(ePic.value.floor);