function ePic = ePicKernel()
% ePicKernel constructor for an ePicKernel object.


% ePic.update - Values to update at next timestep
% if 0=do not update, 1=update, 2=update once
ePic.update.accel = 1;       
ePic.update.selector = 1;
ePic.update.speed = 1;
ePic.update.gyro = 1;
ePic.update.floor = 1;
ePic.update.proxi = 1;
ePic.update.ambient = 1;
ePic.update.motor = 1;
ePic.update.temp = 1;
ePic.update.micro = 1;
ePic.update.protocol = 1;
ePic.update.image = 0;        

% ePic.updated - Value that have been updated at last timestep
ePic.updated.accel = 1;       
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
ePic.updated.image = 0;   

% ePic.value - Value of each different parameters
ePic.value.accel = zeros(1,3);   % accelerometers
ePic.value.selector = 0;
ePic.value.speed = zeros(1,2);
ePic.value.gyro = zeros(1,3);
ePic.value.floor = zeros(1,3);
ePic.value.proxi = zeros(1,8);   % proximity
ePic.value.ambient = zeros(1,8);   % light sensor
ePic.value.motor = zeros(1,2);
ePic.value.temp = 0;
ePic.value.micro = zeros(1,3);   % microphones
ePic.value.protocol = 0;
ePic.value.image = 0;            % camera

% ePic.set - Value to set at next timestep;
ePic.set.bodyled = 0;
ePic.set.speed = zeros(1,2);
ePic.set.frontled = 0;
ePic.set.led = zeros(1,2);
ePic.set.motor = zeros(1,2);     % set speed at 0
ePic.set.reset = 0;
ePic.set.stop = 0;
ePic.set.sound = 0;


% ePic.param - Parameter of ePic
ePic.param.connected = 0;       % 1=connected, 0=not connected
ePic.param.comPort = 0;         % connected communication port
ePic.param.controllerState = 0; % controller state
ePic.param.odomIni = 0;         % define if odometry has been initialized of not
ePic.param.imgMode = 1;         % camera mode
ePic.param.imgSize = [40 40];   % image size
ePic.param.imgZoom = 8;         % camera zoom factor
ePic.param.imgMod = 1;          % if camera param has been modified since last updateimage
ePic.param.extSel = 8;          % selected external sensor
ePic.param.customCommand = [];   % send a list of custom command
ePic.param.customSize = 0;       % size of the data to receive resulting from the custom command

ePic.randb_state = 0;

ePic = class(ePic,'ePicKernel');
