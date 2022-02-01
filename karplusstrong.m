%% implementation
f = input("Enter frequency (in Hz): ");
dur = input("Enter duration (in second): ");
fs = 44100;
y = ks(f, dur, fs);
sound(y, fs);

audiowrite('E.wav', y, fs);

%% function

function y = ks(f, dur, fs)

    % f = fundamental frequency (in Hz)
    % dur = duration (in sec)

    % input "burst"!
    x = [1 zeros(1, (dur*fs-1))];
    
    % round(phase delay line)
    N = round(fs/f);

    % loop filters
    b = [zeros(1,N) 1];
    a = [1 zeros(1,N-1) -.5 -.5];
    
    y = filter(b, a, x);

end