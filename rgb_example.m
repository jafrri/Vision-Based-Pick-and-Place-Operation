function [image, depth_range] = rgb_example()
    % Make Pipeline object to manage streaming
    pipe = realsense.pipeline();
    % Make Colorizer object to prettify depth output
    colorizer = realsense.colorizer();

       
    % Start streaming on an arbitrary camera with default settings
    % profile = pipe.start();

    % ... (rest of your code remains the same)

    % Start streaming on an arbitrary camera with default settings
    profile = pipe.start();

    % Get streaming device's name
    dev = profile.get_device();
    name = dev.get_info(realsense.camera_info.name);

    % Get frames. We discard the first couple to allow
    % the camera time to settle
    for i = 1:15
        fs = pipe.wait_for_frames();
    end
    
    % Stop streaming
    pipe.stop();

    % Select color frame
    color = fs.get_color_frame();
    depth=fs.get_depth_frame();

    % Get actual data and convert into a format imshow can use
    % (Color data arrives as [R, G, B, R, G, B, ...] vector)
    data = color.get_data();
    img = permute(reshape(data',[3,color.get_width(),color.get_height()]),[3 2 1]);

    % Display image
    % imshow(img);
    % title(sprintf("RGB frame from %s", name));
    image=img;
    depth_range=depth;
end
