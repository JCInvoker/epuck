function ePic = update(ePic)
% update ePic parameter. 
% ask for selected sensors information and set motor, led and other
% parameters values on the ePuck.
%
% use the methode '[ePic] = updateDef(ePic, propName, value)' to define
% which sensor will be updated
%   
% ePic = update(ePic)
%
% Results :
%   ePic            :   updated ePicKernel object
%
% Parameters :
%   ePic            :   ePicKernel object


if (ePic.param.connected == 0)
    return;
end

% reset updated values
ePic.updated.accel = 0;
ePic.updated.selector = 0;
ePic.updated.speed = 0;
ePic.updated.gyro = 0;
ePic.updated.floor = 0;
ePic.updated.proxi = 0;
ePic.updated.ambient = 0;
ePic.updated.motor = 0;
ePic.updated.temp = 0;
ePic.updated.micro = 0;
ePic.updated.protocol = 0;



if(isempty(ePic.set.bodyled)~=1) % set body led
    tmp = sprintf('B,%d',ePic.set.bodyled);
    write(ePic,tmp);
    pause(0.05);
    read(ePic);
end

if(isempty(ePic.set.motor)~=1) % set motor speed
    tmp = sprintf('D,%d,%d',ePic.set.motor(1),ePic.set.motor(2));
    write(ePic,tmp);
    pause(0.05);
    read(ePic);
end

if(isempty(ePic.set.frontled)~=1) % set front led
    tmp = sprintf('F,%d',ePic.set.frontled); 
    write(ePic,tmp);
    pause(0.05);
    read(ePic);
end

if(isempty(ePic.set.led)~=1)
    tmp = sprintf('L,%d,%d',ePic.set.led(1),ePic.set.led(2));
    write(ePic,tmp);
    pause(0.05);
    read(ePic);
end

if(isempty(ePic.set.motor)~=1)
    tmp = sprintf('P,%d,%d',ePic.set.motor(1),ePic.set.motor(2));
    write(ePic,tmp);
    pause(0.05);
    read(ePic);
end

% if(isempty(ePic.set.reset)~=1)
%     tmp = sprintf('R');
%     write(ePic,tmp);
%     pause(0.05);
%     read(ePic);
% end
% 
% if(isempty(ePic.set.stop)~=1)
%     tmp = sprintf('S');
%     write(ePic,tmp);
%     pause(0.05);
%     read(ePic);
% end
% 
if(isempty(ePic.set.sound)~=1)
    tmp = sprintf('T,%d',ePic.set.sound);
    write(ePic,tmp);
    pause(0.05);
    read(ePic);
end

% get functions
if(ePic.update.accel > 0)
    tmp = sprintf('A');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.accel = (sscanf(result,'a,%d,%d,%d'))';
    ePic.updated.accel = ePic.updated.accel + 1;
end

if(ePic.update.selector > 0)
    tmp = sprintf('C');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.selector = (sscanf(result,'c,%d'))';
    ePic.updated.selector = ePic.updated.selector + 1;
end

if(ePic.update.speed > 0)
    tmp = sprintf('E');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.speed = (sscanf(result,'e,%d,%d'))';
    ePic.updated.speed = ePic.updated.speed + 1;
end

if(ePic.update.gyro > 0)
    tmp = sprintf('g');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.gyro = (sscanf(result,'g,%d,%d,%d'))';
    ePic.updated.gyro = ePic.updated.gyro + 1;
end

if(ePic.update.floor > 0)
    tmp = sprintf('M');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.floor = (sscanf(result,'m,%d,%d,%d'))';
    ePic.updated.floor = ePic.updated.floor + 1;
end

if(ePic.update.proxi > 0)
    tmp = sprintf('N');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.proxi = (sscanf(result,'n,%d,%d,%d,%d,%d,%d,%d,%d'))';
    ePic.updated.proxi = ePic.updated.proxi + 1;
end

if(ePic.update.ambient > 0)
    tmp = sprintf('O');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.ambient = (sscanf(result,'o,%d,%d,%d,%d,%d,%d,%d,%d'))';
    ePic.updated.ambient = ePic.updated.ambient + 1;
end

if(ePic.update.motor > 0)
    tmp = sprintf('Q');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.motor = (sscanf(result,'q,%d,%d'))';
    ePic.updated.motor = ePic.updated.motor + 1;
end

if(ePic.update.temp > 0)
    tmp = sprintf('t');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.temp = (sscanf(result,'t,%d'))';
    ePic.updated.temp = ePic.updated.temp + 1;
end

if(ePic.update.micro > 0)
    tmp = sprintf('U');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.micro = (sscanf(result,'u,%d,%d,%d'))';
    ePic.updated.micro = ePic.updated.micro + 1;
end

if(ePic.update.protocol > 0)
    tmp = sprintf('V');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.protocol = sscanf(result,'v,%s')
    ePic.updated.protocol = ePic.updated.protocol + 1;
