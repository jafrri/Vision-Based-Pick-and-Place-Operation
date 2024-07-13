function []=frame_plotter(img,frames)
    [m n]=size(frames);
    figure;
    imshow(img);hold on
    for i=1:m
        row=frames(i,:);
        x_origin=row(1);
        y_origin=row(2);

        x1_dir=row(3);
        y1_dir=row(4);

        x2_dir=row(5);
        y2_dir=row(6);
        % orthogonal=dot([x1_dir y1_dir],[x2_dir y2_dir])/(abs([x1_dir y1_dir])*abs([x2_dir y2_dir]))
        quiver(x_origin,y_origin,x1_dir,y1_dir,2,'r','LineWidth',2);
        quiver(x_origin,y_origin,x2_dir,y2_dir,2,'g','LineWidth',2);
    end
end