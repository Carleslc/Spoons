close all
im = imread('nox.png');
% impixelinfo
figure, imshow(im), title('NOX')
y = 143;
x = 199;
frame = im(y:end-6, x:end-6, :);
[hFrame, wFrame, ~] = size(frame); % factor px to OSX local of 0.25 (tablet 1440x900)
figure, imshow(frame), title('NOX borders')
quest = frame(800:1650,1:1000,:);
figure, imshow(quest), title('Quest borders')
imQ = imread('1523449103.png');
frameQ = imQ(y:end-6, x:end-6, :);
questQ = frameQ(800:1650,1:1000,:);
figure, imshow(questQ), title('Quest Active borders')

active = zeros(256, 256, 3, 'uint8');
active(:, :, 1) = questQ(10, 306, 1);
active(:, :, 2) = questQ(10, 306, 2);
figure, imshow(active), title('ACTIVE')
active(1,1,:)

unactive = zeros(256, 256, 3, 'uint8');
unactive(:, :, 1) = quest(10, 306, 1);
unactive(:, :, 2) = quest(10, 306, 2);
figure, imshow(unactive), title('UNACTIVE')
unactive(1,1,:)