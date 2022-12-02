% Given f is a cosine wave
f = @(p) cos(2*pi*(1/16)*(p+4))+3;

%% Test 1: isometrically generate p
p = (0:99)/5;
y = f(p);
plot(p,y,'.')

threshold = 3.2;
wcd_plot(p, y, 0, threshold, true)

%% Test 2: setting p as normal random with mu=10, sigma=5
p = 5*randn(1,100)+10;
y = f(p);
plot(p,y,'.')

threshold = 3.2;
wcd_plot(p, y, 0, threshold, true)