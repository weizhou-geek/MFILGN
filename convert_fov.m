clc
clear all
close all


image_dir = '../distorted_images/';
image_list = dir(image_dir);

for i = 3:length(image_list)
    i-2
    image_name = image_list(i).name;
    disImg = imread([image_dir, image_name]);
    
    Ch = 3;
%     %downsampling
%     downsampling = 4;
%     disImg = dsampling(disImg,downsampling,Ch);
    
    % Viewpoints sampling
%     [M,N,~]=size(disImg);
%     EvenM = floor(M/16)*16;
%     sampling_interval=EvenM/2;
%     spoint=s_point(EvenM,2*EvenM,sampling_interval); 
%     spoint_radian=spoint*pi/180;
    [M,N,~]=size(disImg);
    sampling_interval=M/8;
    spoint=s_point(M,N,sampling_interval); 
    spoint_radian=spoint*pi/180;

    %% Extract features for each viewport
    %size of viewport image
    fov_size = floor(M/2);

    for k = 1:length(spoint_radian)
        %given viewpoint and fov range, return the viewport image and compute the features
        vpD = cut_patch(disImg,spoint_radian(k,1),spoint_radian(k,2),fov_size);
        name = image_name(1:end-4);
        a=num2str(k);
        save_dir = mkdir(['../distorted_viewports/', name, '/']);
        imwrite(vpD, ['../distorted_viewports/', name, '/', name, '-', a, '.png']);
    end
end


