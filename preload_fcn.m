%% create DUT and set analysis parameters
H = tf([1],[1 -.5] );
BW = 10; % Hz
OSR = 2.56;
Fs = OSR*BW; % 25.6 Hz
NFFT = 1024;
AvgFac = 100;  
p = 1/AvgFac;
FF = 1 - p;
%% view analytical response
w = linspace(0,2*pi*BW,NFFT/OSR);
[mag,phz,wout] = bode(H,w);
mag = squeeze(mag);
phz = squeeze(phz);
figure;subplot(211);plot(w/(2*pi),20*log10(mag));grid
title('Magnitude Response');xlabel('Hz');ylabel('dB');
set(gca,'Ylim',[-50 10]);
subplot(212);plot(w/(2*pi),phz);grid
title('Phase Response');xlabel('Hz');ylabel('degrees');

