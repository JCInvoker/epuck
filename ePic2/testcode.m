function ePic = update(ePic)
if(ePic.param.connected == 0)
    return;
end
% set functions

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

% get functions
if(ePic.update.accel > 0)
    tmp = sprintf('A');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.accel = sccanf(result,'a,%f,%f,%f');
    ePic.updated.accel = ePic.updated.accel + 1;
end

if(ePic.update.selector > 0)
    tmp = sprintf('C');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.selector = sccanf(result,'c,%d');
    ePic.updated.selector = ePic.updated.selector + 1;
end

if(ePic.update.motor > 0)
    tmp = sprintf('E');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.selector = sccanf(result,'e,%d,%d');
    ePic.updated.selector = ePic.updated.selector + 1;
end

if(ePic.update.gyro > 0)
    tmp = sprintf('g');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.gyro = sccanf(result,'g,%f,%f,%f');
    ePic.updated.gyro = ePic.updated.gyro + 1;
end

if(ePic.update.floor > 0)
    tmp = sprintf('M');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.floor = sccanf(result,'m,%d,%d,%d');
    ePic.updated.floor = ePic.updated.floor + 1;
end

if(ePic.update.proxi > 0)
    tmp = sprintf('N');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.proxi = sccanf(result,'n,%d,%d,%d,%d,%d,%d,%d,%d');
    ePic.updated.proxi = ePic.updated.proxi + 1;
end

if(ePic,update.ambient > 0)
    tmp = sprintf('O');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.ambient = sccanf(result,'o,%d,%d,%d,%d,%d,%d,%d,%d');
    ePic.updated.ambient = ePic.updated.ambient + 1;
end

if(ePic.update.motor > 0)
    tmp = sprintf('Q');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.motor = sccanf(result,'q,%d,%d');
    ePic.updated.motor = ePic.updated.motor + 1;
end

if(ePic.update.temp > 0)
    tmp = sprintf('t');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.temp = sccanf(result,'t,%d');
    ePic.updated.temp = ePic.updated.temp + 1;
end

if(ePic.update.micro > 0)
    tmp = sprintf('U');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.micro = sccanf(result,'u,%d,%d,%d');
    ePic.updated.micro = ePic.updated.micro + 1;
end

if(ePic.update.protocol > 0)
    tmp = sprintf('V');
    write(ePic,tmp);
    pause(0.05);
    result = read(ePic);
    ePic.value.protocol = sccanf(result,'v,%s')
    ePic.updated.protocol = ePic.updated.protocol + 1;
end