end

% % set RGB LEDs state
% if (isempty(ePic.set.rgbled2)~=1||isempty(ePic.set.rgbled4)~=1||isempty(ePic.set.rgbled6)~=1||isempty(ePic.set.rgbled8)~=1)
%     command=[command -10 ...
%         ePic.set.rgbled2(1,1) ePic.set.rgbled2(1,2) ePic.set.rgbled2(1,3)...
%         ePic.set.rgbled4(1,1) ePic.set.rgbled4(1,2) ePic.set.rgbled4(1,3)...
%         ePic.set.rgbled6(1,1) ePic.set.rgbled6(1,2) ePic.set.rgbled6(1,3)...
%         ePic.set.rgbled8(1,1) ePic.set.rgbled8(1,2) ePic.set.rgbled8(1,3)];
%     ePic.set.rgbleds = [ePic.set.rgbled2;ePic.set.rgbled4;ePic.set.rgbled6;ePic.set.rgbled8];  
% end
% 
% if(isempty(ePic.set.extensionrgb0)~=1||isempty(ePic.set.extensionrgb1)~=1||isempty(ePic.set.extensionrgb2)~=1||...
%         isempty(ePic.set.extensionrgb3)~=1||isempty(ePic.set.extensionrgb4)~=1||isempty(ePic.set.extensionrgb5)~=1||...
%         isempty(ePic.set.extensionrgb6)~=1||isempty(ePic.set.extensionrgb7)~=1||isempty(ePic.set.extensionrgb8)~=1)
%     command = [command -'w' ...
%         ePic.set.extensionrgb0(1,1) ePic.set.extensionrgb1(1,1) ePic.set.extensionrgb2(1,1)...
%         ePic.set.extensionrgb3(1,1) ePic.set.extensionrgb4(1,1) ePic.set.extensionrgb5(1,1)...
%         ePic.set.extensionrgb6(1,1) ePic.set.extensionrgb7(1,1)...
%         ePic.set.extensionrgb0(1,2) ePic.set.extensionrgb1(1,2) ePic.set.extensionrgb2(1,2)...
%         ePic.set.extensionrgb3(1,2) ePic.set.extensionrgb4(1,2) ePic.set.extensionrgb5(1,2)...
%         ePic.set.extensionrgb6(1,2) ePic.set.extensionrgb7(1,2)...
%         ePic.set.extensionrgb0(1,3) ePic.set.extensionrgb1(1,3) ePic.set.extensionrgb2(1,3)...
%         ePic.set.extensionrgb3(1,3) ePic.set.extensionrgb4(1,3) ePic.set.extensionrgb5(1,3)...
%         ePic.set.extensionrgb6(1,3) ePic.set.extensionrgb7(1,3)...
%         ePic.set.extensionrgb8(1,1) ePic.set.extensionrgb8(1,2) ePic.set.extensionrgb8(1,3)...
%         ePic.set.IRstate];
% end
% 
% 


% if ePic.randb_state == 0
%     tmp = sprintf('W,64,12,150'); % set range
%     write(ePic,tmp);
%     pause(0.05);
%     read(ePic);
%     tmp = sprintf('W,64,17,0'); % set onboard calculation
%     write(ePic,tmp);
%     pause(0.05);
%     read(ePic);
%     ePic.randb_state = 1
% end
% if ePic.randb_state == 1
%     tmp = sprintf('Y,64,0');
%     write(ePic,tmp);
%     pause(0.05);
%     read(ePic);
%     ret = read(ePic);
%     value = sscanf(ret, 'y,%d');
%     if value == 1
%         tmp = sprintf('Y,64,1');
%         write(ePic,tmp);
%         pause(0.05);
%         read(ePic);
%         read(ePic)
%         tmp = sprintf('Y,64,2');
%         write(ePic,tmp);
%         pause(0.05);
%         read(ePic);
%         read(ePic)
%     end
% end


% Reset update once parameters
if ePic.update.accel == 2
    ePic.update.accel = 0; 
end
if ePic.update.selector == 2
    ePic.update.selector = 0; 
end
if ePic.update.speed == 2
    ePic.update.speed = 0; 
end
if ePic.update.gyro == 2
    ePic.update.gyro = 0; 
end
if ePic.update.floor == 2
    ePic.update.floor = 0; 
end
if ePic.update.proxi == 2
    ePic.update.proxi = 0; 
end
if ePic.update.ambient == 2
    ePic.update.ambient = 0;
end
if ePic.update.motor == 2
    ePic.update.motor = 0; 
end
if ePic.update.temp == 2
    ePic.update.temp = 0; 
end
if ePic.update.micro == 2
    ePic.update.micro = 0; 
end
if ePic.update.protocol == 2
    ePic.update.protocol = 0; 
end



