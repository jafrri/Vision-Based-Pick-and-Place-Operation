% clear all
close all
[ptCloud,depthframe,colorframe,intrinsics,depth_scaling]=pointcloud_example();
% [img,depth]=good_depth_example();

% ptCloud_out=pcfromdepth(depthframe,1/depth_scaling,intrinsics,"ColorImage",colorframe);
% pchsow(ptCloud_out)

[binary_red,binaryred_mask]=createredMask(colorframe);
depthframe(~binary_red)=inf;
ptCloud_out=pcfromdepth(depthframe,1/depth_scaling,intrinsics,"ColorImage",colorframe);
[ptCloud_out,indices]=removeInvalidPoints(ptCloud_out);
figure;
pcshow(ptCloud_out,'MarkerSize',30,'BackgroundColor','w')
xlabel("X Axis")
ylabel('Y Axis')
zlabel('Z Axis')

[label, numClusters]=pcsegdist(ptCloud_out,0.03);

idxValidPoints = find(label);
labelColorIndex = label(idxValidPoints);
linear_indices=find(label==1);
segmentedPtCloud = select(ptCloud_out,idxValidPoints(linear_indices));
figure;

spacing = 7;
factor = 0.0003;
% Create 3D grid
[X, Y, Z] = ndgrid(1:spacing:100, 1:spacing:100, 1:spacing:100);
[X_in, Y_in, Z_in] = ndgrid(2:spacing:99, 2:spacing:99, 2:spacing:99); %for hollowing out the cube point cloud  
X = X*factor;
Y = Y*factor;
Z = Z*(factor);
X_in = X_in*factor;
Y_in = Y_in*factor;
Z_n = Z_in*factor;
% Combine coordinates into point cloud


pointCloud2 = [X(:), Y(:), Z(:)];
% hollower_cube = [X_in(:), Y_in(:), Z_in(:)];
pointCloud2=pointCloud(pointCloud2);
% hollower_cube = pointCloud(hollower_cube);
% pointCloud2 = pointCloud2.Location - hollower_cube.Location;
% new_ptcloudhollow = setxor(pointCloud2.Location, hollower_cube.Location, 'rows')
tform=pcregistericp(pointCloud2,segmentedPtCloud);

% Elimination of xy rotaion

euler=rotm2eul(tform.R);
euler1=[euler(:,1) 0 0];
rotation=eul2rotm(euler1);
tform.R=rotation;
ptCloud_transform=pctransform(pointCloud2,tform);

tform.Translation=tform.Translation*1000;
T_wc=[0 1 0 0.5;1 0 0 -0.9;0 0 -1 819;0 0 0 1];
T_world=T_wc*tform.A;
phi=atan2(T_world(2,1),T_world(1,1));

% pcshow(pointCloud2)
pcshow(segmentedPtCloud,"BackgroundColor",'w','MarkerSize',50);hold on
pcshow(ptCloud_transform,'BackgroundColor','w','MarkerSize',20);
xlabel("X Axis")
ylabel('Y Axis')
zlabel('Z Axis')
hold off

figure
colormap(hsv(numClusters))
pcshow(ptCloud_out.Location,labelColorIndex)
title('Point Cloud Clusters')






