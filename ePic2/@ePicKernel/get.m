function [val, up] = get(ePic, propName)
% GET Get asset properties from the specified object
% and return the value
% 
% [val, up] = get(ePic, propName)
%
% results :
%   val             :   value of sensors
%   up              :   flag that defines if asked values has been updated on
%                        the last update (0:not updated, 1: updated)
% Parameters :
%   ePic            :   ePicKernel object
%   propName        :   
%       'accel'           :   get accelerometer values
%       'proxi'           :   get proximity sensors values
%       'light'           :   get light sensors values
%       'micro'           :   get micro values
%       'speed'           :   get motor speed values
%       'pos'             :   get wheel encoder values
%       'odom'            :   get odometry position
%       'floor'           :   get floor sensor values
%       'external'        :   get external sensor value
%       'image'           :   get camera image
%       'custom'          :   get the raw values requested by the custom command
%       'connectionState' :   get the connection flag (1:connected, 0:disconnected)
%       'ledR'            :   get ledR
%       'ledG'            :   get ledG
%       'ledB'            :   get ledB

switch propName
% Access to ePic values
    case 'accel'
        val = ePic.value.accel;
        up = ePic.updated.accel;
    case 'selector'
        val = ePic.value.selector;
        up = ePic.updated.selector;
    case 'speed'
        val = ePic.value.speed;
        up = ePic.updated.speed;
    case 'gyro'
        val = ePic.value.gyro;
        up = ePic.updated.gyro;
    case 'floor'
        val = ePic.value.floor;
        up = ePic.updated.floor;
    case 'proxi'
        val = ePic.value.proxi;
        up = ePic.updated.proxi;
    case 'ambient'
        val = ePic.value.ambient;
        up = ePic.updated.ambient;
    case 'motor'
        val = ePic.value.motor;
        up = ePic.updated.motor;
    case 'temp'
        val = ePic.value.temp;
        up = ePic.updated.temp;
    case 'micro'
        val = ePic.value.micro;
        up = ePic.updated.micro;
    case 'protocol'
        val = ePic.value.protocol;
        up = ePic.updated.protocol;
    otherwise
        error([propName,' Is not a valid asset property'])
end