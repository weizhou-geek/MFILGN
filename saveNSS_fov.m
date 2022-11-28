close all;
clear all;
clc;


image_dir = '../distorted_viewports/';
image_dir1 = dir(image_dir);

image_name = cell(320,1);
for i = 3:length(image_dir1)
    i-2
    image_dir2 = dir([image_dir, image_dir1(i).name]);
    image_name(i-2) = cellstr(image_dir1(i).name);
%     feat=[];
    for j = 3:length(image_dir2)
        name = image_dir2(j).name;
        f2 = rgb2gray(imread([image_dir, image_dir1(i).name, '/', name]));
        [~,~,f2] = ZCA(f2);
        feat(:,j-2) = brisque_feature_R(f2);
%         feat = [feat;brisque_feature_R(f2)'];
    end
    NSS_feat(:,i-2) = mean(feat,2);
end

save('NSSfeature_viewport.mat','NSS_feat','image_name');


