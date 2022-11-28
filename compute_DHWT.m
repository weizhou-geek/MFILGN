% OIQA database

close all;
clear all;
clc;


image_dir = '../distorted_images/';
image_list = dir(image_dir);
img_name = cell(320,1);

for i = 3:length(image_list)
    i-2
    image_name = image_list(i).name;
    f2 = rgb2gray(imread([image_dir, image_name]));
    f2 = double(f2);
    
    %Apply Two Dimensional Discrete Wavelet Transform
    [LL,LH,HL,HH]=dwt2(f2,'haar');

    LL = uint8(LL);
    LH = uint8(LH);
    HL = uint8(HL);
    HH = uint8(HH);
    f2 = uint8(f2);

%     [LL2,LH2,HL2,HH2]=dwt2(im2double(LL),'db5');
%     f2 = edge(f2,'Prewitt');
%     LL2 = edge(LL,'Prewitt');
%     LH2 = edge(LH,'Prewitt');
%     HL2 = edge(HL,'Prewitt');
%     HH2 = edge(HH,'Prewitt');
    
    entropy_value(i-2) = entropy(f2);
    entropyLL(i-2) = entropy(LL);
    entropyLH(i-2) = entropy(LH);
    entropyHL(i-2) = entropy(HL);
    entropyHH(i-2) = entropy(HH);
    img_name(i-2) = cellstr(image_name);
%     entropyLL2(i-2) = entropy(LL2);
%     entropyLH2(i-2) = entropy(LH2);
%     entropyHL2(i-2) = entropy(HL2);
%     entropyHH2(i-2) = entropy(HH2);
end

save('entropy_DHWT.mat','entropy_value','entropyLL','entropyLH','entropyHL','entropyHH','img_name');


