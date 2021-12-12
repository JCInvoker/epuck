function ePic = set(ePic,varargin)
% SET Set asset properties and return the updated object. The information
% will be send to ePuck during the next update cycle.
%
% ePic = set(ePic,propName,value)
%
% Results :
%   ePic            :   updated ePicKernel object
%
% Parameters :
%   ePic            :   ePicKernel object
%   value           :   value to set
%   propName        :
%       'speed'           :   set motor speed values
%       'ledON'           :   switch the led number (value) on
%       'ledOFF'          :   switch the led number (value) off
%       'odom'            :   set odometry values for current position and
%                             set the initialization flag to restart
%                             odometry
%       'camMode'         :   set camera mode (0:grayscale, 1:color)
%       'camSize'         :   set camera image size [width, height]
%       'camZoom'         :   set camera zoom factor (1,4,8)
%       'external'        :   select the external sensor to update. For the
%                             list of sensor, please refer to the
%                             ePicKernel.update file
%       'ledIR'           :   select the IR led for the external 5 led
%                             range sensor
%       'custom'          :   defines a custom command to send to the
%                             e-puck. It takes as argument a vector
%                             containing [command, size of the data]
%       'rgbleds'         :   change the RGB LEDs state

propertyArgIn = varargin;
while length(propertyArgIn) >= 2,
    prop = propertyArgIn{1};
    val = propertyArgIn{2};
    propertyArgIn = propertyArgIn(3:end);
    switch prop
        case 'bodyled'
            ePic.set.bodyled = val;
        case 'speed'
            ePic.set.speed = val;
            if ePic.set.speed(1) < -1200
                ePic.set.speed(1) = -1200;
            elseif ePic.set.speed(1) > 1200
                ePic.set.speed(1) = 1200;
            end
            if ePic.set.speed(2) < -1200
                ePic.set.speed(2) = -1200;
            elseif ePic.set.speed(2) > 1200
                ePic.set.speed(2) = 1200;
            end
        case 'frontled'
            ePic.set.frontled = val;
        case 'led'
            ePic.set.led = val;
        case 'motor'
            ePic.set.motor = val;
            if ePic.set.motor(1) < -1200
                ePic.set.motor(1) = -1200;
            elseif ePic.set.motor(1) > 1200
                ePic.set.motor(1) = 1200;
            end
            if ePic.set.motor(2) < -1200
                ePic.set.motor(2) = -1200;
            elseif ePic.set.motor(2) > 1200
                ePic.set.motor(2) = 1200;
            end
        case 'reset'
            ePic.set.reset = val;
        case 'stop'
            ePic.set.stop = val;
        case 'sound'
            ePic.set.sound = val;
            
            
        otherwise
            error('Asset properties: Descriptor, Date, CurrentValue')
    end
end